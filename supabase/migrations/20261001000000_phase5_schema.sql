-- ============================================================================
-- 🃏 CARDEX BACKEND SCHEMA - FASE 5 (Supabase PostgreSQL 15+)
-- Arquitectura ACID con Bloqueo Pesimista, RLS y Cuotas Diarias
-- ============================================================================

-- Habilitar extensiones criptográficas y de UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================================
-- 1. TABLA DE PERFILES Y MONETIZACIÓN (Lemon Squeezy SaaS)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    full_name TEXT,
    subscription_tier TEXT NOT NULL DEFAULT 'FREE' CHECK (subscription_tier IN ('FREE', 'PRO')),
    lemon_squeezy_customer_id TEXT,
    lemon_squeezy_subscription_id TEXT,
    daily_scans_used INT NOT NULL DEFAULT 0,
    daily_scans_reset_at TIMESTAMPTZ NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL '1 day'),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 2. TABLA DEL CATÁLOGO MAESTRO (Oficiales y Genéricas)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.cards_catalog (
    id VARCHAR(64) PRIMARY KEY, -- Ej: 'POK-SV2A-025' o 'GEN-DRAGON-001'
    card_type VARCHAR(16) NOT NULL CHECK (card_type IN ('OFFICIAL', 'GENERIC')),
    name TEXT NOT NULL,
    set_code VARCHAR(32),
    card_number VARCHAR(16),
    rarity VARCHAR(32),
    official_image_url TEXT,
    is_holy_grail BOOLEAN NOT NULL DEFAULT FALSE,
    base_historical_price_pen NUMERIC(12, 2) DEFAULT 0.00,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 3. TABLA DE INSTANCIAS DE CARTAS (Inventario Físico / Float System)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.card_instances (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    card_id VARCHAR(64) NOT NULL REFERENCES public.cards_catalog(id),
    float_value NUMERIC(10, 9) CHECK (float_value IS NULL OR (float_value >= 0.000000000 AND float_value <= 1.000000000)),
    wear_tier VARCHAR(32) NOT NULL CHECK (wear_tier IN ('PRISTINE', 'NEAR_MINT', 'LIGHT_PLAY', 'MODERATE_PLAY', 'DAMAGED')),
    is_slab BOOLEAN NOT NULL DEFAULT FALSE,
    slab_company VARCHAR(16) CHECK (slab_company IN ('PSA', 'BGS', 'CGC', 'OTHER')),
    slab_cert_number VARCHAR(32),
    slab_grade VARCHAR(16),
    finish_variant VARCHAR(32) NOT NULL DEFAULT 'REGULAR'
        CHECK (finish_variant IN ('REGULAR', 'HOLO', 'REVERSE_HOLO', 'TEXTURED_FULL_ART', 'SECRET_RARE')),
    is_oversized BOOLEAN NOT NULL DEFAULT FALSE,
    front_photo_url TEXT NOT NULL,
    back_photo_url TEXT NOT NULL,
    thumbnail_url TEXT NOT NULL,
    phash_front VARCHAR(64),
    phash_back VARCHAR(64),
    hmac_signature VARCHAR(64) NOT NULL, -- Firma criptográfica emitida por la Edge Function
    verification_status VARCHAR(32) NOT NULL DEFAULT 'VERIFIED_LIVE'
        CHECK (verification_status IN ('VERIFIED_LIVE', 'GALLERY_PENDING', 'REJECTED')),
    custom_stats JSONB DEFAULT '{}'::jsonb, -- ATK, DEF, Tipo elemental para genéricas
    estimated_price_pen NUMERIC(12, 2) DEFAULT 0.00,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 4. TABLA DEL MERCADO (Listings con Bloqueo Concurrente)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.market_listings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    card_instance_id UUID NOT NULL UNIQUE REFERENCES public.card_instances(id) ON DELETE CASCADE,
    seller_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    price_pen NUMERIC(10, 2) NOT NULL CHECK (price_pen > 0),
    status VARCHAR(16) NOT NULL DEFAULT 'AVAILABLE'
        CHECK (status IN ('AVAILABLE', 'RESERVED', 'SOLD', 'CANCELLED')),
    reserved_by UUID REFERENCES public.profiles(id),
    reserved_until TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 5. TABLA DE HISTORIAL DE PRECIOS (Guía de Precios y Transacciones)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.price_history (
    id BIGSERIAL PRIMARY KEY,
    card_id VARCHAR(64) NOT NULL REFERENCES public.cards_catalog(id),
    card_type VARCHAR(16) NOT NULL,
    sale_price_pen NUMERIC(10, 2) NOT NULL,
    float_value NUMERIC(10, 9) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 6. ÍNDICES DE ALTO RENDIMIENTO
-- ============================================================================
CREATE INDEX IF NOT EXISTS idx_card_instances_user ON public.card_instances(user_id);
CREATE INDEX IF NOT EXISTS idx_card_instances_card ON public.card_instances(card_id);
CREATE INDEX IF NOT EXISTS idx_card_instances_float ON public.card_instances(float_value);
CREATE INDEX IF NOT EXISTS idx_card_instances_wear ON public.card_instances(wear_tier);
CREATE INDEX IF NOT EXISTS idx_market_listings_status ON public.market_listings(status) WHERE status = 'AVAILABLE';
CREATE INDEX IF NOT EXISTS idx_price_history_card ON public.price_history(card_id, created_at DESC);

-- ============================================================================
-- 7. POLÍTICAS DE ROW LEVEL SECURITY (RLS)
-- ============================================================================
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cards_catalog ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.card_instances ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.market_listings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.price_history ENABLE ROW LEVEL SECURITY;

-- 7.1 Catálogo Maestro y Precios (Lectura pública)
CREATE POLICY "Lectura pública de catálogo maestro" ON public.cards_catalog
    FOR SELECT USING (true);

CREATE POLICY "Lectura pública de historial de precios" ON public.price_history
    FOR SELECT USING (true);

-- 7.2 Profiles
CREATE POLICY "Lectura pública de perfiles" ON public.profiles
    FOR SELECT USING (true);

CREATE POLICY "Solo el dueño puede editar su perfil" ON public.profiles
    FOR UPDATE USING (auth.uid() = id);

-- 7.3 Card Instances
CREATE POLICY "Lectura pública de instancias de cartas" ON public.card_instances
    FOR SELECT USING (true);

CREATE POLICY "Solo el dueño puede registrar o borrar sus cartas" ON public.card_instances
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Solo el dueño puede actualizar su carta" ON public.card_instances
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Solo el dueño puede eliminar su carta" ON public.card_instances
    FOR DELETE USING (auth.uid() = user_id);

-- 7.4 Market Listings
CREATE POLICY "Lectura pública de listings en venta o reservados" ON public.market_listings
    FOR SELECT USING (status IN ('AVAILABLE', 'RESERVED'));

CREATE POLICY "Solo el vendedor puede crear un listing" ON public.market_listings
    FOR INSERT WITH CHECK (auth.uid() = seller_id);

CREATE POLICY "Solo el vendedor puede actualizar o cancelar su listing" ON public.market_listings
    FOR UPDATE USING (auth.uid() = seller_id);

-- ============================================================================
-- 8. FUNCIONES RPC DE BASE DE DATOS
-- ============================================================================

-- 8.1 Control Transaccional de Cuotas Diarias (FREE: 5, PRO: 10)
CREATE OR REPLACE FUNCTION public.check_and_consume_daily_scan(
    p_user_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_profile RECORD;
    v_limit INT;
    v_now TIMESTAMPTZ := CURRENT_TIMESTAMP;
BEGIN
    -- Bloqueo pesimista de la fila del perfil para evitar race conditions en escaneos paralelos
    SELECT id, subscription_tier, daily_scans_used, daily_scans_reset_at
    INTO v_profile
    FROM public.profiles
    WHERE id = p_user_id
    FOR UPDATE;

    IF NOT FOUND THEN
        RETURN jsonb_build_object(
            'allowed', false,
            'message', 'Perfil no encontrado.'
        );
    END IF;

    -- Reinicio de cuota si transcurrieron las 24 horas
    IF v_now >= v_profile.daily_scans_reset_at THEN
        UPDATE public.profiles
        SET daily_scans_used = 0,
            daily_scans_reset_at = v_now + INTERVAL '1 day',
            updated_at = v_now
        WHERE id = p_user_id;

        v_profile.daily_scans_used := 0;
    END IF;

    -- Límite estricto según suscripción
    IF v_profile.subscription_tier = 'PRO' THEN
        v_limit := 10;
    ELSE
        v_limit := 5;
    END IF;

    -- Comprobar si excedió la cuota
    IF v_profile.daily_scans_used >= v_limit THEN
        RETURN jsonb_build_object(
            'allowed', false,
            'tier', v_profile.subscription_tier,
            'scans_used', v_profile.daily_scans_used,
            'limit', v_limit,
            'message', format('Límite diario de %s cartas alcanzado para el plan %s.', v_limit, v_profile.subscription_tier)
        );
    END IF;

    -- Consumir 1 escaneo atómicamente
    UPDATE public.profiles
    SET daily_scans_used = daily_scans_used + 1,
        updated_at = v_now
    WHERE id = p_user_id;

    RETURN jsonb_build_object(
        'allowed', true,
        'tier', v_profile.subscription_tier,
        'scans_used', v_profile.daily_scans_used + 1,
        'scans_remaining', v_limit - (v_profile.daily_scans_used + 1),
        'limit', v_limit
    );
END;
$$;

-- 8.2 Función de Bloqueo Pesimista para el Marketplace (CC232 / CC341)
CREATE OR REPLACE FUNCTION public.reserve_card_for_purchase(
    p_listing_id UUID,
    p_buyer_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_listing RECORD;
BEGIN
    -- 1. Bloqueo pesimista de fila en milisegundos (FOR UPDATE)
    SELECT id, seller_id, status, price_pen INTO v_listing
    FROM public.market_listings
    WHERE id = p_listing_id
    FOR UPDATE;

    -- 2. Validar existencia
    IF NOT FOUND THEN
        RETURN jsonb_build_object('success', false, 'message', 'El anuncio no existe.');
    END IF;

    -- 3. Evitar que el vendedor se compre su propia carta
    IF v_listing.seller_id = p_buyer_id THEN
        RETURN jsonb_build_object('success', false, 'message', 'No puedes comprar tu propia carta.');
    END IF;

    -- 4. Validar disponibilidad
    IF v_listing.status <> 'AVAILABLE' THEN
        RETURN jsonb_build_object('success', false, 'message', 'Esta carta ya ha sido reservada o vendida.');
    END IF;

    -- 5. Adquirir candado: Estado RESERVED por 5 minutos
    UPDATE public.market_listings
    SET status = 'RESERVED',
        reserved_by = p_buyer_id,
        reserved_until = CURRENT_TIMESTAMP + INTERVAL '5 minutes',
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_listing_id;

    RETURN jsonb_build_object(
        'success', true,
        'message', 'Carta reservada con éxito por 5 minutos.',
        'price_pen', v_listing.price_pen
    );
END;
$$;

-- ============================================================================
-- 9. CONFIGURACIÓN DE STORAGE BUCKET (card-images)
-- ============================================================================
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'card-images',
    'card-images',
    true,
    52428800, -- 50 MB
    ARRAY['image/webp', 'image/jpeg', 'image/png']
)
ON CONFLICT (id) DO NOTHING;

-- Políticas de Storage
CREATE POLICY "Lectura pública de fotos de cartas" ON storage.objects
    FOR SELECT USING (bucket_id = 'card-images');

CREATE POLICY "Solo usuarios autenticados suben fotos" ON storage.objects
    FOR INSERT WITH CHECK (
        bucket_id = 'card-images' AND
        auth.role() = 'authenticated'
    );
