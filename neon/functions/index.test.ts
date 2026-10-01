// ============================================================================
// Pruebas Unitarias para Neon Functions (Cardex API)
// Ejecutable con: node --experimental-strip-types --test neon/functions/index.test.ts
// ============================================================================

import test from "node:test";
import assert from "node:assert/strict";
import apiHandler from "./index.ts";
import { calculateFloat, mapFloatToWearTier, mapSlabGradeToFloat } from "./floatCalculator.ts";
import { verifyLemonSignature } from "./lemonWebhook.ts";
import type { FloatCalculationRequest } from "./types.ts";

const TEST_SECRET = "cardex_test_secret_key_1234567890_abcdef";

// Función auxiliar para firmar con HMAC-SHA256 para Lemon Squeezy
async function createTestSignature(payload: string, secret: string): Promise<string> {
    const encoder = new TextEncoder();
    const keyData = encoder.encode(secret);
    const messageData = encoder.encode(payload);

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

test("1. mapFloatToWearTier clasifica correctamente los umbrales de desgaste", () => {
    assert.strictEqual(mapFloatToWearTier(0.0), "PRISTINE");
    assert.strictEqual(mapFloatToWearTier(0.05), "PRISTINE");
    assert.strictEqual(mapFloatToWearTier(0.050000001), "NEAR_MINT");
    assert.strictEqual(mapFloatToWearTier(0.15), "NEAR_MINT");
    assert.strictEqual(mapFloatToWearTier(0.150000001), "LIGHT_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.35), "LIGHT_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.350000001), "MODERATE_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.7), "MODERATE_PLAY");
    assert.strictEqual(mapFloatToWearTier(0.700000001), "DAMAGED");
    assert.strictEqual(mapFloatToWearTier(1.0), "DAMAGED");
});

test("2. mapSlabGradeToFloat mapea calificaciones de losas PSA/BGS/CGC", () => {
    const slab10 = mapSlabGradeToFloat("10");
    assert.strictEqual(slab10.tier, "PRISTINE");
    assert.ok(slab10.floatValue <= 0.05);

    const slab9 = mapSlabGradeToFloat("9.0");
    assert.strictEqual(slab9.tier, "NEAR_MINT");
    assert.ok(slab9.floatValue > 0.05 && slab9.floatValue <= 0.15);

    const slabDefault = mapSlabGradeToFloat(undefined);
    assert.strictEqual(slabDefault.tier, "DAMAGED");
});

test("3. calculateFloat calcula tasación histórica para cartas Santo Grial", async () => {
    const request: FloatCalculationRequest = {
        cardId: "POK-PROMO-ILLUSTRATOR",
        userId: "550e8400-e29b-41d4-a716-446655440000",
        finishVariant: "HOLO",
        slabData: {
            isSlab: true,
            grade: "10",
        },
    };

    const result = await calculateFloat(request, TEST_SECRET);
    assert.strictEqual(result.isSlabBypassApplied, true);
    assert.strictEqual(result.wearTier, "PRISTINE");
    assert.ok(result.holyGrailValuation?.isHolyGrail);
    assert.strictEqual(result.holyGrailValuation?.cardName, "Pikachu Illustrator (CoroCoro 1998)");
    assert.ok(result.holyGrailValuation.estimatedPricePen > 18000000);
});

test("4. Router Neon Functions responde a GET /health", async () => {
    const req = new Request("https://api.neon.tech/health", { method: "GET" });
    const res = await apiHandler.fetch(req);

    assert.strictEqual(res.status, 200);
    const body = await res.json();
    assert.deepStrictEqual(body, { status: "ok", service: "cardex-neon-api" });
});

test("5. Router Neon Functions responde preflight CORS (OPTIONS)", async () => {
    const req = new Request("https://api.neon.tech/calculate-float", { method: "OPTIONS" });
    const res = await apiHandler.fetch(req);

    assert.strictEqual(res.status, 200);
    assert.strictEqual(res.headers.get("Access-Control-Allow-Origin"), "*");
});

test("6. Router Neon Functions procesa POST /calculate-float exitosamente", async () => {
    const payload: FloatCalculationRequest = {
        cardId: "POK-SV2A-001",
        userId: "550e8400-e29b-41d4-a716-446655440000",
        finishVariant: "REGULAR",
        opticalMetrics: {
            centeringScore: 0.95,
            cornerWearScore: 0.02,
            edgeWearScore: 0.03,
            surfaceScratchScore: 0.01,
        },
    };

    const req = new Request("https://api.neon.tech/calculate-float", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
    });

    const res = await apiHandler.fetch(req);
    assert.strictEqual(res.status, 200);

    const data = await res.json();
    assert.strictEqual(data.cardId, "POK-SV2A-001");
    assert.strictEqual(data.wearTier, "PRISTINE");
    assert.match(data.floatFormatted, /^0\.\d{9}$/);
    assert.strictEqual(data.hmacSignature.length, 64);
});

test("7. Router Neon Functions rechaza POST /calculate-float sin campos obligatorios", async () => {
    const req = new Request("https://api.neon.tech/calculate-float", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cardId: "POK-SV2A-001" }), // Falta userId y finishVariant
    });

    const res = await apiHandler.fetch(req);
    assert.strictEqual(res.status, 400);
});

test("8. verifyLemonSignature aprueba y rechaza firmas de webhook adecuadamente", async () => {
    const secret = "test_webhook_secret_key_cardex_2026";
    const payload = JSON.stringify({
        meta: { event_name: "subscription_created", custom_data: { user_id: "user_123" } },
        data: { attributes: { status: "active", customer_id: 9988 }, id: "sub_1" },
    });

    const validSignature = await createTestSignature(payload, secret);
    const isValid = await verifyLemonSignature(payload, validSignature, secret);
    assert.strictEqual(isValid, true);

    const isTamperedValid = await verifyLemonSignature(payload, "invalid_signature", secret);
    assert.strictEqual(isTamperedValid, false);
});

test("9. Router procesa POST /lemonsqueezy-webhook validando firmas y manejando DB sin DATABASE_URL", async () => {
    process.env.LEMONSQUEEZY_WEBHOOK_SECRET = "test_lemon_secret";
    const payload = JSON.stringify({
        meta: { event_name: "subscription_created", custom_data: { user_id: "user_neon_123" } },
        data: { attributes: { status: "active", customer_id: 12345 }, id: "sub_987" },
    });

    const signature = await createTestSignature(payload, "test_lemon_secret");

    const req = new Request("https://api.neon.tech/lemonsqueezy-webhook", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "x-signature": signature,
        },
        body: payload,
    });

    const res = await apiHandler.fetch(req);
    assert.strictEqual(res.status, 200);

    const resJson = await res.json();
    assert.strictEqual(resJson.success, true);
    assert.strictEqual(resJson.tier, "PRO");
    assert.strictEqual(resJson.user_id, "user_neon_123");
    // Al no haber DATABASE_URL en test, dbUpdated es false sin arrojar excepción
    assert.strictEqual(resJson.dbUpdated, false);
});

test("10. Router retorna 404 para rutas inexistentes", async () => {
    const req = new Request("https://api.neon.tech/ruta-desconocida", { method: "GET" });
    const res = await apiHandler.fetch(req);
    assert.strictEqual(res.status, 404);
});
