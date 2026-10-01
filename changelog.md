# 📜 Registro Histórico de Cambios (CHANGELOG) — Cardex

Todas las modificaciones notables de este proyecto están documentadas bajo el estándar de [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/) y siguen Conventional Commits en MAYÚSCULAS.

---

## [Unreleased] - Fase 5: Backend Supabase & Edge Functions

### FEAT
- **ui/presentation**: fondo dinámico adaptativo en `Card3DViewer` con degradado radial de 5 paradas con decaimiento gaussiano suave hacia el negro puro OLED (`#000000`).
- **ui/presentation**: iluminación reactiva con desplazamiento de paralaje táctil en tiempo real (`parallaxX` y `parallaxY`) al rotar cartas físicas en 3D.
- **ui/presentation**: resplandor difuso ambiental posterior a la silueta de la carta física e interpolación suave con `animateColorAsState` (650 ms).
- **core/theme**: función de extensión centralizada `getConditionGradeColor` en `Color.kt` con resolución continua de Float inmutable y textual de Grados oficiales TCG.
- **backend**: migración SQL completa de Supabase con tablas `profiles`, `cards_catalog`, `card_instances`, `market_listings` y `price_history`.
- **security**: políticas estrictas de Row Level Security (RLS) y función RPC `check_and_consume_daily_scan` con bloqueo pesimista `FOR UPDATE` para control de cuotas diarias (FREE: 5 / PRO: 10 cartas).
- **edge-function**: motor algorítmico del Float continuo de 9 decimales en TypeScript/Deno con Slab Bypass para losas acrílicas (PSA/BGS/CGC) y firma criptográfica HMAC-SHA256 inmutable.
- **valuation**: módulo de detección de cartas 'Santo Grial' y cálculo dinámico de tasación histórica según float y rareza.
- **monetization**: Edge Function `lemonsqueezy-webhook` con validación criptográfica de firmas para sincronización de suscripciones PRO.
- **data**: sembrado masivo e ingesta de las 177 cartas físicas reales (120 Oficiales + 57 Genéricas con `custom_stats` en JSONB) tanto en `supabase/seed.sql` como localmente en Android mediante `PhysicalCardSeeder.kt`.

- **neon**: aprovisionamiento e integración de Neon Cloud (PostgreSQL 16 serverless, Object Storage con bucket `card-images` público y Neon Functions para APIs en el borde).

### STYLE
- **viewer3d**: simplificación de la píldora superior del visor 3D a `Anverso` y `Reverso`, eliminando texto redundante de `(Cara A)` y `(Cara B)`.
- **theme**: actualización de `CommonBlue` a `#0A84FF` (azul eléctrico zafiro Apple HIG) para garantizar luminancia y contraste sobre pantallas OLED `#000000`.

### TEST
- **theme**: suite unitaria `ConditionGradeColorTest` con cobertura exhaustiva de umbrales numéricos de float, etiquetas oficiales y casos nulos/fallback.
- **edge-function**: suite TDD de 6 pruebas unitarias para el motor de cálculo del Float con cobertura al 100%.
- **webhook**: pruebas unitarias de verificación de firmas HMAC-SHA256 para eventos de Lemon Squeezy.
- **android**: pruebas unitarias para `PhysicalCardSeeder` y operaciones por lotes `saveCards` en `CardRepository`.
