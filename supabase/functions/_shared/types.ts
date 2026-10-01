// ============================================================================
// Tipos TypeScript para el Backend y Edge Functions de Cardex
// ============================================================================

export type WearTier = "PRISTINE" | "NEAR_MINT" | "LIGHT_PLAY" | "MODERATE_PLAY" | "DAMAGED";

export type CardFinish = "REGULAR" | "HOLO" | "REVERSE_HOLO" | "TEXTURED_FULL_ART" | "SECRET_RARE";

export type SlabCompany = "PSA" | "BGS" | "CGC" | "OTHER";

export interface OpticalInspectionMetrics {
    centeringScore: number; // 0.0 a 1.0 (1.0 = 50/50 perfecto)
    cornerWearScore: number; // 0.0 a 1.0 (0.0 = sin blanqueamiento / whitening)
    edgeWearScore: number; // 0.0 a 1.0 (0.0 = bordes nítidos intactos)
    surfaceScratchScore: number; // 0.0 a 1.0 (0.0 = superficie de espejo sin rayas)
    phashFront?: string; // Hash perceptual de 64 bits anverso
    phashBack?: string; // Hash perceptual de 64 bits reverso
}

export interface SlabInspectionData {
    isSlab: boolean;
    company?: SlabCompany;
    certNumber?: string;
    grade?: string; // Ej: '10', '9.5', '9', 'Authentic'
}

export interface FloatCalculationRequest {
    cardId: string;
    userId: string;
    finishVariant: CardFinish;
    isOversized?: boolean;
    slabData?: SlabInspectionData;
    opticalMetrics?: OpticalInspectionMetrics;
}

export interface HolyGrailValuation {
    isHolyGrail: boolean;
    cardName: string;
    historicalBasePricePen: number;
    multiplier: number;
    estimatedPricePen: number;
    rarityRationale: string;
}

export interface FloatCalculationResult {
    cardId: string;
    userId: string;
    floatValue: number; // Float continuo [0.000000000, 1.000000000]
    floatFormatted: string; // Formato estricto 9 decimales: "0.012345678"
    wearTier: WearTier;
    isSlabBypassApplied: boolean;
    holyGrailValuation?: HolyGrailValuation;
    hmacSignature: string; // Firma criptográfica HMAC-SHA256 inmutable
    calculatedAt: string; // ISO 8601 Timestamp
}
