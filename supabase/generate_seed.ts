// ============================================================================
// Generador del Dataset Semilla de las 177 Cartas Físicas para Cardex
// Divide las cartas en:
// Lote 1: 120 Cartas Oficiales Pokémon (Set 151, Base Set, Crown Zenith, Promos)
// Lote 2: 57 Cartas Genéricas Custom (Dragones, Mechas, Bestias con custom_stats JSONB)
// ============================================================================

import * as fs from "node:fs";
import * as path from "node:path";

interface CatalogEntry {
    id: string;
    cardType: "OFFICIAL" | "GENERIC";
    name: string;
    setCode: string;
    cardNumber: string;
    rarity: string;
    imageUrl: string;
    isHolyGrail: boolean;
    basePricePen: number;
    customStats?: Record<string, unknown>;
}

const officialCardsData: Array<[string, string, string, string, string, boolean, number]> = [
    // [id, name, setCode, cardNumber, rarity, isHolyGrail, basePricePen]
    ["POK-PROMO-ILLUSTRATOR", "Pikachu Illustrator", "PROMO-1998", "PROMO", "Holy Grail Promo", true, 18500000.0],
    ["POK-BASE-004-1ST", "Charizard 1st Edition Shadowless", "BASE-1999", "4/102", "Holo Rare", true, 1200000.0],
    [
        "POK-PROMO-BLASTOISE-PRES",
        "Blastoise Presentation Galaxy Holo",
        "PROMO-1998",
        "TEST",
        "Presentation Promo",
        true,
        1300000.0,
    ],
    [
        "POK-PROMO-TRAINER-1",
        "Trainer No. 1 Super Battle",
        "PROMO-1999",
        "TRAINER-1",
        "Championship Promo",
        true,
        350000.0,
    ],
    ["POK-STAR-RAYQUAZA-107", "Rayquaza Gold Star", "EX-DEOXYS", "107/107", "Ultra Rare Gold Star", true, 180000.0],
    ["POK-SV2A-025", "Pikachu Art Rare (Master Ball Holo)", "SV2A-151", "025/165", "Art Rare", false, 480.0],
    [
        "POK-SV2A-006",
        "Charizard ex Special Illustration Rare",
        "SV2A-151",
        "201/165",
        "Special Illustration Rare",
        false,
        850.0,
    ],
    [
        "POK-SV2A-009",
        "Blastoise ex Special Illustration Rare",
        "SV2A-151",
        "202/165",
        "Special Illustration Rare",
        false,
        320.0,
    ],
    [
        "POK-SV2A-003",
        "Venusaur ex Special Illustration Rare",
        "SV2A-151",
        "200/165",
        "Special Illustration Rare",
        false,
        280.0,
    ],
    ["POK-SV2A-151", "Mew ex Hyper Rare (Gold)", "SV2A-151", "208/165", "Hyper Rare", false, 450.0],
    ["POK-SV2A-143", "Snorlax Illustration Rare", "SV2A-151", "181/165", "Illustration Rare", false, 120.0],
    ["POK-SV2A-133", "Eevee Master Ball Mirror", "SV2A-151", "133/165", "Mirror Holo", false, 260.0],
    ["POK-SV2A-094", "Gengar Master Ball Mirror", "SV2A-151", "094/165", "Mirror Holo", false, 310.0],
    ["POK-SV2A-150", "Mewtwo Illustration Rare", "SV2A-151", "183/165", "Illustration Rare", false, 190.0],
    ["POK-SV2A-065", "Alakazam ex Ultra Rare", "SV2A-151", "188/165", "Ultra Rare", false, 95.0],
    ["POK-BASE-002", "Blastoise Holo (Unlimited)", "BASE-1999", "2/102", "Holo Rare", false, 450.0],
    ["POK-BASE-015", "Venusaur Holo (Unlimited)", "BASE-1999", "15/102", "Holo Rare", false, 380.0],
    ["POK-BASE-016", "Zapdos Holo", "BASE-1999", "16/102", "Holo Rare", false, 180.0],
    ["POK-BASE-058", "Pikachu (Red Cheeks)", "BASE-1999", "58/102", "Common", false, 150.0],
    ["POK-JUNGLE-001", "Clefable Holo 1st Edition", "JUNGLE-1999", "1/64", "Holo Rare", false, 220.0],
    ["POK-JUNGLE-004", "Jolteon Holo", "JUNGLE-1999", "4/64", "Holo Rare", false, 240.0],
    ["POK-JUNGLE-003", "Flareon Holo", "JUNGLE-1999", "3/64", "Holo Rare", false, 230.0],
    ["POK-JUNGLE-012", "Vaporeon Holo", "JUNGLE-1999", "12/64", "Holo Rare", false, 235.0],
    ["POK-FOSSIL-001", "Aerodactyl Holo Prerelease", "FOSSIL-1999", "1/62", "Prerelease Promo", false, 350.0],
    ["POK-FOSSIL-002", "Articuno Holo", "FOSSIL-1999", "2/62", "Holo Rare", false, 210.0],
    ["POK-FOSSIL-004", "Dragonite Holo 1st Edition", "FOSSIL-1999", "4/62", "Holo Rare", false, 550.0],
    ["POK-FOSSIL-007", "Hitmonlee Holo", "FOSSIL-1999", "7/62", "Holo Rare", false, 110.0],
    ["POK-FOSSIL-008", "Hypno Holo", "FOSSIL-1999", "8/62", "Holo Rare", false, 95.0],
    ["POK-ROCKET-001", "Dark Alakazam Holo 1st Edition", "ROCKET-2000", "1/82", "Holo Rare", false, 320.0],
    ["POK-ROCKET-003", "Dark Blastoise Holo 1st Edition", "ROCKET-2000", "3/82", "Holo Rare", false, 650.0],
    ["POK-ROCKET-004", "Dark Charizard Holo 1st Edition", "ROCKET-2000", "4/82", "Holo Rare", false, 1100.0],
    ["POK-ROCKET-005", "Dark Dragonite Holo", "ROCKET-2000", "5/82", "Holo Rare", false, 290.0],
    ["POK-ROCKET-008", "Dark Gyarados Holo Prerelease", "ROCKET-2000", "8/82", "Prerelease Promo", false, 160.0],
    ["POK-NEO1-009", "Lugia Holo 1st Edition", "NEO-GENESIS-2000", "9/111", "Holo Rare", false, 1850.0],
    ["POK-NEO1-017", "Typhlosion T17 Holo", "NEO-GENESIS-2000", "17/111", "Holo Rare", false, 750.0],
    ["POK-NEO2-001", "Espeon Holo 1st Edition", "NEO-DISCOVERY-2001", "1/75", "Holo Rare", false, 480.0],
    ["POK-NEO2-013", "Umbreon Holo 1st Edition", "NEO-DISCOVERY-2001", "13/75", "Holo Rare", false, 950.0],
    [
        "POK-NEO3-065",
        "Shining Magikarp 1st Edition",
        "NEO-REVELATION-2001",
        "65/64",
        "Secret Rare Shining",
        false,
        1400.0,
    ],
    [
        "POK-NEO3-066",
        "Shining Gyarados 1st Edition",
        "NEO-REVELATION-2001",
        "66/64",
        "Secret Rare Shining",
        false,
        2200.0,
    ],
    [
        "POK-NEO4-107",
        "Shining Charizard 1st Edition",
        "NEO-DESTINY-2002",
        "107/105",
        "Secret Rare Shining",
        false,
        4500.0,
    ],
    ["POK-NEO4-109", "Shining Mewtwo 1st Edition", "NEO-DESTINY-2002", "109/105", "Secret Rare Shining", false, 2100.0],
    [
        "POK-NEO4-113",
        "Shining Tyranitar 1st Edition",
        "NEO-DESTINY-2002",
        "113/105",
        "Secret Rare Shining",
        false,
        1750.0,
    ],
];

// Generar hasta 120 cartas oficiales completando con especies emblemáticas
const pokemonNames = [
    "Arcanine",
    "Gengar",
    "Alakazam",
    "Machamp",
    "Scizor",
    "Heracross",
    "Tyranitar",
    "Salamence",
    "Metagross",
    "Lucario",
    "Garchomp",
    "Gardevoir",
    "Gallade",
    "Greninja",
    "Decidueye",
    "Zeraora",
    "Dragapult",
    "Corviknight",
    "Ceruledge",
    "Armarouge",
    "Baxcalibur",
    "Tinkaton",
    "Roaring Moon",
    "Iron Valiant",
    "Koraidon",
    "Miraidon",
    "Ogerpon",
    "Terapagos",
    "Rayquaza",
    "Kyogre",
    "Groudon",
    "Dialga",
    "Palkia",
    "Giratina",
    "Arceus",
    "Reshiram",
    "Zekrom",
    "Kyurem",
    "Xerneas",
    "Yveltal",
    "Zygarde",
    "Solgaleo",
    "Lunala",
    "Necrozma",
    "Zacian",
    "Zamazenta",
    "Eternatus",
    "Urshifu",
    "Calyrex",
    "Chien-Pao",
    "Chi-Yu",
    "Ting-Lu",
    "Wo-Chien",
    "Walking Wake",
    "Iron Leaves",
    "Gouging Fire",
    "Raging Bolt",
    "Iron Boulder",
    "Iron Crown",
    "Pecharunt",
    "Bulbasaur",
    "Ivysaur",
    "Charmander",
    "Charmeleon",
    "Squirtle",
    "Wartortle",
    "Caterpie",
    "Metapod",
    "Butterfree",
    "Weedle",
    "Kakuna",
    "Beedrill",
    "Pidgey",
    "Pidgeotto",
    "Pidgeot",
    "Rattata",
    "Raticate",
    "Spearow",
    "Fearow",
];

const catalog: CatalogEntry[] = [];

// 1. Agregar las cartas oficiales iniciales
for (const [id, name, setCode, cardNumber, rarity, isHolyGrail, basePricePen] of officialCardsData) {
    catalog.push({
        id,
        cardType: "OFFICIAL",
        name,
        setCode,
        cardNumber,
        rarity,
        imageUrl: `https://images.cardex.pe/catalog/${id.toLowerCase()}.webp`,
        isHolyGrail,
        basePricePen,
    });
}

// 2. Completar hasta 120 oficiales
let officialIndex = officialCardsData.length;
for (const pkm of pokemonNames) {
    if (catalog.length >= 120) break;
    officialIndex++;
    const cardId = `POK-GEN-${String(officialIndex).padStart(3, "0")}`;
    catalog.push({
        id: cardId,
        cardType: "OFFICIAL",
        name: `${pkm} VSTAR / Illustration Rare`,
        setCode: "SWSH-CRZ",
        cardNumber: `${String(officialIndex).padStart(3, "0")}/159`,
        rarity: "Ultra Rare",
        imageUrl: `https://images.cardex.pe/catalog/${cardId.toLowerCase()}.webp`,
        isHolyGrail: false,
        basePricePen: 45.0 + (officialIndex % 20) * 12.5,
    });
}

// 3. Crear 57 Cartas Genéricas (Lote 2: Mechas, Dragones, Magos, Bestias con Custom Stats)
const genericArchetypes = [
    { prefix: "GEN-DRG", type: "DRAGON", name: "Cyber Dragon", atk: 2800, def: 2400 },
    { prefix: "GEN-MCH", type: "MECHA", name: "Titan Mech Gundam", atk: 3100, def: 2900 },
    { prefix: "GEN-MAG", type: "SPELLCASTER", name: "Archmage of Nebula", atk: 2500, def: 2100 },
    { prefix: "GEN-BST", type: "BEAST", name: "Fenrir Dire Wolf", atk: 2200, def: 1800 },
    { prefix: "GEN-ANG", type: "CELESTIAL", name: "Seraphim Valkyrie", atk: 2700, def: 2600 },
    { prefix: "GEN-UND", type: "UNDEAD", name: "Necro Lord Lich", atk: 2400, def: 2000 },
];

for (let i = 1; i <= 57; i++) {
    const arch = genericArchetypes[(i - 1) % genericArchetypes.length];
    const cardId = `${arch.prefix}-${String(i).padStart(3, "0")}`;
    const isOmega = i === 1; // La primera es el Santo Grial Genérico 'GEN-OMEGA-DRAGON-001'

    catalog.push({
        id: isOmega ? "GEN-OMEGA-DRAGON-001" : cardId,
        cardType: "GENERIC",
        name: isOmega ? "Cyber Dragon Omega [Edición Prototipo UNI #001]" : `${arch.name} Mk-${i}`,
        setCode: "GEN-PROTOTYPE",
        cardNumber: `${String(i).padStart(3, "0")}/057`,
        rarity: isOmega ? "Mythic Prototype" : i % 5 === 0 ? "Secret Holographic" : "Standard Core",
        imageUrl: `https://images.cardex.pe/catalog/${cardId.toLowerCase()}.webp`,
        isHolyGrail: isOmega,
        basePricePen: isOmega ? 5000.0 : 15.0 + (i % 10) * 8.0,
        customStats: {
            attack: arch.atk + i * 20,
            defense: arch.def + i * 15,
            element: arch.type,
            level: 4 + (i % 5),
            specialAbility: `Habilidad Primaria Tipo ${arch.type}: Multiplicador de campo x${1.0 + (i * 0.05).toFixed(2)}`,
        },
    });
}

console.log(`Total de cartas generadas para el catálogo maestro: ${catalog.length} (Oficiales: 120, Genéricas: 57)`);

// 4. Escribir sentencias SQL para supabase/seed.sql
let sql = `-- ============================================================================
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
`;

for (const c of catalog) {
    const escapedName = c.name.replace(/'/g, "''");
    const escapedRarity = c.rarity.replace(/'/g, "''");
    sql += `INSERT INTO public.cards_catalog (id, card_type, name, set_code, card_number, rarity, official_image_url, is_holy_grail, base_historical_price_pen)
VALUES ('${c.id}', '${c.cardType}', '${escapedName}', '${c.setCode}', '${c.cardNumber}', '${escapedRarity}', '${c.imageUrl}', ${c.isHolyGrail}, ${c.basePricePen.toFixed(2)})
ON CONFLICT (id) DO UPDATE
SET is_holy_grail = EXCLUDED.is_holy_grail, base_historical_price_pen = EXCLUDED.base_historical_price_pen;
\n`;
}

// 5. Inserción de las 177 instancias en card_instances asignadas a Marco
sql += `\n-- INSERCIÓN DE LAS 177 INSTANCIAS DE CARTAS FÍSICAS (card_instances)\n`;

const wearTiers = ["PRISTINE", "NEAR_MINT", "LIGHT_PLAY", "MODERATE_PLAY", "DAMAGED"];

for (let idx = 0; idx < catalog.length; idx++) {
    const c = catalog[idx];
    const uuidStr = `00000000-0000-0000-0001-${String(idx + 1).padStart(12, "0")}`;
    const isSlab = idx < 5 || idx % 25 === 0;
    const slabCompany = isSlab ? (idx % 2 === 0 ? "PSA" : "BGS") : null;
    const slabGrade = isSlab ? (idx === 0 ? "10" : "9.5") : null;
    const slabCert = isSlab ? `CERT-${83920000 + idx}` : null;

    // Float simulado realista:
    let floatVal = isSlab ? (idx === 0 ? 0.004128912 : 0.062198214) : 0.015 + ((idx * 17) % 85) / 100;
    floatVal = Math.min(0.999999999, Math.max(0.000000001, floatVal));
    const floatFormatted = floatVal.toFixed(9);

    let wearTier = "PRISTINE";
    if (floatVal > 0.7) wearTier = "DAMAGED";
    else if (floatVal > 0.35) wearTier = "MODERATE_PLAY";
    else if (floatVal > 0.15) wearTier = "LIGHT_PLAY";
    else if (floatVal > 0.05) wearTier = "NEAR_MINT";

    const finishVariant = idx % 10 === 0 ? "TEXTURED_FULL_ART" : idx % 3 === 0 ? "HOLO" : "REGULAR";
    const frontUrl = `https://storage.cardex.pe/cards/front_${c.id.toLowerCase()}.webp`;
    const backUrl = `https://storage.cardex.pe/cards/back_${c.id.toLowerCase()}.webp`;
    const thumbUrl = `https://storage.cardex.pe/cards/thumb_${c.id.toLowerCase()}.webp`;
    const hmacSig = `hmac_sha256_mock_sig_${c.id}_${floatFormatted.replace(".", "")}`;
    const customStatsJson = c.customStats ? `'${JSON.stringify(c.customStats)}'::jsonb` : `'{}'::jsonb`;
    const estPrice = (c.basePricePen * (1.1 - floatVal * 0.6)).toFixed(2);

    sql += `INSERT INTO public.card_instances (id, user_id, card_id, float_value, wear_tier, is_slab, slab_company, slab_cert_number, slab_grade, finish_variant, is_oversized, front_photo_url, back_photo_url, thumbnail_url, phash_front, phash_back, hmac_signature, custom_stats, estimated_price_pen)
VALUES ('${uuidStr}', '00000000-0000-0000-0000-000000000001', '${c.id}', ${floatFormatted}, '${wearTier}', ${isSlab}, ${slabCompany ? `'${slabCompany}'` : "NULL"}, ${slabCert ? `'${slabCert}'` : "NULL"}, ${slabGrade ? `'${slabGrade}'` : "NULL"}, '${finishVariant}', false, '${frontUrl}', '${backUrl}', '${thumbUrl}', 'hash_front_${idx}', 'hash_back_${idx}', '${hmacSig}', ${customStatsJson}, ${estPrice})
ON CONFLICT (id) DO NOTHING;
\n`;
}

const outputPath = path.resolve("supabase/seed.sql");
fs.writeFileSync(outputPath, sql, "utf8");
console.log(`Archivo generado con éxito en: ${outputPath}`);
