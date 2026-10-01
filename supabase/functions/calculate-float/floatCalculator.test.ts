// ============================================================================
// Pruebas Unitarias TDD para el Motor de Cálculo del Float (Cardex Edge Function)
// Ejecutable directamente con: node --experimental-strip-types --test
// ============================================================================

import test from "node:test";
import assert from "node:assert/strict";
import { calculateFloat, computeHmacSignature, mapFloatToWearTier, mapSlabGradeToFloat } from "./floatCalculator.ts";
import type { FloatCalculationRequest } from "../_shared/types.ts";

const TEST_SECRET = "cardex_test_secret_key_1234567890_abcdef";

test("1. mapFloatToWearTier clasifica correctamente los 5 umbrales continuos", () => {
    // PRISTINE: [0.000000000, 0.050000000]
    assert.strictEqual(mapFloatToWearTier(0.0), "PRISTINE");
    assert.strictEqual(mapFloatToWearTier(0.025), "PRISTINE");
    assert.strictEqual(mapFloatToWearTier(0.05), "PRISTINE");

    // NEAR_MINT: (0.050000000, 0.150000000]
    assert.strictEqual(mapFloatToWearTier(0.050000001), "NEAR_MINT");
    assert.strictEqual(mapFloatToWearTier(0.1), "NEAR_MINT");
    assert.strictEqual(mapFloatToWearTier(0.15), "NEAR_MINT");

    // LIGHT_PLAY: (0.150000000, 0.350000000]
    assert.strictEqual(mapFloatToWearTier(0.150000001), "LIGHT_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.25), "LIGHT_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.35), "LIGHT_PLAY");

    // MODERATE_PLAY: (0.350000000, 0.700000000]
    assert.strictEqual(mapFloatToWearTier(0.350000001), "MODERATE_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.5), "MODERATE_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.7), "MODERATE_PLAY");

    // DAMAGED: (0.700000000, 1.000000000]
    assert.strictEqual(mapFloatToWearTier(0.700000001), "DAMAGED");
    assert.strictEqual(mapFloatToWearTier(0.85), "DAMAGED");
    assert.strictEqual(mapFloatToWearTier(1.0), "DAMAGED");
});

test("2. mapSlabGradeToFloat realiza el bypass exacto de losas certificadas", () => {
    // PSA / BGS / CGC Grado 10 -> Rango Pristine
    const slab10 = mapSlabGradeToFloat("10");
    assert.strictEqual(slab10.tier, "PRISTINE");
    assert.ok(slab10.floatValue <= 0.05);

    // Grado 9.5 -> Rango Near Mint alto
    const slab95 = mapSlabGradeToFloat("9.5");
    assert.strictEqual(slab95.tier, "NEAR_MINT");
    assert.ok(slab95.floatValue > 0.05 && slab95.floatValue <= 0.15);

    // Grado 8 -> Rango Light Play
    const slab8 = mapSlabGradeToFloat("8");
    assert.strictEqual(slab8.tier, "LIGHT_PLAY");
    assert.ok(slab8.floatValue > 0.15 && slab8.floatValue <= 0.35);

    // Grado 6 -> Rango Moderate Play
    const slab6 = mapSlabGradeToFloat("6");
    assert.strictEqual(slab6.tier, "MODERATE_PLAY");
    assert.ok(slab6.floatValue > 0.35 && slab6.floatValue <= 0.7);

    // Grado 4 o inferior -> Damaged
    const slab4 = mapSlabGradeToFloat("4");
    assert.strictEqual(slab4.tier, "DAMAGED");
    assert.ok(slab4.floatValue > 0.7);
});

test("3. calculateFloat omite desgaste visual cuando hay Slab Bypass", async () => {
    const request: FloatCalculationRequest = {
        cardId: "POK-SV2A-025",
        userId: "550e8400-e29b-41d4-a716-446655440000",
        finishVariant: "HOLO",
        slabData: {
            isSlab: true,
            company: "PSA",
            certNumber: "83920194",
            grade: "10",
        },
        // Métricas ópticas simuladas con alto desgaste artificial por arañazos en el acrílico externo
        opticalMetrics: {
            centeringScore: 0.5,
            cornerWearScore: 0.8,
            edgeWearScore: 0.9,
            surfaceScratchScore: 0.95,
        },
    };

    const result = await calculateFloat(request, TEST_SECRET);

    assert.strictEqual(result.isSlabBypassApplied, true);
    assert.strictEqual(result.wearTier, "PRISTINE");
    assert.ok(result.floatValue <= 0.05);
    assert.match(result.floatFormatted, /^0\.\d{9}$/);
    assert.ok(result.hmacSignature.length === 64, "La firma HMAC-SHA256 debe tener 64 caracteres hexadecimales");
});

test("4. calculateFloat calcula el desgaste ponderado para cartas Raw (físicas sueltas)", async () => {
    // Carta en estado casi perfecto (Pristine)
    const mintRequest: FloatCalculationRequest = {
        cardId: "POK-SV2A-001",
        userId: "550e8400-e29b-41d4-a716-446655440000",
        finishVariant: "REGULAR",
        opticalMetrics: {
            centeringScore: 1.0, // Centrado perfecto (50/50)
            cornerWearScore: 0.01, // Esquinas sin blanqueamiento
            edgeWearScore: 0.02, // Bordes intactos
            surfaceScratchScore: 0.01, // Superficie impecable
        },
    };

    const mintResult = await calculateFloat(mintRequest, TEST_SECRET);
    assert.strictEqual(mintResult.isSlabBypassApplied, false);
    assert.strictEqual(mintResult.wearTier, "PRISTINE");
    assert.ok(mintResult.floatValue <= 0.05);

    // Carta con daño severo (Damaged)
    const damagedRequest: FloatCalculationRequest = {
        cardId: "POK-SV2A-001",
        userId: "550e8400-e29b-41d4-a716-446655440000",
        finishVariant: "REGULAR",
        opticalMetrics: {
            centeringScore: 0.3,
            cornerWearScore: 0.85,
            edgeWearScore: 0.9,
            surfaceScratchScore: 0.8,
        },
    };

    const damagedResult = await calculateFloat(damagedRequest, TEST_SECRET);
    assert.strictEqual(damagedResult.wearTier, "DAMAGED");
    assert.ok(damagedResult.floatValue > 0.7);
});

test("5. calculateFloat detecta Santo Grial y calcula tasación histórica", async () => {
    const illustratorRequest: FloatCalculationRequest = {
        cardId: "POK-PROMO-ILLUSTRATOR",
        userId: "550e8400-e29b-41d4-a716-446655440000",
        finishVariant: "HOLO",
        slabData: {
            isSlab: true,
            company: "PSA",
            certNumber: "11223344",
            grade: "10",
        },
    };

    const result = await calculateFloat(illustratorRequest, TEST_SECRET);
    assert.ok(result.holyGrailValuation !== undefined);
    assert.strictEqual(result.holyGrailValuation?.isHolyGrail, true);
    assert.strictEqual(result.holyGrailValuation?.cardName, "Pikachu Illustrator (CoroCoro 1998)");
    assert.ok(result.holyGrailValuation.estimatedPricePen >= 18000000.0);
});

test("6. computeHmacSignature genera firma inmutable y detecta adulteraciones", async () => {
    const cardId = "POK-SV2A-025";
    const userId = "550e8400-e29b-41d4-a716-446655440000";
    const floatStr = "0.042183921";
    const wearTier = "PRISTINE";
    const timestamp = "2026-10-01T00:00:00.000Z";

    const validSig = await computeHmacSignature(cardId, userId, floatStr, wearTier, timestamp, TEST_SECRET);
    assert.ok(typeof validSig === "string" && validSig.length === 64);

    // Modificar un solo dígito del float debe generar una firma completamente distinta (efecto avalancha)
    const tamperedFloatStr = "0.042183922";
    const tamperedSig = await computeHmacSignature(cardId, userId, tamperedFloatStr, wearTier, timestamp, TEST_SECRET);
    assert.notStrictEqual(validSig, tamperedSig);
});
