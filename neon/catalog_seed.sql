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
VALUES ('GEN-OMEGA-DRAGON-001', 'GENERIC', 'Cyber Dragon Omega [EdiciÃ³n Prototipo UNI #001]', 'GEN-PROTOTYPE', '001/057', 'Mythic Prototype', 'https://images.cardex.pe/catalog/gen-drg-001.webp', true, 5000.00)
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


