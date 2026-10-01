// ============================================================================
// 🃏 Motor Algorítmico del Float Inmutable (Neon Functions - Node.js 24)
// Arquitectura: Clean Domain + Criptografía HMAC-SHA256 (Web Crypto API)
// ============================================================================

import type {
    FloatCalculationRequest,
    FloatCalculationResult,
    OpticalInspectionMetrics,
    WearTier,
} from "./types.ts";
import { evaluateHolyGrail } from "./holyGrails.ts";

/**
 * Invariantes Matemáticas del Float:
 * 1. 0.000000000 <= floatValue <= 1.000000000
 * 2. Formato estricto de 9 decimales continuos (ej. 0.041829103)
 * 3. Umbrales Canónicos de Desgaste (WearTier):
 *    - PRISTINE:      [0.000000000, 0.050000000] (Mítico - Acento Oro #FFD700)
 *    - NEAR_MINT:     (0.050000000, 0.150000000] (Épico - Morado #AF52DE)
 *    - LIGHT_PLAY:    (0.150000000, 0.350000000] (Raro - Azul #0A84FF)
 *    - MODERATE_PLAY: (0.350000000, 0.700000000] (Común - Gris #8E8E93)
 *    - DAMAGED:       (0.700000000, 1.000000000] (Dañado - Rojo #FF453A)
 */

/**
 * Clasifica un float continuo de 9 decimales en su respectivo WearTier canónico.
 */
export function mapFloatToWearTier(floatValue: number): WearTier {
    if (floatValue <= 0.050000000) {
        return "PRISTINE";
    } else if (floatValue <= 0.150000000) {
        return "NEAR_MINT";
    } else if (floatValue <= 0.350000000) {
        return "LIGHT_PLAY";
    } else if (floatValue <= 0.700000000) {
        return "MODERATE_PLAY";
    } else {
        return "DAMAGED";
    }
}

/**
 * Mapea el grado certificado de una losa (Slab PSA/BGS/CGC) directamente a su rango canónico de float,
 * omitiendo el análisis óptico de desgaste superficial debido al reflejo del acrílico.
 */
export function mapSlabGradeToFloat(gradeStr?: string): { floatValue: number; tier: WearTier } {
    if (!gradeStr) {
        return { floatValue: 0.850000000, tier: "DAMAGED" };
    }

    const match = gradeStr.match(/\d+(\.\d+)?/);
    const numericGrade = match ? parseFloat(match[0]) : 0.0;

    if (numericGrade >= 10.0) {
        return { floatValue: 0.005000000, tier: "PRISTINE" };
    } else if (numericGrade >= 9.0) {
        // Mapeo proporcional entre 9.0 y 9.9 a float [0.060, 0.095]
        const factor = 10.0 - numericGrade; // 0.1 a 1.0
        const floatVal = 0.050000000 + factor * 0.050000000;
        return { floatValue: Math.round(floatVal * 1e9) / 1e9, tier: "NEAR_MINT" };
    } else if (numericGrade >= 7.0) {
        // Mapeo entre 7.0 y 8.9 a float [0.180, 0.280]
        const factor = (9.0 - numericGrade) / 2.0;
        const floatVal = 0.150000000 + factor * 0.150000000;
        return { floatValue: Math.round(floatVal * 1e9) / 1e9, tier: "LIGHT_PLAY" };
    } else if (numericGrade >= 5.0) {
        // Mapeo entre 5.0 y 6.9 a float [0.380, 0.650]
        const factor = (7.0 - numericGrade) / 2.0;
        const floatVal = 0.350000000 + factor * 0.300000000;
        return { floatValue: Math.round(floatVal * 1e9) / 1e9, tier: "MODERATE_PLAY" };
    } else {
        return { floatValue: 0.850000000, tier: "DAMAGED" };
    }
}

/**
 * Genera la firma criptográfica HMAC-SHA256 inmutable de la tasación utilizando Web Crypto API.
 * Compatible nativamente con Node.js 24.
 */
export async function computeHmacSignature(
    cardId: string,
    userId: string,
    floatFormatted: string,
    wearTier: WearTier,
    timestamp: string,
    secretKey: string,
): Promise<string> {
    const canonicalMessage = `${cardId}:${userId}:${floatFormatted}:${wearTier}:${timestamp}`;
    const encoder = new TextEncoder();
    const keyData = encoder.encode(secretKey);
    const messageData = encoder.encode(canonicalMessage);

    const cryptoKey = await crypto.subtle.importKey(
        "raw",
        keyData,
        { name: "HMAC", hash: "SHA-256" },
        false,
        ["sign"],
    );

    const signatureBuffer = await crypto.subtle.sign("HMAC", cryptoKey, messageData);
    return Array.from(new Uint8Array(signatureBuffer))
        .map((b) => b.toString(16).padStart(2, "0"))
        .join("");
}

/**
 * Motor central de cálculo del Float para Cardex.
 * Soporta Bypass de Slabs, Desgaste Ponderado de 4 Ejes y Detección de Santo Grial.
 */
export async function calculateFloat(
    request: FloatCalculationRequest,
    secretKey: string,
): Promise<FloatCalculationResult> {
    let floatValue = 0.0;
    let wearTier: WearTier = "PRISTINE";
    let isSlabBypassApplied = false;

    // 1. Evaluar si aplica Slab Bypass por detección de losa graduada
    if (request.slabData?.isSlab && request.slabData.grade) {
        const slabMapping = mapSlabGradeToFloat(request.slabData.grade);
        floatValue = slabMapping.floatValue;
        wearTier = slabMapping.tier;
        isSlabBypassApplied = true;
    } else {
        // 2. Carta suelta (Raw): Cálculo ponderado de desgaste óptico sobre 4 ejes
        const metrics: OpticalInspectionMetrics = request.opticalMetrics || {
            centeringScore: 1.0,
            cornerWearScore: 0.0,
            edgeWearScore: 0.0,
            surfaceScratchScore: 0.0,
        };

        const centeringPenalty = Math.max(0.0, Math.min(1.0, 1.0 - metrics.centeringScore));
        const cornerPenalty = Math.max(0.0, Math.min(1.0, metrics.cornerWearScore));
        const edgePenalty = Math.max(0.0, Math.min(1.0, metrics.edgeWearScore));
        const surfacePenalty = Math.max(0.0, Math.min(1.0, metrics.surfaceScratchScore));

        // Ponderación canónica:
        // 0.15 Centrado + 0.35 Esquinas + 0.30 Bordes + 0.20 Superficie
        const weightedWear =
            centeringPenalty * 0.15 +
            cornerPenalty * 0.35 +
            edgePenalty * 0.30 +
            surfacePenalty * 0.20;

        // Acotar estrictamente entre 0.000000000 y 1.000000000
        floatValue = Math.max(0.000000000, Math.min(1.000000000, weightedWear));
        wearTier = mapFloatToWearTier(floatValue);
        isSlabBypassApplied = false;
    }

    // 3. Formateo estricto a 9 decimales
    const floatFormatted = floatValue.toFixed(9);

    // 4. Detección y tasación histórica de 'Santo Grial'
    const holyGrailValuation = evaluateHolyGrail(request.cardId, wearTier, floatValue);

    // 5. Marca temporal ISO 8601
    const calculatedAt = new Date().toISOString();

    // 6. Firma criptográfica HMAC-SHA256 inmutable
    const hmacSignature = await computeHmacSignature(
        request.cardId,
        request.userId,
        floatFormatted,
        wearTier,
        calculatedAt,
        secretKey,
    );

    return {
        cardId: request.cardId,
        userId: request.userId,
        floatValue,
        floatFormatted,
        wearTier,
        isSlabBypassApplied,
        holyGrailValuation,
        hmacSignature,
        calculatedAt,
    };
}
