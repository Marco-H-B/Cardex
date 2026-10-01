// ============================================================================
// Catálogo de Cartas 'Santo Grial' (Holy Grails) y Tasación Histórica
// ============================================================================

import type { HolyGrailValuation, WearTier } from "./types.ts";

export interface HolyGrailMetadata {
    cardId: string;
    cardName: string;
    basePricePen: number; // Precio base de subasta histórica en Soles (PEN)
    rarityRationale: string;
}

export const HOLY_GRAIL_REGISTRY: Record<string, HolyGrailMetadata> = {
    "POK-PROMO-ILLUSTRATOR": {
        cardId: "POK-PROMO-ILLUSTRATOR",
        cardName: "Pikachu Illustrator (CoroCoro 1998)",
        basePricePen: 18500000.0, // ~ $5,000,000 USD en PSA 10
        rarityRationale: "Solo existen 39 copias oficiales en el mundo otorgadas a ganadores del concurso CoroCoro.",
    },
    "POK-BASE-004-1ST": {
        cardId: "POK-BASE-004-1ST",
        cardName: "Charizard 1st Edition Shadowless #4 (1999)",
        basePricePen: 1200000.0, // ~ $320,000 USD en PSA 10
        rarityRationale: "Primera edición sin sombra del set base original de 1999.",
    },
    "POK-PROMO-BLASTOISE-PRES": {
        cardId: "POK-PROMO-BLASTOISE-PRES",
        cardName: "Blastoise Presentation Card (WotC 1998)",
        basePricePen: 1300000.0,
        rarityRationale:
            "Carta de presentación histórica creada por Wizards of the Coast previa al lanzamiento de Pokémon TCG.",
    },
    "POK-PROMO-TRAINER-1": {
        cardId: "POK-PROMO-TRAINER-1",
        cardName: "Trainer No. 1 (Secret Super Battle 1999)",
        basePricePen: 350000.0,
        rarityRationale: "Entregada exclusivamente a los campeones del torneo Secret Super Battle en Tokio.",
    },
    "POK-STAR-RAYQUAZA-107": {
        cardId: "POK-STAR-RAYQUAZA-107",
        cardName: "Rayquaza Gold Star #107 (EX Deoxys 2005)",
        basePricePen: 180000.0,
        rarityRationale: "Una de las cartas Gold Star más codiciadas y escasas de la era EX.",
    },
    "GEN-OMEGA-DRAGON-001": {
        cardId: "GEN-OMEGA-DRAGON-001",
        cardName: "Cyber Dragon Omega [Edición Prototipo UNI #001]",
        basePricePen: 5000.0,
        rarityRationale: "Primera carta genérica acuñada en el laboratorio Cardex con holofoil custom.",
    },
};

/**
 * Calcula el multiplicador de tasación según el desgaste (Float / WearTier).
 * Una carta Mítica (Pristine) preserva o incrementa el 100% de la cotización histórica,
 * mientras que el desgaste severo (Damaged) reduce drásticamente el valor de mercado.
 */
export function calculateWearMultiplier(wearTier: WearTier, floatValue: number): number {
    switch (wearTier) {
        case "PRISTINE":
            // Rango 1.0 a 1.25 según qué tan cercano a 0.000000000 sea el float
            return 1.0 + (0.05 - floatValue) * 5.0;
        case "NEAR_MINT":
            // Rango 0.70 a 0.95
            return 0.7 + (0.15 - floatValue) * 2.5;
        case "LIGHT_PLAY":
            // Rango 0.40 a 0.65
            return 0.4 + (0.35 - floatValue) * 1.25;
        case "MODERATE_PLAY":
            // Rango 0.15 a 0.35
            return 0.15 + (0.7 - floatValue) * 0.57;
        case "DAMAGED":
            // Rango 0.03 a 0.10
            return Math.max(0.03, 0.1 - (floatValue - 0.7) * 0.23);
    }
}

/**
 * Evalúa si una carta es un Santo Grial y emite su tasación histórica calculada.
 */
export function evaluateHolyGrail(
    cardId: string,
    wearTier: WearTier,
    floatValue: number,
): HolyGrailValuation | undefined {
    const grail = HOLY_GRAIL_REGISTRY[cardId];
    if (!grail) {
        return undefined;
    }

    const multiplier = calculateWearMultiplier(wearTier, floatValue);
    const estimatedPricePen = Math.round(grail.basePricePen * multiplier * 100) / 100;

    return {
        isHolyGrail: true,
        cardName: grail.cardName,
        historicalBasePricePen: grail.basePricePen,
        multiplier: Math.round(multiplier * 1000) / 1000,
        estimatedPricePen,
        rarityRationale: grail.rarityRationale,
    };
}
