-- ============================================================================
-- 🃏 CARDEX SEED DATA (177 Cartas Físicas Ingestadas: 120 Oficiales + 57 Genéricas)
-- ============================================================================

-- Usuario Propietario Inicial (Marco Antonio Huamani Bonifacio)
INSERT INTO auth.users (id, email)
VALUES ('00000000-0000-0000-0000-000000000001', 'marco.huamani.b@uni.pe')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.profiles (id, email, full_name, subscription_tier, daily_scans_used)
VALUES (
    '00000000-0000-0000-0000-000000000001',
    'marco.huamani.b@uni.pe',
    'Marco Antonio Huamani Bonifacio',
    'PRO',
    0
)
ON CONFLICT (id) DO UPDATE
SET subscription_tier = 'PRO';

-- INSERCIÓN DEL CATÁLOGO MAESTRO (177 Cartas)
INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-PROMO-ILLUSTRATOR', 'OFFICIAL', 'Pikachu Illustrator', 'PROMO-1998', 'PROMO', 'Holy Grail Promo', 'https://images.cardex.pe/catalog/pok-promo-illustrator.webp', true, 18500000.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-BASE-004-1ST', 'OFFICIAL', 'Charizard 1st Edition Shadowless', 'BASE-1999', '4/102', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-base-004-1st.webp', true, 1200000.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-PROMO-BLASTOISE-PRES', 'OFFICIAL', 'Blastoise Presentation Galaxy Holo', 'PROMO-1998', 'TEST', 'Presentation Promo', 'https://images.cardex.pe/catalog/pok-promo-blastoise-pres.webp', true, 1300000.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-PROMO-TRAINER-1', 'OFFICIAL', 'Trainer No. 1 Super Battle', 'PROMO-1999', 'TRAINER-1', 'Championship Promo', 'https://images.cardex.pe/catalog/pok-promo-trainer-1.webp', true, 350000.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-STAR-RAYQUAZA-107', 'OFFICIAL', 'Rayquaza Gold Star', 'EX-DEOXYS', '107/107', 'Ultra Rare Gold Star', 'https://images.cardex.pe/catalog/pok-star-rayquaza-107.webp', true, 180000.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-025', 'OFFICIAL', 'Pikachu Art Rare (Master Ball Holo)', 'SV2A-151', '025/165', 'Art Rare', 'https://images.cardex.pe/catalog/pok-sv2a-025.webp', false, 480.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-006', 'OFFICIAL', 'Charizard ex Special Illustration Rare', 'SV2A-151', '201/165', 'Special Illustration Rare', 'https://images.cardex.pe/catalog/pok-sv2a-006.webp', false, 850.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-009', 'OFFICIAL', 'Blastoise ex Special Illustration Rare', 'SV2A-151', '202/165', 'Special Illustration Rare', 'https://images.cardex.pe/catalog/pok-sv2a-009.webp', false, 320.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-003', 'OFFICIAL', 'Venusaur ex Special Illustration Rare', 'SV2A-151', '200/165', 'Special Illustration Rare', 'https://images.cardex.pe/catalog/pok-sv2a-003.webp', false, 280.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-151', 'OFFICIAL', 'Mew ex Hyper Rare (Gold)', 'SV2A-151', '208/165', 'Hyper Rare', 'https://images.cardex.pe/catalog/pok-sv2a-151.webp', false, 450.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-143', 'OFFICIAL', 'Snorlax Illustration Rare', 'SV2A-151', '181/165', 'Illustration Rare', 'https://images.cardex.pe/catalog/pok-sv2a-143.webp', false, 120.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-133', 'OFFICIAL', 'Eevee Master Ball Mirror', 'SV2A-151', '133/165', 'Mirror Holo', 'https://images.cardex.pe/catalog/pok-sv2a-133.webp', false, 260.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-094', 'OFFICIAL', 'Gengar Master Ball Mirror', 'SV2A-151', '094/165', 'Mirror Holo', 'https://images.cardex.pe/catalog/pok-sv2a-094.webp', false, 310.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-150', 'OFFICIAL', 'Mewtwo Illustration Rare', 'SV2A-151', '183/165', 'Illustration Rare', 'https://images.cardex.pe/catalog/pok-sv2a-150.webp', false, 190.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-SV2A-065', 'OFFICIAL', 'Alakazam ex Ultra Rare', 'SV2A-151', '188/165', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-sv2a-065.webp', false, 95.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-BASE-002', 'OFFICIAL', 'Blastoise Holo (Unlimited)', 'BASE-1999', '2/102', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-base-002.webp', false, 450.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-BASE-015', 'OFFICIAL', 'Venusaur Holo (Unlimited)', 'BASE-1999', '15/102', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-base-015.webp', false, 380.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-BASE-016', 'OFFICIAL', 'Zapdos Holo', 'BASE-1999', '16/102', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-base-016.webp', false, 180.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-BASE-058', 'OFFICIAL', 'Pikachu (Red Cheeks)', 'BASE-1999', '58/102', 'Common', 'https://images.cardex.pe/catalog/pok-base-058.webp', false, 150.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-JUNGLE-001', 'OFFICIAL', 'Clefable Holo 1st Edition', 'JUNGLE-1999', '1/64', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-jungle-001.webp', false, 220.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-JUNGLE-004', 'OFFICIAL', 'Jolteon Holo', 'JUNGLE-1999', '4/64', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-jungle-004.webp', false, 240.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-JUNGLE-003', 'OFFICIAL', 'Flareon Holo', 'JUNGLE-1999', '3/64', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-jungle-003.webp', false, 230.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-JUNGLE-012', 'OFFICIAL', 'Vaporeon Holo', 'JUNGLE-1999', '12/64', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-jungle-012.webp', false, 235.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-FOSSIL-001', 'OFFICIAL', 'Aerodactyl Holo Prerelease', 'FOSSIL-1999', '1/62', 'Prerelease Promo', 'https://images.cardex.pe/catalog/pok-fossil-001.webp', false, 350.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-FOSSIL-002', 'OFFICIAL', 'Articuno Holo', 'FOSSIL-1999', '2/62', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-fossil-002.webp', false, 210.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-FOSSIL-004', 'OFFICIAL', 'Dragonite Holo 1st Edition', 'FOSSIL-1999', '4/62', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-fossil-004.webp', false, 550.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-FOSSIL-007', 'OFFICIAL', 'Hitmonlee Holo', 'FOSSIL-1999', '7/62', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-fossil-007.webp', false, 110.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-FOSSIL-008', 'OFFICIAL', 'Hypno Holo', 'FOSSIL-1999', '8/62', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-fossil-008.webp', false, 95.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-ROCKET-001', 'OFFICIAL', 'Dark Alakazam Holo 1st Edition', 'ROCKET-2000', '1/82', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-rocket-001.webp', false, 320.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-ROCKET-003', 'OFFICIAL', 'Dark Blastoise Holo 1st Edition', 'ROCKET-2000', '3/82', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-rocket-003.webp', false, 650.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-ROCKET-004', 'OFFICIAL', 'Dark Charizard Holo 1st Edition', 'ROCKET-2000', '4/82', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-rocket-004.webp', false, 1100.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-ROCKET-005', 'OFFICIAL', 'Dark Dragonite Holo', 'ROCKET-2000', '5/82', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-rocket-005.webp', false, 290.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-ROCKET-008', 'OFFICIAL', 'Dark Gyarados Holo Prerelease', 'ROCKET-2000', '8/82', 'Prerelease Promo', 'https://images.cardex.pe/catalog/pok-rocket-008.webp', false, 160.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO1-009', 'OFFICIAL', 'Lugia Holo 1st Edition', 'NEO-GENESIS-2000', '9/111', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-neo1-009.webp', false, 1850.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO1-017', 'OFFICIAL', 'Typhlosion T17 Holo', 'NEO-GENESIS-2000', '17/111', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-neo1-017.webp', false, 750.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO2-001', 'OFFICIAL', 'Espeon Holo 1st Edition', 'NEO-DISCOVERY-2001', '1/75', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-neo2-001.webp', false, 480.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO2-013', 'OFFICIAL', 'Umbreon Holo 1st Edition', 'NEO-DISCOVERY-2001', '13/75', 'Holo Rare', 'https://images.cardex.pe/catalog/pok-neo2-013.webp', false, 950.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO3-065', 'OFFICIAL', 'Shining Magikarp 1st Edition', 'NEO-REVELATION-2001', '65/64', 'Secret Rare Shining', 'https://images.cardex.pe/catalog/pok-neo3-065.webp', false, 1400.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO3-066', 'OFFICIAL', 'Shining Gyarados 1st Edition', 'NEO-REVELATION-2001', '66/64', 'Secret Rare Shining', 'https://images.cardex.pe/catalog/pok-neo3-066.webp', false, 2200.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO4-107', 'OFFICIAL', 'Shining Charizard 1st Edition', 'NEO-DESTINY-2002', '107/105', 'Secret Rare Shining', 'https://images.cardex.pe/catalog/pok-neo4-107.webp', false, 4500.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO4-109', 'OFFICIAL', 'Shining Mewtwo 1st Edition', 'NEO-DESTINY-2002', '109/105', 'Secret Rare Shining', 'https://images.cardex.pe/catalog/pok-neo4-109.webp', false, 2100.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-NEO4-113', 'OFFICIAL', 'Shining Tyranitar 1st Edition', 'NEO-DESTINY-2002', '113/105', 'Secret Rare Shining', 'https://images.cardex.pe/catalog/pok-neo4-113.webp', false, 1750.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-043', 'OFFICIAL', 'Arcanine VSTAR / Illustration Rare', 'SWSH-CRZ', '043/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-043.webp', false, 82.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-044', 'OFFICIAL', 'Gengar VSTAR / Illustration Rare', 'SWSH-CRZ', '044/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-044.webp', false, 95.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-045', 'OFFICIAL', 'Alakazam VSTAR / Illustration Rare', 'SWSH-CRZ', '045/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-045.webp', false, 107.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-046', 'OFFICIAL', 'Machamp VSTAR / Illustration Rare', 'SWSH-CRZ', '046/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-046.webp', false, 120.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-047', 'OFFICIAL', 'Scizor VSTAR / Illustration Rare', 'SWSH-CRZ', '047/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-047.webp', false, 132.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-048', 'OFFICIAL', 'Heracross VSTAR / Illustration Rare', 'SWSH-CRZ', '048/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-048.webp', false, 145.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-049', 'OFFICIAL', 'Tyranitar VSTAR / Illustration Rare', 'SWSH-CRZ', '049/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-049.webp', false, 157.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-050', 'OFFICIAL', 'Salamence VSTAR / Illustration Rare', 'SWSH-CRZ', '050/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-050.webp', false, 170.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-051', 'OFFICIAL', 'Metagross VSTAR / Illustration Rare', 'SWSH-CRZ', '051/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-051.webp', false, 182.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-052', 'OFFICIAL', 'Lucario VSTAR / Illustration Rare', 'SWSH-CRZ', '052/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-052.webp', false, 195.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-053', 'OFFICIAL', 'Garchomp VSTAR / Illustration Rare', 'SWSH-CRZ', '053/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-053.webp', false, 207.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-054', 'OFFICIAL', 'Gardevoir VSTAR / Illustration Rare', 'SWSH-CRZ', '054/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-054.webp', false, 220.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-055', 'OFFICIAL', 'Gallade VSTAR / Illustration Rare', 'SWSH-CRZ', '055/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-055.webp', false, 232.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-056', 'OFFICIAL', 'Greninja VSTAR / Illustration Rare', 'SWSH-CRZ', '056/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-056.webp', false, 245.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-057', 'OFFICIAL', 'Decidueye VSTAR / Illustration Rare', 'SWSH-CRZ', '057/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-057.webp', false, 257.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-058', 'OFFICIAL', 'Zeraora VSTAR / Illustration Rare', 'SWSH-CRZ', '058/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-058.webp', false, 270.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-059', 'OFFICIAL', 'Dragapult VSTAR / Illustration Rare', 'SWSH-CRZ', '059/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-059.webp', false, 282.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-060', 'OFFICIAL', 'Corviknight VSTAR / Illustration Rare', 'SWSH-CRZ', '060/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-060.webp', false, 45.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-061', 'OFFICIAL', 'Ceruledge VSTAR / Illustration Rare', 'SWSH-CRZ', '061/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-061.webp', false, 57.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-062', 'OFFICIAL', 'Armarouge VSTAR / Illustration Rare', 'SWSH-CRZ', '062/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-062.webp', false, 70.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-063', 'OFFICIAL', 'Baxcalibur VSTAR / Illustration Rare', 'SWSH-CRZ', '063/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-063.webp', false, 82.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-064', 'OFFICIAL', 'Tinkaton VSTAR / Illustration Rare', 'SWSH-CRZ', '064/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-064.webp', false, 95.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-065', 'OFFICIAL', 'Roaring Moon VSTAR / Illustration Rare', 'SWSH-CRZ', '065/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-065.webp', false, 107.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-066', 'OFFICIAL', 'Iron Valiant VSTAR / Illustration Rare', 'SWSH-CRZ', '066/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-066.webp', false, 120.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-067', 'OFFICIAL', 'Koraidon VSTAR / Illustration Rare', 'SWSH-CRZ', '067/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-067.webp', false, 132.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-068', 'OFFICIAL', 'Miraidon VSTAR / Illustration Rare', 'SWSH-CRZ', '068/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-068.webp', false, 145.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-069', 'OFFICIAL', 'Ogerpon VSTAR / Illustration Rare', 'SWSH-CRZ', '069/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-069.webp', false, 157.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-070', 'OFFICIAL', 'Terapagos VSTAR / Illustration Rare', 'SWSH-CRZ', '070/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-070.webp', false, 170.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-071', 'OFFICIAL', 'Rayquaza VSTAR / Illustration Rare', 'SWSH-CRZ', '071/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-071.webp', false, 182.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-072', 'OFFICIAL', 'Kyogre VSTAR / Illustration Rare', 'SWSH-CRZ', '072/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-072.webp', false, 195.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-073', 'OFFICIAL', 'Groudon VSTAR / Illustration Rare', 'SWSH-CRZ', '073/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-073.webp', false, 207.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-074', 'OFFICIAL', 'Dialga VSTAR / Illustration Rare', 'SWSH-CRZ', '074/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-074.webp', false, 220.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-075', 'OFFICIAL', 'Palkia VSTAR / Illustration Rare', 'SWSH-CRZ', '075/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-075.webp', false, 232.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-076', 'OFFICIAL', 'Giratina VSTAR / Illustration Rare', 'SWSH-CRZ', '076/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-076.webp', false, 245.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-077', 'OFFICIAL', 'Arceus VSTAR / Illustration Rare', 'SWSH-CRZ', '077/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-077.webp', false, 257.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-078', 'OFFICIAL', 'Reshiram VSTAR / Illustration Rare', 'SWSH-CRZ', '078/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-078.webp', false, 270.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-079', 'OFFICIAL', 'Zekrom VSTAR / Illustration Rare', 'SWSH-CRZ', '079/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-079.webp', false, 282.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-080', 'OFFICIAL', 'Kyurem VSTAR / Illustration Rare', 'SWSH-CRZ', '080/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-080.webp', false, 45.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-081', 'OFFICIAL', 'Xerneas VSTAR / Illustration Rare', 'SWSH-CRZ', '081/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-081.webp', false, 57.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-082', 'OFFICIAL', 'Yveltal VSTAR / Illustration Rare', 'SWSH-CRZ', '082/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-082.webp', false, 70.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-083', 'OFFICIAL', 'Zygarde VSTAR / Illustration Rare', 'SWSH-CRZ', '083/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-083.webp', false, 82.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-084', 'OFFICIAL', 'Solgaleo VSTAR / Illustration Rare', 'SWSH-CRZ', '084/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-084.webp', false, 95.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-085', 'OFFICIAL', 'Lunala VSTAR / Illustration Rare', 'SWSH-CRZ', '085/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-085.webp', false, 107.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-086', 'OFFICIAL', 'Necrozma VSTAR / Illustration Rare', 'SWSH-CRZ', '086/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-086.webp', false, 120.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-087', 'OFFICIAL', 'Zacian VSTAR / Illustration Rare', 'SWSH-CRZ', '087/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-087.webp', false, 132.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-088', 'OFFICIAL', 'Zamazenta VSTAR / Illustration Rare', 'SWSH-CRZ', '088/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-088.webp', false, 145.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-089', 'OFFICIAL', 'Eternatus VSTAR / Illustration Rare', 'SWSH-CRZ', '089/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-089.webp', false, 157.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-090', 'OFFICIAL', 'Urshifu VSTAR / Illustration Rare', 'SWSH-CRZ', '090/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-090.webp', false, 170.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-091', 'OFFICIAL', 'Calyrex VSTAR / Illustration Rare', 'SWSH-CRZ', '091/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-091.webp', false, 182.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-092', 'OFFICIAL', 'Chien-Pao VSTAR / Illustration Rare', 'SWSH-CRZ', '092/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-092.webp', false, 195.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-093', 'OFFICIAL', 'Chi-Yu VSTAR / Illustration Rare', 'SWSH-CRZ', '093/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-093.webp', false, 207.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-094', 'OFFICIAL', 'Ting-Lu VSTAR / Illustration Rare', 'SWSH-CRZ', '094/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-094.webp', false, 220.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-095', 'OFFICIAL', 'Wo-Chien VSTAR / Illustration Rare', 'SWSH-CRZ', '095/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-095.webp', false, 232.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-096', 'OFFICIAL', 'Walking Wake VSTAR / Illustration Rare', 'SWSH-CRZ', '096/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-096.webp', false, 245.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-097', 'OFFICIAL', 'Iron Leaves VSTAR / Illustration Rare', 'SWSH-CRZ', '097/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-097.webp', false, 257.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-098', 'OFFICIAL', 'Gouging Fire VSTAR / Illustration Rare', 'SWSH-CRZ', '098/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-098.webp', false, 270.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-099', 'OFFICIAL', 'Raging Bolt VSTAR / Illustration Rare', 'SWSH-CRZ', '099/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-099.webp', false, 282.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-100', 'OFFICIAL', 'Iron Boulder VSTAR / Illustration Rare', 'SWSH-CRZ', '100/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-100.webp', false, 45.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-101', 'OFFICIAL', 'Iron Crown VSTAR / Illustration Rare', 'SWSH-CRZ', '101/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-101.webp', false, 57.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-102', 'OFFICIAL', 'Pecharunt VSTAR / Illustration Rare', 'SWSH-CRZ', '102/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-102.webp', false, 70.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-103', 'OFFICIAL', 'Bulbasaur VSTAR / Illustration Rare', 'SWSH-CRZ', '103/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-103.webp', false, 82.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-104', 'OFFICIAL', 'Ivysaur VSTAR / Illustration Rare', 'SWSH-CRZ', '104/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-104.webp', false, 95.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-105', 'OFFICIAL', 'Charmander VSTAR / Illustration Rare', 'SWSH-CRZ', '105/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-105.webp', false, 107.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-106', 'OFFICIAL', 'Charmeleon VSTAR / Illustration Rare', 'SWSH-CRZ', '106/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-106.webp', false, 120.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-107', 'OFFICIAL', 'Squirtle VSTAR / Illustration Rare', 'SWSH-CRZ', '107/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-107.webp', false, 132.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-108', 'OFFICIAL', 'Wartortle VSTAR / Illustration Rare', 'SWSH-CRZ', '108/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-108.webp', false, 145.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-109', 'OFFICIAL', 'Caterpie VSTAR / Illustration Rare', 'SWSH-CRZ', '109/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-109.webp', false, 157.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-110', 'OFFICIAL', 'Metapod VSTAR / Illustration Rare', 'SWSH-CRZ', '110/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-110.webp', false, 170.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-111', 'OFFICIAL', 'Butterfree VSTAR / Illustration Rare', 'SWSH-CRZ', '111/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-111.webp', false, 182.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-112', 'OFFICIAL', 'Weedle VSTAR / Illustration Rare', 'SWSH-CRZ', '112/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-112.webp', false, 195.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-113', 'OFFICIAL', 'Kakuna VSTAR / Illustration Rare', 'SWSH-CRZ', '113/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-113.webp', false, 207.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-114', 'OFFICIAL', 'Beedrill VSTAR / Illustration Rare', 'SWSH-CRZ', '114/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-114.webp', false, 220.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-115', 'OFFICIAL', 'Pidgey VSTAR / Illustration Rare', 'SWSH-CRZ', '115/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-115.webp', false, 232.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-116', 'OFFICIAL', 'Pidgeotto VSTAR / Illustration Rare', 'SWSH-CRZ', '116/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-116.webp', false, 245.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-117', 'OFFICIAL', 'Pidgeot VSTAR / Illustration Rare', 'SWSH-CRZ', '117/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-117.webp', false, 257.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-118', 'OFFICIAL', 'Rattata VSTAR / Illustration Rare', 'SWSH-CRZ', '118/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-118.webp', false, 270.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-119', 'OFFICIAL', 'Raticate VSTAR / Illustration Rare', 'SWSH-CRZ', '119/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-119.webp', false, 282.50)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('POK-GEN-120', 'OFFICIAL', 'Spearow VSTAR / Illustration Rare', 'SWSH-CRZ', '120/159', 'Ultra Rare', 'https://images.cardex.pe/catalog/pok-gen-120.webp', false, 45.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-OMEGA-DRAGON-001', 'GENERIC', 'Cyber Dragon Omega [Edición Prototipo UNI #001]', 'GEN-PROTOTYPE', '001/057', 'Mythic Prototype', 'https://images.cardex.pe/catalog/gen-drg-001.webp', true, 5000.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-002', 'GENERIC', 'Titan Mech Gundam Mk-2', 'GEN-PROTOTYPE', '002/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-002.webp', false, 31.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-003', 'GENERIC', 'Archmage of Nebula Mk-3', 'GEN-PROTOTYPE', '003/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-003.webp', false, 39.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-004', 'GENERIC', 'Fenrir Dire Wolf Mk-4', 'GEN-PROTOTYPE', '004/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-004.webp', false, 47.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-005', 'GENERIC', 'Seraphim Valkyrie Mk-5', 'GEN-PROTOTYPE', '005/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-ang-005.webp', false, 55.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-006', 'GENERIC', 'Necro Lord Lich Mk-6', 'GEN-PROTOTYPE', '006/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-006.webp', false, 63.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-007', 'GENERIC', 'Cyber Dragon Mk-7', 'GEN-PROTOTYPE', '007/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-007.webp', false, 71.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-008', 'GENERIC', 'Titan Mech Gundam Mk-8', 'GEN-PROTOTYPE', '008/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-008.webp', false, 79.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-009', 'GENERIC', 'Archmage of Nebula Mk-9', 'GEN-PROTOTYPE', '009/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-009.webp', false, 87.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-010', 'GENERIC', 'Fenrir Dire Wolf Mk-10', 'GEN-PROTOTYPE', '010/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-bst-010.webp', false, 15.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-011', 'GENERIC', 'Seraphim Valkyrie Mk-11', 'GEN-PROTOTYPE', '011/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-011.webp', false, 23.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-012', 'GENERIC', 'Necro Lord Lich Mk-12', 'GEN-PROTOTYPE', '012/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-012.webp', false, 31.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-013', 'GENERIC', 'Cyber Dragon Mk-13', 'GEN-PROTOTYPE', '013/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-013.webp', false, 39.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-014', 'GENERIC', 'Titan Mech Gundam Mk-14', 'GEN-PROTOTYPE', '014/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-014.webp', false, 47.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-015', 'GENERIC', 'Archmage of Nebula Mk-15', 'GEN-PROTOTYPE', '015/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-mag-015.webp', false, 55.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-016', 'GENERIC', 'Fenrir Dire Wolf Mk-16', 'GEN-PROTOTYPE', '016/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-016.webp', false, 63.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-017', 'GENERIC', 'Seraphim Valkyrie Mk-17', 'GEN-PROTOTYPE', '017/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-017.webp', false, 71.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-018', 'GENERIC', 'Necro Lord Lich Mk-18', 'GEN-PROTOTYPE', '018/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-018.webp', false, 79.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-019', 'GENERIC', 'Cyber Dragon Mk-19', 'GEN-PROTOTYPE', '019/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-019.webp', false, 87.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-020', 'GENERIC', 'Titan Mech Gundam Mk-20', 'GEN-PROTOTYPE', '020/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-mch-020.webp', false, 15.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-021', 'GENERIC', 'Archmage of Nebula Mk-21', 'GEN-PROTOTYPE', '021/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-021.webp', false, 23.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-022', 'GENERIC', 'Fenrir Dire Wolf Mk-22', 'GEN-PROTOTYPE', '022/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-022.webp', false, 31.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-023', 'GENERIC', 'Seraphim Valkyrie Mk-23', 'GEN-PROTOTYPE', '023/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-023.webp', false, 39.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-024', 'GENERIC', 'Necro Lord Lich Mk-24', 'GEN-PROTOTYPE', '024/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-024.webp', false, 47.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-025', 'GENERIC', 'Cyber Dragon Mk-25', 'GEN-PROTOTYPE', '025/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-drg-025.webp', false, 55.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-026', 'GENERIC', 'Titan Mech Gundam Mk-26', 'GEN-PROTOTYPE', '026/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-026.webp', false, 63.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-027', 'GENERIC', 'Archmage of Nebula Mk-27', 'GEN-PROTOTYPE', '027/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-027.webp', false, 71.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-028', 'GENERIC', 'Fenrir Dire Wolf Mk-28', 'GEN-PROTOTYPE', '028/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-028.webp', false, 79.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-029', 'GENERIC', 'Seraphim Valkyrie Mk-29', 'GEN-PROTOTYPE', '029/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-029.webp', false, 87.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-030', 'GENERIC', 'Necro Lord Lich Mk-30', 'GEN-PROTOTYPE', '030/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-und-030.webp', false, 15.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-031', 'GENERIC', 'Cyber Dragon Mk-31', 'GEN-PROTOTYPE', '031/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-031.webp', false, 23.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-032', 'GENERIC', 'Titan Mech Gundam Mk-32', 'GEN-PROTOTYPE', '032/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-032.webp', false, 31.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-033', 'GENERIC', 'Archmage of Nebula Mk-33', 'GEN-PROTOTYPE', '033/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-033.webp', false, 39.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-034', 'GENERIC', 'Fenrir Dire Wolf Mk-34', 'GEN-PROTOTYPE', '034/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-034.webp', false, 47.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-035', 'GENERIC', 'Seraphim Valkyrie Mk-35', 'GEN-PROTOTYPE', '035/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-ang-035.webp', false, 55.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-036', 'GENERIC', 'Necro Lord Lich Mk-36', 'GEN-PROTOTYPE', '036/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-036.webp', false, 63.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-037', 'GENERIC', 'Cyber Dragon Mk-37', 'GEN-PROTOTYPE', '037/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-037.webp', false, 71.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-038', 'GENERIC', 'Titan Mech Gundam Mk-38', 'GEN-PROTOTYPE', '038/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-038.webp', false, 79.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-039', 'GENERIC', 'Archmage of Nebula Mk-39', 'GEN-PROTOTYPE', '039/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-039.webp', false, 87.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-040', 'GENERIC', 'Fenrir Dire Wolf Mk-40', 'GEN-PROTOTYPE', '040/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-bst-040.webp', false, 15.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-041', 'GENERIC', 'Seraphim Valkyrie Mk-41', 'GEN-PROTOTYPE', '041/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-041.webp', false, 23.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-042', 'GENERIC', 'Necro Lord Lich Mk-42', 'GEN-PROTOTYPE', '042/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-042.webp', false, 31.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-043', 'GENERIC', 'Cyber Dragon Mk-43', 'GEN-PROTOTYPE', '043/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-043.webp', false, 39.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-044', 'GENERIC', 'Titan Mech Gundam Mk-44', 'GEN-PROTOTYPE', '044/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-044.webp', false, 47.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-045', 'GENERIC', 'Archmage of Nebula Mk-45', 'GEN-PROTOTYPE', '045/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-mag-045.webp', false, 55.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-046', 'GENERIC', 'Fenrir Dire Wolf Mk-46', 'GEN-PROTOTYPE', '046/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-046.webp', false, 63.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-047', 'GENERIC', 'Seraphim Valkyrie Mk-47', 'GEN-PROTOTYPE', '047/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-047.webp', false, 71.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-048', 'GENERIC', 'Necro Lord Lich Mk-48', 'GEN-PROTOTYPE', '048/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-048.webp', false, 79.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-049', 'GENERIC', 'Cyber Dragon Mk-49', 'GEN-PROTOTYPE', '049/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-drg-049.webp', false, 87.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-050', 'GENERIC', 'Titan Mech Gundam Mk-50', 'GEN-PROTOTYPE', '050/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-mch-050.webp', false, 15.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-051', 'GENERIC', 'Archmage of Nebula Mk-51', 'GEN-PROTOTYPE', '051/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-051.webp', false, 23.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-BST-052', 'GENERIC', 'Fenrir Dire Wolf Mk-52', 'GEN-PROTOTYPE', '052/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-bst-052.webp', false, 31.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-ANG-053', 'GENERIC', 'Seraphim Valkyrie Mk-53', 'GEN-PROTOTYPE', '053/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-ang-053.webp', false, 39.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-UND-054', 'GENERIC', 'Necro Lord Lich Mk-54', 'GEN-PROTOTYPE', '054/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-und-054.webp', false, 47.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-DRG-055', 'GENERIC', 'Cyber Dragon Mk-55', 'GEN-PROTOTYPE', '055/057', 'Secret Holographic', 'https://images.cardex.pe/catalog/gen-drg-055.webp', false, 55.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MCH-056', 'GENERIC', 'Titan Mech Gundam Mk-56', 'GEN-PROTOTYPE', '056/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mch-056.webp', false, 63.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;

INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('GEN-MAG-057', 'GENERIC', 'Archmage of Nebula Mk-57', 'GEN-PROTOTYPE', '057/057', 'Standard Core', 'https://images.cardex.pe/catalog/gen-mag-057.webp', false, 71.00)
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;


-- INSERCIÓN DE LAS 177 INSTANCIAS DE CARTAS FÍSICAS (card_instances)
INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000001', '00000000-0000-0000-0000-000000000001', 'POK-PROMO-ILLUSTRATOR', 0.004128912, 'PRISTINE', true, 'PSA', 'CERT-83920000', '10', 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-promo-illustrator.webp', 'https://storage.cardex.pe/cards/back_pok-promo-illustrator.webp', 'https://storage.cardex.pe/cards/thumb_pok-promo-illustrator.webp', 'hash_front_0', 'hash_back_0', 'hmac_sha256_mock_sig_POK-PROMO-ILLUSTRATOR_0004128912', '{}'::jsonb, 20304169.08)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000002', '00000000-0000-0000-0000-000000000001', 'POK-BASE-004-1ST', 0.062198214, 'NEAR_MINT', true, 'BGS', 'CERT-83920001', '9.5', 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-base-004-1st.webp', 'https://storage.cardex.pe/cards/back_pok-base-004-1st.webp', 'https://storage.cardex.pe/cards/thumb_pok-base-004-1st.webp', 'hash_front_1', 'hash_back_1', 'hmac_sha256_mock_sig_POK-BASE-004-1ST_0062198214', '{}'::jsonb, 1275217.29)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000003', '00000000-0000-0000-0000-000000000001', 'POK-PROMO-BLASTOISE-PRES', 0.062198214, 'NEAR_MINT', true, 'PSA', 'CERT-83920002', '9.5', 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-promo-blastoise-pres.webp', 'https://storage.cardex.pe/cards/back_pok-promo-blastoise-pres.webp', 'https://storage.cardex.pe/cards/thumb_pok-promo-blastoise-pres.webp', 'hash_front_2', 'hash_back_2', 'hmac_sha256_mock_sig_POK-PROMO-BLASTOISE-PRES_0062198214', '{}'::jsonb, 1381485.39)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000004', '00000000-0000-0000-0000-000000000001', 'POK-PROMO-TRAINER-1', 0.062198214, 'NEAR_MINT', true, 'BGS', 'CERT-83920003', '9.5', 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-promo-trainer-1.webp', 'https://storage.cardex.pe/cards/back_pok-promo-trainer-1.webp', 'https://storage.cardex.pe/cards/thumb_pok-promo-trainer-1.webp', 'hash_front_3', 'hash_back_3', 'hmac_sha256_mock_sig_POK-PROMO-TRAINER-1_0062198214', '{}'::jsonb, 371938.38)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000005', '00000000-0000-0000-0000-000000000001', 'POK-STAR-RAYQUAZA-107', 0.062198214, 'NEAR_MINT', true, 'PSA', 'CERT-83920004', '9.5', 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-star-rayquaza-107.webp', 'https://storage.cardex.pe/cards/back_pok-star-rayquaza-107.webp', 'https://storage.cardex.pe/cards/thumb_pok-star-rayquaza-107.webp', 'hash_front_4', 'hash_back_4', 'hmac_sha256_mock_sig_POK-STAR-RAYQUAZA-107_0062198214', '{}'::jsonb, 191282.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000006', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-025', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-025.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-025.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-025.webp', 'hash_front_5', 'hash_back_5', 'hmac_sha256_mock_sig_POK-SV2A-025_0015000000', '{}'::jsonb, 523.68)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000007', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-006', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-006.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-006.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-006.webp', 'hash_front_6', 'hash_back_6', 'hmac_sha256_mock_sig_POK-SV2A-006_0185000000', '{}'::jsonb, 840.65)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000008', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-009', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-009.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-009.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-009.webp', 'hash_front_7', 'hash_back_7', 'hmac_sha256_mock_sig_POK-SV2A-009_0355000000', '{}'::jsonb, 283.84)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000009', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-003', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-003.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-003.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-003.webp', 'hash_front_8', 'hash_back_8', 'hmac_sha256_mock_sig_POK-SV2A-003_0525000000', '{}'::jsonb, 219.80)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000010', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-151', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-151.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-151.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-151.webp', 'hash_front_9', 'hash_back_9', 'hmac_sha256_mock_sig_POK-SV2A-151_0695000000', '{}'::jsonb, 307.35)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000011', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-143', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-143.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-143.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-143.webp', 'hash_front_10', 'hash_back_10', 'hmac_sha256_mock_sig_POK-SV2A-143_0015000000', '{}'::jsonb, 130.92)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000012', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-133', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-133.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-133.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-133.webp', 'hash_front_11', 'hash_back_11', 'hmac_sha256_mock_sig_POK-SV2A-133_0185000000', '{}'::jsonb, 257.14)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000013', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-094', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-094.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-094.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-094.webp', 'hash_front_12', 'hash_back_12', 'hmac_sha256_mock_sig_POK-SV2A-094_0355000000', '{}'::jsonb, 274.97)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000014', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-150', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-150.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-150.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-150.webp', 'hash_front_13', 'hash_back_13', 'hmac_sha256_mock_sig_POK-SV2A-150_0525000000', '{}'::jsonb, 149.15)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000015', '00000000-0000-0000-0000-000000000001', 'POK-SV2A-065', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-sv2a-065.webp', 'https://storage.cardex.pe/cards/back_pok-sv2a-065.webp', 'https://storage.cardex.pe/cards/thumb_pok-sv2a-065.webp', 'hash_front_14', 'hash_back_14', 'hmac_sha256_mock_sig_POK-SV2A-065_0695000000', '{}'::jsonb, 64.89)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000016', '00000000-0000-0000-0000-000000000001', 'POK-BASE-002', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-base-002.webp', 'https://storage.cardex.pe/cards/back_pok-base-002.webp', 'https://storage.cardex.pe/cards/thumb_pok-base-002.webp', 'hash_front_15', 'hash_back_15', 'hmac_sha256_mock_sig_POK-BASE-002_0015000000', '{}'::jsonb, 490.95)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000017', '00000000-0000-0000-0000-000000000001', 'POK-BASE-015', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-base-015.webp', 'https://storage.cardex.pe/cards/back_pok-base-015.webp', 'https://storage.cardex.pe/cards/thumb_pok-base-015.webp', 'hash_front_16', 'hash_back_16', 'hmac_sha256_mock_sig_POK-BASE-015_0185000000', '{}'::jsonb, 375.82)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000018', '00000000-0000-0000-0000-000000000001', 'POK-BASE-016', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-base-016.webp', 'https://storage.cardex.pe/cards/back_pok-base-016.webp', 'https://storage.cardex.pe/cards/thumb_pok-base-016.webp', 'hash_front_17', 'hash_back_17', 'hmac_sha256_mock_sig_POK-BASE-016_0355000000', '{}'::jsonb, 159.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000019', '00000000-0000-0000-0000-000000000001', 'POK-BASE-058', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-base-058.webp', 'https://storage.cardex.pe/cards/back_pok-base-058.webp', 'https://storage.cardex.pe/cards/thumb_pok-base-058.webp', 'hash_front_18', 'hash_back_18', 'hmac_sha256_mock_sig_POK-BASE-058_0525000000', '{}'::jsonb, 117.75)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000020', '00000000-0000-0000-0000-000000000001', 'POK-JUNGLE-001', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-jungle-001.webp', 'https://storage.cardex.pe/cards/back_pok-jungle-001.webp', 'https://storage.cardex.pe/cards/thumb_pok-jungle-001.webp', 'hash_front_19', 'hash_back_19', 'hmac_sha256_mock_sig_POK-JUNGLE-001_0695000000', '{}'::jsonb, 150.26)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000021', '00000000-0000-0000-0000-000000000001', 'POK-JUNGLE-004', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-jungle-004.webp', 'https://storage.cardex.pe/cards/back_pok-jungle-004.webp', 'https://storage.cardex.pe/cards/thumb_pok-jungle-004.webp', 'hash_front_20', 'hash_back_20', 'hmac_sha256_mock_sig_POK-JUNGLE-004_0015000000', '{}'::jsonb, 261.84)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000022', '00000000-0000-0000-0000-000000000001', 'POK-JUNGLE-003', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-jungle-003.webp', 'https://storage.cardex.pe/cards/back_pok-jungle-003.webp', 'https://storage.cardex.pe/cards/thumb_pok-jungle-003.webp', 'hash_front_21', 'hash_back_21', 'hmac_sha256_mock_sig_POK-JUNGLE-003_0185000000', '{}'::jsonb, 227.47)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000023', '00000000-0000-0000-0000-000000000001', 'POK-JUNGLE-012', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-jungle-012.webp', 'https://storage.cardex.pe/cards/back_pok-jungle-012.webp', 'https://storage.cardex.pe/cards/thumb_pok-jungle-012.webp', 'hash_front_22', 'hash_back_22', 'hmac_sha256_mock_sig_POK-JUNGLE-012_0355000000', '{}'::jsonb, 208.44)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000024', '00000000-0000-0000-0000-000000000001', 'POK-FOSSIL-001', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-fossil-001.webp', 'https://storage.cardex.pe/cards/back_pok-fossil-001.webp', 'https://storage.cardex.pe/cards/thumb_pok-fossil-001.webp', 'hash_front_23', 'hash_back_23', 'hmac_sha256_mock_sig_POK-FOSSIL-001_0525000000', '{}'::jsonb, 274.75)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000025', '00000000-0000-0000-0000-000000000001', 'POK-FOSSIL-002', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-fossil-002.webp', 'https://storage.cardex.pe/cards/back_pok-fossil-002.webp', 'https://storage.cardex.pe/cards/thumb_pok-fossil-002.webp', 'hash_front_24', 'hash_back_24', 'hmac_sha256_mock_sig_POK-FOSSIL-002_0695000000', '{}'::jsonb, 143.43)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000026', '00000000-0000-0000-0000-000000000001', 'POK-FOSSIL-004', 0.062198214, 'NEAR_MINT', true, 'BGS', 'CERT-83920025', '9.5', 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-fossil-004.webp', 'https://storage.cardex.pe/cards/back_pok-fossil-004.webp', 'https://storage.cardex.pe/cards/thumb_pok-fossil-004.webp', 'hash_front_25', 'hash_back_25', 'hmac_sha256_mock_sig_POK-FOSSIL-004_0062198214', '{}'::jsonb, 584.47)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000027', '00000000-0000-0000-0000-000000000001', 'POK-FOSSIL-007', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-fossil-007.webp', 'https://storage.cardex.pe/cards/back_pok-fossil-007.webp', 'https://storage.cardex.pe/cards/thumb_pok-fossil-007.webp', 'hash_front_26', 'hash_back_26', 'hmac_sha256_mock_sig_POK-FOSSIL-007_0185000000', '{}'::jsonb, 108.79)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000028', '00000000-0000-0000-0000-000000000001', 'POK-FOSSIL-008', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-fossil-008.webp', 'https://storage.cardex.pe/cards/back_pok-fossil-008.webp', 'https://storage.cardex.pe/cards/thumb_pok-fossil-008.webp', 'hash_front_27', 'hash_back_27', 'hmac_sha256_mock_sig_POK-FOSSIL-008_0355000000', '{}'::jsonb, 84.27)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000029', '00000000-0000-0000-0000-000000000001', 'POK-ROCKET-001', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-rocket-001.webp', 'https://storage.cardex.pe/cards/back_pok-rocket-001.webp', 'https://storage.cardex.pe/cards/thumb_pok-rocket-001.webp', 'hash_front_28', 'hash_back_28', 'hmac_sha256_mock_sig_POK-ROCKET-001_0525000000', '{}'::jsonb, 251.20)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000030', '00000000-0000-0000-0000-000000000001', 'POK-ROCKET-003', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-rocket-003.webp', 'https://storage.cardex.pe/cards/back_pok-rocket-003.webp', 'https://storage.cardex.pe/cards/thumb_pok-rocket-003.webp', 'hash_front_29', 'hash_back_29', 'hmac_sha256_mock_sig_POK-ROCKET-003_0695000000', '{}'::jsonb, 443.95)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000031', '00000000-0000-0000-0000-000000000001', 'POK-ROCKET-004', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-rocket-004.webp', 'https://storage.cardex.pe/cards/back_pok-rocket-004.webp', 'https://storage.cardex.pe/cards/thumb_pok-rocket-004.webp', 'hash_front_30', 'hash_back_30', 'hmac_sha256_mock_sig_POK-ROCKET-004_0015000000', '{}'::jsonb, 1200.10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000032', '00000000-0000-0000-0000-000000000001', 'POK-ROCKET-005', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-rocket-005.webp', 'https://storage.cardex.pe/cards/back_pok-rocket-005.webp', 'https://storage.cardex.pe/cards/thumb_pok-rocket-005.webp', 'hash_front_31', 'hash_back_31', 'hmac_sha256_mock_sig_POK-ROCKET-005_0185000000', '{}'::jsonb, 286.81)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000033', '00000000-0000-0000-0000-000000000001', 'POK-ROCKET-008', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-rocket-008.webp', 'https://storage.cardex.pe/cards/back_pok-rocket-008.webp', 'https://storage.cardex.pe/cards/thumb_pok-rocket-008.webp', 'hash_front_32', 'hash_back_32', 'hmac_sha256_mock_sig_POK-ROCKET-008_0355000000', '{}'::jsonb, 141.92)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000034', '00000000-0000-0000-0000-000000000001', 'POK-NEO1-009', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-neo1-009.webp', 'https://storage.cardex.pe/cards/back_pok-neo1-009.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo1-009.webp', 'hash_front_33', 'hash_back_33', 'hmac_sha256_mock_sig_POK-NEO1-009_0525000000', '{}'::jsonb, 1452.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000035', '00000000-0000-0000-0000-000000000001', 'POK-NEO1-017', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-neo1-017.webp', 'https://storage.cardex.pe/cards/back_pok-neo1-017.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo1-017.webp', 'hash_front_34', 'hash_back_34', 'hmac_sha256_mock_sig_POK-NEO1-017_0695000000', '{}'::jsonb, 512.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000036', '00000000-0000-0000-0000-000000000001', 'POK-NEO2-001', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-neo2-001.webp', 'https://storage.cardex.pe/cards/back_pok-neo2-001.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo2-001.webp', 'hash_front_35', 'hash_back_35', 'hmac_sha256_mock_sig_POK-NEO2-001_0015000000', '{}'::jsonb, 523.68)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000037', '00000000-0000-0000-0000-000000000001', 'POK-NEO2-013', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-neo2-013.webp', 'https://storage.cardex.pe/cards/back_pok-neo2-013.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo2-013.webp', 'hash_front_36', 'hash_back_36', 'hmac_sha256_mock_sig_POK-NEO2-013_0185000000', '{}'::jsonb, 939.55)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000038', '00000000-0000-0000-0000-000000000001', 'POK-NEO3-065', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-neo3-065.webp', 'https://storage.cardex.pe/cards/back_pok-neo3-065.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo3-065.webp', 'hash_front_37', 'hash_back_37', 'hmac_sha256_mock_sig_POK-NEO3-065_0355000000', '{}'::jsonb, 1241.80)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000039', '00000000-0000-0000-0000-000000000001', 'POK-NEO3-066', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-neo3-066.webp', 'https://storage.cardex.pe/cards/back_pok-neo3-066.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo3-066.webp', 'hash_front_38', 'hash_back_38', 'hmac_sha256_mock_sig_POK-NEO3-066_0525000000', '{}'::jsonb, 1727.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000040', '00000000-0000-0000-0000-000000000001', 'POK-NEO4-107', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-neo4-107.webp', 'https://storage.cardex.pe/cards/back_pok-neo4-107.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo4-107.webp', 'hash_front_39', 'hash_back_39', 'hmac_sha256_mock_sig_POK-NEO4-107_0695000000', '{}'::jsonb, 3073.50)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000041', '00000000-0000-0000-0000-000000000001', 'POK-NEO4-109', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-neo4-109.webp', 'https://storage.cardex.pe/cards/back_pok-neo4-109.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo4-109.webp', 'hash_front_40', 'hash_back_40', 'hmac_sha256_mock_sig_POK-NEO4-109_0015000000', '{}'::jsonb, 2291.10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000042', '00000000-0000-0000-0000-000000000001', 'POK-NEO4-113', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-neo4-113.webp', 'https://storage.cardex.pe/cards/back_pok-neo4-113.webp', 'https://storage.cardex.pe/cards/thumb_pok-neo4-113.webp', 'hash_front_41', 'hash_back_41', 'hmac_sha256_mock_sig_POK-NEO4-113_0185000000', '{}'::jsonb, 1730.75)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000043', '00000000-0000-0000-0000-000000000001', 'POK-GEN-043', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-043.webp', 'https://storage.cardex.pe/cards/back_pok-gen-043.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-043.webp', 'hash_front_42', 'hash_back_42', 'hmac_sha256_mock_sig_POK-GEN-043_0355000000', '{}'::jsonb, 73.18)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000044', '00000000-0000-0000-0000-000000000001', 'POK-GEN-044', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-044.webp', 'https://storage.cardex.pe/cards/back_pok-gen-044.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-044.webp', 'hash_front_43', 'hash_back_43', 'hmac_sha256_mock_sig_POK-GEN-044_0525000000', '{}'::jsonb, 74.58)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000045', '00000000-0000-0000-0000-000000000001', 'POK-GEN-045', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-045.webp', 'https://storage.cardex.pe/cards/back_pok-gen-045.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-045.webp', 'hash_front_44', 'hash_back_44', 'hmac_sha256_mock_sig_POK-GEN-045_0695000000', '{}'::jsonb, 73.42)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000046', '00000000-0000-0000-0000-000000000001', 'POK-GEN-046', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-046.webp', 'https://storage.cardex.pe/cards/back_pok-gen-046.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-046.webp', 'hash_front_45', 'hash_back_45', 'hmac_sha256_mock_sig_POK-GEN-046_0015000000', '{}'::jsonb, 130.92)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000047', '00000000-0000-0000-0000-000000000001', 'POK-GEN-047', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-047.webp', 'https://storage.cardex.pe/cards/back_pok-gen-047.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-047.webp', 'hash_front_46', 'hash_back_46', 'hmac_sha256_mock_sig_POK-GEN-047_0185000000', '{}'::jsonb, 131.04)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000048', '00000000-0000-0000-0000-000000000001', 'POK-GEN-048', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-048.webp', 'https://storage.cardex.pe/cards/back_pok-gen-048.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-048.webp', 'hash_front_47', 'hash_back_47', 'hmac_sha256_mock_sig_POK-GEN-048_0355000000', '{}'::jsonb, 128.62)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000049', '00000000-0000-0000-0000-000000000001', 'POK-GEN-049', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-049.webp', 'https://storage.cardex.pe/cards/back_pok-gen-049.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-049.webp', 'hash_front_48', 'hash_back_48', 'hmac_sha256_mock_sig_POK-GEN-049_0525000000', '{}'::jsonb, 123.64)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000050', '00000000-0000-0000-0000-000000000001', 'POK-GEN-050', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-050.webp', 'https://storage.cardex.pe/cards/back_pok-gen-050.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-050.webp', 'hash_front_49', 'hash_back_49', 'hmac_sha256_mock_sig_POK-GEN-050_0695000000', '{}'::jsonb, 116.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000051', '00000000-0000-0000-0000-000000000001', 'POK-GEN-051', 0.062198214, 'NEAR_MINT', true, 'PSA', 'CERT-83920050', '9.5', 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-051.webp', 'https://storage.cardex.pe/cards/back_pok-gen-051.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-051.webp', 'hash_front_50', 'hash_back_50', 'hmac_sha256_mock_sig_POK-GEN-051_0062198214', '{}'::jsonb, 193.94)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000052', '00000000-0000-0000-0000-000000000001', 'POK-GEN-052', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-052.webp', 'https://storage.cardex.pe/cards/back_pok-gen-052.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-052.webp', 'hash_front_51', 'hash_back_51', 'hmac_sha256_mock_sig_POK-GEN-052_0185000000', '{}'::jsonb, 192.86)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000053', '00000000-0000-0000-0000-000000000001', 'POK-GEN-053', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-053.webp', 'https://storage.cardex.pe/cards/back_pok-gen-053.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-053.webp', 'hash_front_52', 'hash_back_52', 'hmac_sha256_mock_sig_POK-GEN-053_0355000000', '{}'::jsonb, 184.05)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000054', '00000000-0000-0000-0000-000000000001', 'POK-GEN-054', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-054.webp', 'https://storage.cardex.pe/cards/back_pok-gen-054.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-054.webp', 'hash_front_53', 'hash_back_53', 'hmac_sha256_mock_sig_POK-GEN-054_0525000000', '{}'::jsonb, 172.70)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000055', '00000000-0000-0000-0000-000000000001', 'POK-GEN-055', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-055.webp', 'https://storage.cardex.pe/cards/back_pok-gen-055.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-055.webp', 'hash_front_54', 'hash_back_54', 'hmac_sha256_mock_sig_POK-GEN-055_0695000000', '{}'::jsonb, 158.80)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000056', '00000000-0000-0000-0000-000000000001', 'POK-GEN-056', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-056.webp', 'https://storage.cardex.pe/cards/back_pok-gen-056.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-056.webp', 'hash_front_55', 'hash_back_55', 'hmac_sha256_mock_sig_POK-GEN-056_0015000000', '{}'::jsonb, 267.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000057', '00000000-0000-0000-0000-000000000001', 'POK-GEN-057', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-057.webp', 'https://storage.cardex.pe/cards/back_pok-gen-057.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-057.webp', 'hash_front_56', 'hash_back_56', 'hmac_sha256_mock_sig_POK-GEN-057_0185000000', '{}'::jsonb, 254.67)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000058', '00000000-0000-0000-0000-000000000001', 'POK-GEN-058', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-058.webp', 'https://storage.cardex.pe/cards/back_pok-gen-058.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-058.webp', 'hash_front_57', 'hash_back_57', 'hmac_sha256_mock_sig_POK-GEN-058_0355000000', '{}'::jsonb, 239.49)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000059', '00000000-0000-0000-0000-000000000001', 'POK-GEN-059', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-059.webp', 'https://storage.cardex.pe/cards/back_pok-gen-059.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-059.webp', 'hash_front_58', 'hash_back_58', 'hmac_sha256_mock_sig_POK-GEN-059_0525000000', '{}'::jsonb, 221.76)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000060', '00000000-0000-0000-0000-000000000001', 'POK-GEN-060', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-060.webp', 'https://storage.cardex.pe/cards/back_pok-gen-060.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-060.webp', 'hash_front_59', 'hash_back_59', 'hmac_sha256_mock_sig_POK-GEN-060_0695000000', '{}'::jsonb, 30.74)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000061', '00000000-0000-0000-0000-000000000001', 'POK-GEN-061', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-061.webp', 'https://storage.cardex.pe/cards/back_pok-gen-061.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-061.webp', 'hash_front_60', 'hash_back_60', 'hmac_sha256_mock_sig_POK-GEN-061_0015000000', '{}'::jsonb, 62.73)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000062', '00000000-0000-0000-0000-000000000001', 'POK-GEN-062', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-062.webp', 'https://storage.cardex.pe/cards/back_pok-gen-062.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-062.webp', 'hash_front_61', 'hash_back_61', 'hmac_sha256_mock_sig_POK-GEN-062_0185000000', '{}'::jsonb, 69.23)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000063', '00000000-0000-0000-0000-000000000001', 'POK-GEN-063', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-063.webp', 'https://storage.cardex.pe/cards/back_pok-gen-063.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-063.webp', 'hash_front_62', 'hash_back_62', 'hmac_sha256_mock_sig_POK-GEN-063_0355000000', '{}'::jsonb, 73.18)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000064', '00000000-0000-0000-0000-000000000001', 'POK-GEN-064', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-064.webp', 'https://storage.cardex.pe/cards/back_pok-gen-064.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-064.webp', 'hash_front_63', 'hash_back_63', 'hmac_sha256_mock_sig_POK-GEN-064_0525000000', '{}'::jsonb, 74.58)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000065', '00000000-0000-0000-0000-000000000001', 'POK-GEN-065', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-065.webp', 'https://storage.cardex.pe/cards/back_pok-gen-065.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-065.webp', 'hash_front_64', 'hash_back_64', 'hmac_sha256_mock_sig_POK-GEN-065_0695000000', '{}'::jsonb, 73.42)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000066', '00000000-0000-0000-0000-000000000001', 'POK-GEN-066', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-066.webp', 'https://storage.cardex.pe/cards/back_pok-gen-066.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-066.webp', 'hash_front_65', 'hash_back_65', 'hmac_sha256_mock_sig_POK-GEN-066_0015000000', '{}'::jsonb, 130.92)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000067', '00000000-0000-0000-0000-000000000001', 'POK-GEN-067', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-067.webp', 'https://storage.cardex.pe/cards/back_pok-gen-067.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-067.webp', 'hash_front_66', 'hash_back_66', 'hmac_sha256_mock_sig_POK-GEN-067_0185000000', '{}'::jsonb, 131.04)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000068', '00000000-0000-0000-0000-000000000001', 'POK-GEN-068', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-068.webp', 'https://storage.cardex.pe/cards/back_pok-gen-068.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-068.webp', 'hash_front_67', 'hash_back_67', 'hmac_sha256_mock_sig_POK-GEN-068_0355000000', '{}'::jsonb, 128.62)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000069', '00000000-0000-0000-0000-000000000001', 'POK-GEN-069', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-069.webp', 'https://storage.cardex.pe/cards/back_pok-gen-069.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-069.webp', 'hash_front_68', 'hash_back_68', 'hmac_sha256_mock_sig_POK-GEN-069_0525000000', '{}'::jsonb, 123.64)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000070', '00000000-0000-0000-0000-000000000001', 'POK-GEN-070', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-070.webp', 'https://storage.cardex.pe/cards/back_pok-gen-070.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-070.webp', 'hash_front_69', 'hash_back_69', 'hmac_sha256_mock_sig_POK-GEN-070_0695000000', '{}'::jsonb, 116.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000071', '00000000-0000-0000-0000-000000000001', 'POK-GEN-071', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-071.webp', 'https://storage.cardex.pe/cards/back_pok-gen-071.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-071.webp', 'hash_front_70', 'hash_back_70', 'hmac_sha256_mock_sig_POK-GEN-071_0015000000', '{}'::jsonb, 199.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000072', '00000000-0000-0000-0000-000000000001', 'POK-GEN-072', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-072.webp', 'https://storage.cardex.pe/cards/back_pok-gen-072.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-072.webp', 'hash_front_71', 'hash_back_71', 'hmac_sha256_mock_sig_POK-GEN-072_0185000000', '{}'::jsonb, 192.86)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000073', '00000000-0000-0000-0000-000000000001', 'POK-GEN-073', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-073.webp', 'https://storage.cardex.pe/cards/back_pok-gen-073.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-073.webp', 'hash_front_72', 'hash_back_72', 'hmac_sha256_mock_sig_POK-GEN-073_0355000000', '{}'::jsonb, 184.05)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000074', '00000000-0000-0000-0000-000000000001', 'POK-GEN-074', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-074.webp', 'https://storage.cardex.pe/cards/back_pok-gen-074.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-074.webp', 'hash_front_73', 'hash_back_73', 'hmac_sha256_mock_sig_POK-GEN-074_0525000000', '{}'::jsonb, 172.70)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000075', '00000000-0000-0000-0000-000000000001', 'POK-GEN-075', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-075.webp', 'https://storage.cardex.pe/cards/back_pok-gen-075.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-075.webp', 'hash_front_74', 'hash_back_74', 'hmac_sha256_mock_sig_POK-GEN-075_0695000000', '{}'::jsonb, 158.80)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000076', '00000000-0000-0000-0000-000000000001', 'POK-GEN-076', 0.062198214, 'NEAR_MINT', true, 'BGS', 'CERT-83920075', '9.5', 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-076.webp', 'https://storage.cardex.pe/cards/back_pok-gen-076.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-076.webp', 'hash_front_75', 'hash_back_75', 'hmac_sha256_mock_sig_POK-GEN-076_0062198214', '{}'::jsonb, 260.36)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000077', '00000000-0000-0000-0000-000000000001', 'POK-GEN-077', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-077.webp', 'https://storage.cardex.pe/cards/back_pok-gen-077.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-077.webp', 'hash_front_76', 'hash_back_76', 'hmac_sha256_mock_sig_POK-GEN-077_0185000000', '{}'::jsonb, 254.67)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000078', '00000000-0000-0000-0000-000000000001', 'POK-GEN-078', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-078.webp', 'https://storage.cardex.pe/cards/back_pok-gen-078.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-078.webp', 'hash_front_77', 'hash_back_77', 'hmac_sha256_mock_sig_POK-GEN-078_0355000000', '{}'::jsonb, 239.49)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000079', '00000000-0000-0000-0000-000000000001', 'POK-GEN-079', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-079.webp', 'https://storage.cardex.pe/cards/back_pok-gen-079.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-079.webp', 'hash_front_78', 'hash_back_78', 'hmac_sha256_mock_sig_POK-GEN-079_0525000000', '{}'::jsonb, 221.76)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000080', '00000000-0000-0000-0000-000000000001', 'POK-GEN-080', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-080.webp', 'https://storage.cardex.pe/cards/back_pok-gen-080.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-080.webp', 'hash_front_79', 'hash_back_79', 'hmac_sha256_mock_sig_POK-GEN-080_0695000000', '{}'::jsonb, 30.74)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000081', '00000000-0000-0000-0000-000000000001', 'POK-GEN-081', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-081.webp', 'https://storage.cardex.pe/cards/back_pok-gen-081.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-081.webp', 'hash_front_80', 'hash_back_80', 'hmac_sha256_mock_sig_POK-GEN-081_0015000000', '{}'::jsonb, 62.73)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000082', '00000000-0000-0000-0000-000000000001', 'POK-GEN-082', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-082.webp', 'https://storage.cardex.pe/cards/back_pok-gen-082.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-082.webp', 'hash_front_81', 'hash_back_81', 'hmac_sha256_mock_sig_POK-GEN-082_0185000000', '{}'::jsonb, 69.23)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000083', '00000000-0000-0000-0000-000000000001', 'POK-GEN-083', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-083.webp', 'https://storage.cardex.pe/cards/back_pok-gen-083.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-083.webp', 'hash_front_82', 'hash_back_82', 'hmac_sha256_mock_sig_POK-GEN-083_0355000000', '{}'::jsonb, 73.18)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000084', '00000000-0000-0000-0000-000000000001', 'POK-GEN-084', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-084.webp', 'https://storage.cardex.pe/cards/back_pok-gen-084.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-084.webp', 'hash_front_83', 'hash_back_83', 'hmac_sha256_mock_sig_POK-GEN-084_0525000000', '{}'::jsonb, 74.58)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000085', '00000000-0000-0000-0000-000000000001', 'POK-GEN-085', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-085.webp', 'https://storage.cardex.pe/cards/back_pok-gen-085.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-085.webp', 'hash_front_84', 'hash_back_84', 'hmac_sha256_mock_sig_POK-GEN-085_0695000000', '{}'::jsonb, 73.42)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000086', '00000000-0000-0000-0000-000000000001', 'POK-GEN-086', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-086.webp', 'https://storage.cardex.pe/cards/back_pok-gen-086.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-086.webp', 'hash_front_85', 'hash_back_85', 'hmac_sha256_mock_sig_POK-GEN-086_0015000000', '{}'::jsonb, 130.92)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000087', '00000000-0000-0000-0000-000000000001', 'POK-GEN-087', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-087.webp', 'https://storage.cardex.pe/cards/back_pok-gen-087.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-087.webp', 'hash_front_86', 'hash_back_86', 'hmac_sha256_mock_sig_POK-GEN-087_0185000000', '{}'::jsonb, 131.04)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000088', '00000000-0000-0000-0000-000000000001', 'POK-GEN-088', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-088.webp', 'https://storage.cardex.pe/cards/back_pok-gen-088.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-088.webp', 'hash_front_87', 'hash_back_87', 'hmac_sha256_mock_sig_POK-GEN-088_0355000000', '{}'::jsonb, 128.62)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000089', '00000000-0000-0000-0000-000000000001', 'POK-GEN-089', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-089.webp', 'https://storage.cardex.pe/cards/back_pok-gen-089.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-089.webp', 'hash_front_88', 'hash_back_88', 'hmac_sha256_mock_sig_POK-GEN-089_0525000000', '{}'::jsonb, 123.64)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000090', '00000000-0000-0000-0000-000000000001', 'POK-GEN-090', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-090.webp', 'https://storage.cardex.pe/cards/back_pok-gen-090.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-090.webp', 'hash_front_89', 'hash_back_89', 'hmac_sha256_mock_sig_POK-GEN-090_0695000000', '{}'::jsonb, 116.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000091', '00000000-0000-0000-0000-000000000001', 'POK-GEN-091', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-091.webp', 'https://storage.cardex.pe/cards/back_pok-gen-091.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-091.webp', 'hash_front_90', 'hash_back_90', 'hmac_sha256_mock_sig_POK-GEN-091_0015000000', '{}'::jsonb, 199.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000092', '00000000-0000-0000-0000-000000000001', 'POK-GEN-092', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-092.webp', 'https://storage.cardex.pe/cards/back_pok-gen-092.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-092.webp', 'hash_front_91', 'hash_back_91', 'hmac_sha256_mock_sig_POK-GEN-092_0185000000', '{}'::jsonb, 192.86)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000093', '00000000-0000-0000-0000-000000000001', 'POK-GEN-093', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-093.webp', 'https://storage.cardex.pe/cards/back_pok-gen-093.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-093.webp', 'hash_front_92', 'hash_back_92', 'hmac_sha256_mock_sig_POK-GEN-093_0355000000', '{}'::jsonb, 184.05)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000094', '00000000-0000-0000-0000-000000000001', 'POK-GEN-094', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-094.webp', 'https://storage.cardex.pe/cards/back_pok-gen-094.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-094.webp', 'hash_front_93', 'hash_back_93', 'hmac_sha256_mock_sig_POK-GEN-094_0525000000', '{}'::jsonb, 172.70)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000095', '00000000-0000-0000-0000-000000000001', 'POK-GEN-095', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-095.webp', 'https://storage.cardex.pe/cards/back_pok-gen-095.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-095.webp', 'hash_front_94', 'hash_back_94', 'hmac_sha256_mock_sig_POK-GEN-095_0695000000', '{}'::jsonb, 158.80)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000096', '00000000-0000-0000-0000-000000000001', 'POK-GEN-096', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-096.webp', 'https://storage.cardex.pe/cards/back_pok-gen-096.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-096.webp', 'hash_front_95', 'hash_back_95', 'hmac_sha256_mock_sig_POK-GEN-096_0015000000', '{}'::jsonb, 267.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000097', '00000000-0000-0000-0000-000000000001', 'POK-GEN-097', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-097.webp', 'https://storage.cardex.pe/cards/back_pok-gen-097.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-097.webp', 'hash_front_96', 'hash_back_96', 'hmac_sha256_mock_sig_POK-GEN-097_0185000000', '{}'::jsonb, 254.67)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000098', '00000000-0000-0000-0000-000000000001', 'POK-GEN-098', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-098.webp', 'https://storage.cardex.pe/cards/back_pok-gen-098.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-098.webp', 'hash_front_97', 'hash_back_97', 'hmac_sha256_mock_sig_POK-GEN-098_0355000000', '{}'::jsonb, 239.49)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000099', '00000000-0000-0000-0000-000000000001', 'POK-GEN-099', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-099.webp', 'https://storage.cardex.pe/cards/back_pok-gen-099.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-099.webp', 'hash_front_98', 'hash_back_98', 'hmac_sha256_mock_sig_POK-GEN-099_0525000000', '{}'::jsonb, 221.76)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000100', '00000000-0000-0000-0000-000000000001', 'POK-GEN-100', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-100.webp', 'https://storage.cardex.pe/cards/back_pok-gen-100.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-100.webp', 'hash_front_99', 'hash_back_99', 'hmac_sha256_mock_sig_POK-GEN-100_0695000000', '{}'::jsonb, 30.74)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000101', '00000000-0000-0000-0000-000000000001', 'POK-GEN-101', 0.062198214, 'NEAR_MINT', true, 'PSA', 'CERT-83920100', '9.5', 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-101.webp', 'https://storage.cardex.pe/cards/back_pok-gen-101.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-101.webp', 'hash_front_100', 'hash_back_100', 'hmac_sha256_mock_sig_POK-GEN-101_0062198214', '{}'::jsonb, 61.10)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000102', '00000000-0000-0000-0000-000000000001', 'POK-GEN-102', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-102.webp', 'https://storage.cardex.pe/cards/back_pok-gen-102.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-102.webp', 'hash_front_101', 'hash_back_101', 'hmac_sha256_mock_sig_POK-GEN-102_0185000000', '{}'::jsonb, 69.23)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000103', '00000000-0000-0000-0000-000000000001', 'POK-GEN-103', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-103.webp', 'https://storage.cardex.pe/cards/back_pok-gen-103.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-103.webp', 'hash_front_102', 'hash_back_102', 'hmac_sha256_mock_sig_POK-GEN-103_0355000000', '{}'::jsonb, 73.18)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000104', '00000000-0000-0000-0000-000000000001', 'POK-GEN-104', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-104.webp', 'https://storage.cardex.pe/cards/back_pok-gen-104.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-104.webp', 'hash_front_103', 'hash_back_103', 'hmac_sha256_mock_sig_POK-GEN-104_0525000000', '{}'::jsonb, 74.58)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000105', '00000000-0000-0000-0000-000000000001', 'POK-GEN-105', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-105.webp', 'https://storage.cardex.pe/cards/back_pok-gen-105.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-105.webp', 'hash_front_104', 'hash_back_104', 'hmac_sha256_mock_sig_POK-GEN-105_0695000000', '{}'::jsonb, 73.42)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000106', '00000000-0000-0000-0000-000000000001', 'POK-GEN-106', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-106.webp', 'https://storage.cardex.pe/cards/back_pok-gen-106.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-106.webp', 'hash_front_105', 'hash_back_105', 'hmac_sha256_mock_sig_POK-GEN-106_0015000000', '{}'::jsonb, 130.92)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000107', '00000000-0000-0000-0000-000000000001', 'POK-GEN-107', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-107.webp', 'https://storage.cardex.pe/cards/back_pok-gen-107.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-107.webp', 'hash_front_106', 'hash_back_106', 'hmac_sha256_mock_sig_POK-GEN-107_0185000000', '{}'::jsonb, 131.04)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000108', '00000000-0000-0000-0000-000000000001', 'POK-GEN-108', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-108.webp', 'https://storage.cardex.pe/cards/back_pok-gen-108.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-108.webp', 'hash_front_107', 'hash_back_107', 'hmac_sha256_mock_sig_POK-GEN-108_0355000000', '{}'::jsonb, 128.62)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000109', '00000000-0000-0000-0000-000000000001', 'POK-GEN-109', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-109.webp', 'https://storage.cardex.pe/cards/back_pok-gen-109.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-109.webp', 'hash_front_108', 'hash_back_108', 'hmac_sha256_mock_sig_POK-GEN-109_0525000000', '{}'::jsonb, 123.64)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000110', '00000000-0000-0000-0000-000000000001', 'POK-GEN-110', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-110.webp', 'https://storage.cardex.pe/cards/back_pok-gen-110.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-110.webp', 'hash_front_109', 'hash_back_109', 'hmac_sha256_mock_sig_POK-GEN-110_0695000000', '{}'::jsonb, 116.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000111', '00000000-0000-0000-0000-000000000001', 'POK-GEN-111', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_pok-gen-111.webp', 'https://storage.cardex.pe/cards/back_pok-gen-111.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-111.webp', 'hash_front_110', 'hash_back_110', 'hmac_sha256_mock_sig_POK-GEN-111_0015000000', '{}'::jsonb, 199.11)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000112', '00000000-0000-0000-0000-000000000001', 'POK-GEN-112', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-112.webp', 'https://storage.cardex.pe/cards/back_pok-gen-112.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-112.webp', 'hash_front_111', 'hash_back_111', 'hmac_sha256_mock_sig_POK-GEN-112_0185000000', '{}'::jsonb, 192.86)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000113', '00000000-0000-0000-0000-000000000001', 'POK-GEN-113', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-113.webp', 'https://storage.cardex.pe/cards/back_pok-gen-113.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-113.webp', 'hash_front_112', 'hash_back_112', 'hmac_sha256_mock_sig_POK-GEN-113_0355000000', '{}'::jsonb, 184.05)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000114', '00000000-0000-0000-0000-000000000001', 'POK-GEN-114', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-114.webp', 'https://storage.cardex.pe/cards/back_pok-gen-114.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-114.webp', 'hash_front_113', 'hash_back_113', 'hmac_sha256_mock_sig_POK-GEN-114_0525000000', '{}'::jsonb, 172.70)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000115', '00000000-0000-0000-0000-000000000001', 'POK-GEN-115', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-115.webp', 'https://storage.cardex.pe/cards/back_pok-gen-115.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-115.webp', 'hash_front_114', 'hash_back_114', 'hmac_sha256_mock_sig_POK-GEN-115_0695000000', '{}'::jsonb, 158.80)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000116', '00000000-0000-0000-0000-000000000001', 'POK-GEN-116', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-116.webp', 'https://storage.cardex.pe/cards/back_pok-gen-116.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-116.webp', 'hash_front_115', 'hash_back_115', 'hmac_sha256_mock_sig_POK-GEN-116_0015000000', '{}'::jsonb, 267.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000117', '00000000-0000-0000-0000-000000000001', 'POK-GEN-117', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-117.webp', 'https://storage.cardex.pe/cards/back_pok-gen-117.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-117.webp', 'hash_front_116', 'hash_back_116', 'hmac_sha256_mock_sig_POK-GEN-117_0185000000', '{}'::jsonb, 254.67)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000118', '00000000-0000-0000-0000-000000000001', 'POK-GEN-118', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_pok-gen-118.webp', 'https://storage.cardex.pe/cards/back_pok-gen-118.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-118.webp', 'hash_front_117', 'hash_back_117', 'hmac_sha256_mock_sig_POK-GEN-118_0355000000', '{}'::jsonb, 239.49)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000119', '00000000-0000-0000-0000-000000000001', 'POK-GEN-119', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-119.webp', 'https://storage.cardex.pe/cards/back_pok-gen-119.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-119.webp', 'hash_front_118', 'hash_back_118', 'hmac_sha256_mock_sig_POK-GEN-119_0525000000', '{}'::jsonb, 221.76)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000120', '00000000-0000-0000-0000-000000000001', 'POK-GEN-120', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_pok-gen-120.webp', 'https://storage.cardex.pe/cards/back_pok-gen-120.webp', 'https://storage.cardex.pe/cards/thumb_pok-gen-120.webp', 'hash_front_119', 'hash_back_119', 'hmac_sha256_mock_sig_POK-GEN-120_0695000000', '{}'::jsonb, 30.74)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000121', '00000000-0000-0000-0000-000000000001', 'GEN-OMEGA-DRAGON-001', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_gen-omega-dragon-001.webp', 'https://storage.cardex.pe/cards/back_gen-omega-dragon-001.webp', 'https://storage.cardex.pe/cards/thumb_gen-omega-dragon-001.webp', 'hash_front_120', 'hash_back_120', 'hmac_sha256_mock_sig_GEN-OMEGA-DRAGON-001_0015000000', '{"attack":2820,"defense":2415,"element":"DRAGON","level":5,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x10.05"}'::jsonb, 5455.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000122', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-002', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-002.webp', 'https://storage.cardex.pe/cards/back_gen-mch-002.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-002.webp', 'hash_front_121', 'hash_back_121', 'hmac_sha256_mock_sig_GEN-MCH-002_0185000000', '{"attack":3140,"defense":2930,"element":"MECHA","level":6,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x10.10"}'::jsonb, 30.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000123', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-003', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-003.webp', 'https://storage.cardex.pe/cards/back_gen-mag-003.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-003.webp', 'hash_front_122', 'hash_back_122', 'hmac_sha256_mock_sig_GEN-MAG-003_0355000000', '{"attack":2560,"defense":2145,"element":"SPELLCASTER","level":7,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x10.15"}'::jsonb, 34.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000124', '00000000-0000-0000-0000-000000000001', 'GEN-BST-004', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-004.webp', 'https://storage.cardex.pe/cards/back_gen-bst-004.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-004.webp', 'hash_front_123', 'hash_back_123', 'hmac_sha256_mock_sig_GEN-BST-004_0525000000', '{"attack":2280,"defense":1860,"element":"BEAST","level":8,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x10.20"}'::jsonb, 36.90)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000125', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-005', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-005.webp', 'https://storage.cardex.pe/cards/back_gen-ang-005.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-005.webp', 'hash_front_124', 'hash_back_124', 'hmac_sha256_mock_sig_GEN-ANG-005_0695000000', '{"attack":2800,"defense":2675,"element":"CELESTIAL","level":4,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x10.25"}'::jsonb, 37.57)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000126', '00000000-0000-0000-0000-000000000001', 'GEN-UND-006', 0.062198214, 'NEAR_MINT', true, 'BGS', 'CERT-83920125', '9.5', 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-006.webp', 'https://storage.cardex.pe/cards/back_gen-und-006.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-006.webp', 'hash_front_125', 'hash_back_125', 'hmac_sha256_mock_sig_GEN-UND-006_0062198214', '{"attack":2520,"defense":2090,"element":"UNDEAD","level":5,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x10.30"}'::jsonb, 66.95)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000127', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-007', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-007.webp', 'https://storage.cardex.pe/cards/back_gen-drg-007.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-007.webp', 'hash_front_126', 'hash_back_126', 'hmac_sha256_mock_sig_GEN-DRG-007_0185000000', '{"attack":2940,"defense":2505,"element":"DRAGON","level":6,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x10.35"}'::jsonb, 70.22)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000128', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-008', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-008.webp', 'https://storage.cardex.pe/cards/back_gen-mch-008.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-008.webp', 'hash_front_127', 'hash_back_127', 'hmac_sha256_mock_sig_GEN-MCH-008_0355000000', '{"attack":3260,"defense":3020,"element":"MECHA","level":7,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x10.40"}'::jsonb, 70.07)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000129', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-009', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-009.webp', 'https://storage.cardex.pe/cards/back_gen-mag-009.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-009.webp', 'hash_front_128', 'hash_back_128', 'hmac_sha256_mock_sig_GEN-MAG-009_0525000000', '{"attack":2680,"defense":2235,"element":"SPELLCASTER","level":8,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x10.45"}'::jsonb, 68.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000130', '00000000-0000-0000-0000-000000000001', 'GEN-BST-010', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-010.webp', 'https://storage.cardex.pe/cards/back_gen-bst-010.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-010.webp', 'hash_front_129', 'hash_back_129', 'hmac_sha256_mock_sig_GEN-BST-010_0695000000', '{"attack":2400,"defense":1950,"element":"BEAST","level":4,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x10.50"}'::jsonb, 10.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000131', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-011', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_gen-ang-011.webp', 'https://storage.cardex.pe/cards/back_gen-ang-011.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-011.webp', 'hash_front_130', 'hash_back_130', 'hmac_sha256_mock_sig_GEN-ANG-011_0015000000', '{"attack":2920,"defense":2765,"element":"CELESTIAL","level":5,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x10.55"}'::jsonb, 25.09)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000132', '00000000-0000-0000-0000-000000000001', 'GEN-UND-012', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-012.webp', 'https://storage.cardex.pe/cards/back_gen-und-012.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-012.webp', 'hash_front_131', 'hash_back_131', 'hmac_sha256_mock_sig_GEN-UND-012_0185000000', '{"attack":2640,"defense":2180,"element":"UNDEAD","level":6,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x10.60"}'::jsonb, 30.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000133', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-013', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-013.webp', 'https://storage.cardex.pe/cards/back_gen-drg-013.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-013.webp', 'hash_front_132', 'hash_back_132', 'hmac_sha256_mock_sig_GEN-DRG-013_0355000000', '{"attack":3060,"defense":2595,"element":"DRAGON","level":7,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x10.65"}'::jsonb, 34.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000134', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-014', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-014.webp', 'https://storage.cardex.pe/cards/back_gen-mch-014.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-014.webp', 'hash_front_133', 'hash_back_133', 'hmac_sha256_mock_sig_GEN-MCH-014_0525000000', '{"attack":3380,"defense":3110,"element":"MECHA","level":8,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x10.70"}'::jsonb, 36.90)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000135', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-015', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-015.webp', 'https://storage.cardex.pe/cards/back_gen-mag-015.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-015.webp', 'hash_front_134', 'hash_back_134', 'hmac_sha256_mock_sig_GEN-MAG-015_0695000000', '{"attack":2800,"defense":2325,"element":"SPELLCASTER","level":4,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x10.75"}'::jsonb, 37.57)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000136', '00000000-0000-0000-0000-000000000001', 'GEN-BST-016', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-016.webp', 'https://storage.cardex.pe/cards/back_gen-bst-016.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-016.webp', 'hash_front_135', 'hash_back_135', 'hmac_sha256_mock_sig_GEN-BST-016_0015000000', '{"attack":2520,"defense":2040,"element":"BEAST","level":5,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x10.80"}'::jsonb, 68.73)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000137', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-017', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-017.webp', 'https://storage.cardex.pe/cards/back_gen-ang-017.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-017.webp', 'hash_front_136', 'hash_back_136', 'hmac_sha256_mock_sig_GEN-ANG-017_0185000000', '{"attack":3040,"defense":2855,"element":"CELESTIAL","level":6,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x10.85"}'::jsonb, 70.22)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000138', '00000000-0000-0000-0000-000000000001', 'GEN-UND-018', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-018.webp', 'https://storage.cardex.pe/cards/back_gen-und-018.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-018.webp', 'hash_front_137', 'hash_back_137', 'hmac_sha256_mock_sig_GEN-UND-018_0355000000', '{"attack":2760,"defense":2270,"element":"UNDEAD","level":7,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x10.90"}'::jsonb, 70.07)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000139', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-019', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-019.webp', 'https://storage.cardex.pe/cards/back_gen-drg-019.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-019.webp', 'hash_front_138', 'hash_back_138', 'hmac_sha256_mock_sig_GEN-DRG-019_0525000000', '{"attack":3180,"defense":2685,"element":"DRAGON","level":8,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x10.95"}'::jsonb, 68.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000140', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-020', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-020.webp', 'https://storage.cardex.pe/cards/back_gen-mch-020.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-020.webp', 'hash_front_139', 'hash_back_139', 'hmac_sha256_mock_sig_GEN-MCH-020_0695000000', '{"attack":3500,"defense":3200,"element":"MECHA","level":4,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x11.00"}'::jsonb, 10.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000141', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-021', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_gen-mag-021.webp', 'https://storage.cardex.pe/cards/back_gen-mag-021.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-021.webp', 'hash_front_140', 'hash_back_140', 'hmac_sha256_mock_sig_GEN-MAG-021_0015000000', '{"attack":2920,"defense":2415,"element":"SPELLCASTER","level":5,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x11.05"}'::jsonb, 25.09)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000142', '00000000-0000-0000-0000-000000000001', 'GEN-BST-022', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-022.webp', 'https://storage.cardex.pe/cards/back_gen-bst-022.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-022.webp', 'hash_front_141', 'hash_back_141', 'hmac_sha256_mock_sig_GEN-BST-022_0185000000', '{"attack":2640,"defense":2130,"element":"BEAST","level":6,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x11.10"}'::jsonb, 30.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000143', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-023', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-023.webp', 'https://storage.cardex.pe/cards/back_gen-ang-023.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-023.webp', 'hash_front_142', 'hash_back_142', 'hmac_sha256_mock_sig_GEN-ANG-023_0355000000', '{"attack":3160,"defense":2945,"element":"CELESTIAL","level":7,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x11.15"}'::jsonb, 34.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000144', '00000000-0000-0000-0000-000000000001', 'GEN-UND-024', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-024.webp', 'https://storage.cardex.pe/cards/back_gen-und-024.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-024.webp', 'hash_front_143', 'hash_back_143', 'hmac_sha256_mock_sig_GEN-UND-024_0525000000', '{"attack":2880,"defense":2360,"element":"UNDEAD","level":8,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x11.20"}'::jsonb, 36.90)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000145', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-025', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-025.webp', 'https://storage.cardex.pe/cards/back_gen-drg-025.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-025.webp', 'hash_front_144', 'hash_back_144', 'hmac_sha256_mock_sig_GEN-DRG-025_0695000000', '{"attack":3300,"defense":2775,"element":"DRAGON","level":4,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x11.25"}'::jsonb, 37.57)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000146', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-026', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-026.webp', 'https://storage.cardex.pe/cards/back_gen-mch-026.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-026.webp', 'hash_front_145', 'hash_back_145', 'hmac_sha256_mock_sig_GEN-MCH-026_0015000000', '{"attack":3620,"defense":3290,"element":"MECHA","level":5,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x11.30"}'::jsonb, 68.73)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000147', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-027', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-027.webp', 'https://storage.cardex.pe/cards/back_gen-mag-027.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-027.webp', 'hash_front_146', 'hash_back_146', 'hmac_sha256_mock_sig_GEN-MAG-027_0185000000', '{"attack":3040,"defense":2505,"element":"SPELLCASTER","level":6,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x11.35"}'::jsonb, 70.22)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000148', '00000000-0000-0000-0000-000000000001', 'GEN-BST-028', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-028.webp', 'https://storage.cardex.pe/cards/back_gen-bst-028.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-028.webp', 'hash_front_147', 'hash_back_147', 'hmac_sha256_mock_sig_GEN-BST-028_0355000000', '{"attack":2760,"defense":2220,"element":"BEAST","level":7,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x11.40"}'::jsonb, 70.07)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000149', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-029', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-029.webp', 'https://storage.cardex.pe/cards/back_gen-ang-029.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-029.webp', 'hash_front_148', 'hash_back_148', 'hmac_sha256_mock_sig_GEN-ANG-029_0525000000', '{"attack":3280,"defense":3035,"element":"CELESTIAL","level":8,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x11.45"}'::jsonb, 68.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000150', '00000000-0000-0000-0000-000000000001', 'GEN-UND-030', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-030.webp', 'https://storage.cardex.pe/cards/back_gen-und-030.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-030.webp', 'hash_front_149', 'hash_back_149', 'hmac_sha256_mock_sig_GEN-UND-030_0695000000', '{"attack":3000,"defense":2450,"element":"UNDEAD","level":4,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x11.50"}'::jsonb, 10.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000151', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-031', 0.062198214, 'NEAR_MINT', true, 'PSA', 'CERT-83920150', '9.5', 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_gen-drg-031.webp', 'https://storage.cardex.pe/cards/back_gen-drg-031.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-031.webp', 'hash_front_150', 'hash_back_150', 'hmac_sha256_mock_sig_GEN-DRG-031_0062198214', '{"attack":3420,"defense":2865,"element":"DRAGON","level":5,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x11.55"}'::jsonb, 24.44)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000152', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-032', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-032.webp', 'https://storage.cardex.pe/cards/back_gen-mch-032.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-032.webp', 'hash_front_151', 'hash_back_151', 'hmac_sha256_mock_sig_GEN-MCH-032_0185000000', '{"attack":3740,"defense":3380,"element":"MECHA","level":6,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x11.60"}'::jsonb, 30.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000153', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-033', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-033.webp', 'https://storage.cardex.pe/cards/back_gen-mag-033.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-033.webp', 'hash_front_152', 'hash_back_152', 'hmac_sha256_mock_sig_GEN-MAG-033_0355000000', '{"attack":3160,"defense":2595,"element":"SPELLCASTER","level":7,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x11.65"}'::jsonb, 34.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000154', '00000000-0000-0000-0000-000000000001', 'GEN-BST-034', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-034.webp', 'https://storage.cardex.pe/cards/back_gen-bst-034.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-034.webp', 'hash_front_153', 'hash_back_153', 'hmac_sha256_mock_sig_GEN-BST-034_0525000000', '{"attack":2880,"defense":2310,"element":"BEAST","level":8,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x11.70"}'::jsonb, 36.90)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000155', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-035', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-035.webp', 'https://storage.cardex.pe/cards/back_gen-ang-035.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-035.webp', 'hash_front_154', 'hash_back_154', 'hmac_sha256_mock_sig_GEN-ANG-035_0695000000', '{"attack":3400,"defense":3125,"element":"CELESTIAL","level":4,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x11.75"}'::jsonb, 37.57)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000156', '00000000-0000-0000-0000-000000000001', 'GEN-UND-036', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-036.webp', 'https://storage.cardex.pe/cards/back_gen-und-036.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-036.webp', 'hash_front_155', 'hash_back_155', 'hmac_sha256_mock_sig_GEN-UND-036_0015000000', '{"attack":3120,"defense":2540,"element":"UNDEAD","level":5,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x11.80"}'::jsonb, 68.73)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000157', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-037', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-037.webp', 'https://storage.cardex.pe/cards/back_gen-drg-037.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-037.webp', 'hash_front_156', 'hash_back_156', 'hmac_sha256_mock_sig_GEN-DRG-037_0185000000', '{"attack":3540,"defense":2955,"element":"DRAGON","level":6,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x11.85"}'::jsonb, 70.22)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000158', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-038', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-038.webp', 'https://storage.cardex.pe/cards/back_gen-mch-038.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-038.webp', 'hash_front_157', 'hash_back_157', 'hmac_sha256_mock_sig_GEN-MCH-038_0355000000', '{"attack":3860,"defense":3470,"element":"MECHA","level":7,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x11.90"}'::jsonb, 70.07)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000159', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-039', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-039.webp', 'https://storage.cardex.pe/cards/back_gen-mag-039.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-039.webp', 'hash_front_158', 'hash_back_158', 'hmac_sha256_mock_sig_GEN-MAG-039_0525000000', '{"attack":3280,"defense":2685,"element":"SPELLCASTER","level":8,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x11.95"}'::jsonb, 68.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000160', '00000000-0000-0000-0000-000000000001', 'GEN-BST-040', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-040.webp', 'https://storage.cardex.pe/cards/back_gen-bst-040.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-040.webp', 'hash_front_159', 'hash_back_159', 'hmac_sha256_mock_sig_GEN-BST-040_0695000000', '{"attack":3000,"defense":2400,"element":"BEAST","level":4,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x12.00"}'::jsonb, 10.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000161', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-041', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_gen-ang-041.webp', 'https://storage.cardex.pe/cards/back_gen-ang-041.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-041.webp', 'hash_front_160', 'hash_back_160', 'hmac_sha256_mock_sig_GEN-ANG-041_0015000000', '{"attack":3520,"defense":3215,"element":"CELESTIAL","level":5,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x12.05"}'::jsonb, 25.09)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000162', '00000000-0000-0000-0000-000000000001', 'GEN-UND-042', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-042.webp', 'https://storage.cardex.pe/cards/back_gen-und-042.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-042.webp', 'hash_front_161', 'hash_back_161', 'hmac_sha256_mock_sig_GEN-UND-042_0185000000', '{"attack":3240,"defense":2630,"element":"UNDEAD","level":6,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x12.10"}'::jsonb, 30.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000163', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-043', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-043.webp', 'https://storage.cardex.pe/cards/back_gen-drg-043.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-043.webp', 'hash_front_162', 'hash_back_162', 'hmac_sha256_mock_sig_GEN-DRG-043_0355000000', '{"attack":3660,"defense":3045,"element":"DRAGON","level":7,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x12.15"}'::jsonb, 34.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000164', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-044', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-044.webp', 'https://storage.cardex.pe/cards/back_gen-mch-044.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-044.webp', 'hash_front_163', 'hash_back_163', 'hmac_sha256_mock_sig_GEN-MCH-044_0525000000', '{"attack":3980,"defense":3560,"element":"MECHA","level":8,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x12.20"}'::jsonb, 36.90)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000165', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-045', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-045.webp', 'https://storage.cardex.pe/cards/back_gen-mag-045.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-045.webp', 'hash_front_164', 'hash_back_164', 'hmac_sha256_mock_sig_GEN-MAG-045_0695000000', '{"attack":3400,"defense":2775,"element":"SPELLCASTER","level":4,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x12.25"}'::jsonb, 37.57)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000166', '00000000-0000-0000-0000-000000000001', 'GEN-BST-046', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-046.webp', 'https://storage.cardex.pe/cards/back_gen-bst-046.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-046.webp', 'hash_front_165', 'hash_back_165', 'hmac_sha256_mock_sig_GEN-BST-046_0015000000', '{"attack":3120,"defense":2490,"element":"BEAST","level":5,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x12.30"}'::jsonb, 68.73)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000167', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-047', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-047.webp', 'https://storage.cardex.pe/cards/back_gen-ang-047.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-047.webp', 'hash_front_166', 'hash_back_166', 'hmac_sha256_mock_sig_GEN-ANG-047_0185000000', '{"attack":3640,"defense":3305,"element":"CELESTIAL","level":6,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x12.35"}'::jsonb, 70.22)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000168', '00000000-0000-0000-0000-000000000001', 'GEN-UND-048', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-048.webp', 'https://storage.cardex.pe/cards/back_gen-und-048.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-048.webp', 'hash_front_167', 'hash_back_167', 'hmac_sha256_mock_sig_GEN-UND-048_0355000000', '{"attack":3360,"defense":2720,"element":"UNDEAD","level":7,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x12.40"}'::jsonb, 70.07)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000169', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-049', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-049.webp', 'https://storage.cardex.pe/cards/back_gen-drg-049.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-049.webp', 'hash_front_168', 'hash_back_168', 'hmac_sha256_mock_sig_GEN-DRG-049_0525000000', '{"attack":3780,"defense":3135,"element":"DRAGON","level":8,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x12.45"}'::jsonb, 68.30)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000170', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-050', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-050.webp', 'https://storage.cardex.pe/cards/back_gen-mch-050.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-050.webp', 'hash_front_169', 'hash_back_169', 'hmac_sha256_mock_sig_GEN-MCH-050_0695000000', '{"attack":4100,"defense":3650,"element":"MECHA","level":4,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x12.50"}'::jsonb, 10.25)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000171', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-051', 0.015000000, 'PRISTINE', false, NULL, NULL, NULL, 'TEXTURED_FULL_ART', false, 'https://storage.cardex.pe/cards/front_gen-mag-051.webp', 'https://storage.cardex.pe/cards/back_gen-mag-051.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-051.webp', 'hash_front_170', 'hash_back_170', 'hmac_sha256_mock_sig_GEN-MAG-051_0015000000', '{"attack":3520,"defense":2865,"element":"SPELLCASTER","level":5,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x12.55"}'::jsonb, 25.09)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000172', '00000000-0000-0000-0000-000000000001', 'GEN-BST-052', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-bst-052.webp', 'https://storage.cardex.pe/cards/back_gen-bst-052.webp', 'https://storage.cardex.pe/cards/thumb_gen-bst-052.webp', 'hash_front_171', 'hash_back_171', 'hmac_sha256_mock_sig_GEN-BST-052_0185000000', '{"attack":3240,"defense":2580,"element":"BEAST","level":6,"specialAbility":"Habilidad Primaria Tipo BEAST: Multiplicador de campo x12.60"}'::jsonb, 30.66)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000173', '00000000-0000-0000-0000-000000000001', 'GEN-ANG-053', 0.355000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-ang-053.webp', 'https://storage.cardex.pe/cards/back_gen-ang-053.webp', 'https://storage.cardex.pe/cards/thumb_gen-ang-053.webp', 'hash_front_172', 'hash_back_172', 'hmac_sha256_mock_sig_GEN-ANG-053_0355000000', '{"attack":3760,"defense":3395,"element":"CELESTIAL","level":7,"specialAbility":"Habilidad Primaria Tipo CELESTIAL: Multiplicador de campo x12.65"}'::jsonb, 34.59)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000174', '00000000-0000-0000-0000-000000000001', 'GEN-UND-054', 0.525000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-und-054.webp', 'https://storage.cardex.pe/cards/back_gen-und-054.webp', 'https://storage.cardex.pe/cards/thumb_gen-und-054.webp', 'hash_front_173', 'hash_back_173', 'hmac_sha256_mock_sig_GEN-UND-054_0525000000', '{"attack":3480,"defense":2810,"element":"UNDEAD","level":8,"specialAbility":"Habilidad Primaria Tipo UNDEAD: Multiplicador de campo x12.70"}'::jsonb, 36.90)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000175', '00000000-0000-0000-0000-000000000001', 'GEN-DRG-055', 0.695000000, 'MODERATE_PLAY', false, NULL, NULL, NULL, 'HOLO', false, 'https://storage.cardex.pe/cards/front_gen-drg-055.webp', 'https://storage.cardex.pe/cards/back_gen-drg-055.webp', 'https://storage.cardex.pe/cards/thumb_gen-drg-055.webp', 'hash_front_174', 'hash_back_174', 'hmac_sha256_mock_sig_GEN-DRG-055_0695000000', '{"attack":3900,"defense":3225,"element":"DRAGON","level":4,"specialAbility":"Habilidad Primaria Tipo DRAGON: Multiplicador de campo x12.75"}'::jsonb, 37.57)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000176', '00000000-0000-0000-0000-000000000001', 'GEN-MCH-056', 0.062198214, 'NEAR_MINT', true, 'BGS', 'CERT-83920175', '9.5', 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mch-056.webp', 'https://storage.cardex.pe/cards/back_gen-mch-056.webp', 'https://storage.cardex.pe/cards/thumb_gen-mch-056.webp', 'hash_front_175', 'hash_back_175', 'hmac_sha256_mock_sig_GEN-MCH-056_0062198214', '{"attack":4220,"defense":3740,"element":"MECHA","level":5,"specialAbility":"Habilidad Primaria Tipo MECHA: Multiplicador de campo x12.80"}'::jsonb, 66.95)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('00000000-0000-0000-0001-000000000177', '00000000-0000-0000-0000-000000000001', 'GEN-MAG-057', 0.185000000, 'LIGHT_PLAY', false, NULL, NULL, NULL, 'REGULAR', false, 'https://storage.cardex.pe/cards/front_gen-mag-057.webp', 'https://storage.cardex.pe/cards/back_gen-mag-057.webp', 'https://storage.cardex.pe/cards/thumb_gen-mag-057.webp', 'hash_front_176', 'hash_back_176', 'hmac_sha256_mock_sig_GEN-MAG-057_0185000000', '{"attack":3640,"defense":2955,"element":"SPELLCASTER","level":6,"specialAbility":"Habilidad Primaria Tipo SPELLCASTER: Multiplicador de campo x12.85"}'::jsonb, 70.22)
ON CONFLICT (id) DO NOTHING;

