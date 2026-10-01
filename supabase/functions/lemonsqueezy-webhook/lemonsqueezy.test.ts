// ============================================================================
// Pruebas Unitarias para el Webhook de Lemon Squeezy
// ============================================================================

import test from "node:test";
import assert from "node:assert/strict";
import { verifyLemonSignature } from "./index.ts";

const SECRET = "test_webhook_secret_key_cardex_2026";

// Función auxiliar para firmar con HMAC-SHA256
async function createTestSignature(payload: string, secret: string): Promise<string> {
    const encoder = new TextEncoder();
    const keyData = encoder.encode(secret);
    const messageData = encoder.encode(payload);

    const cryptoKey = await crypto.subtle.importKey("raw", keyData, { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);

    const signatureBuffer = await crypto.subtle.sign("HMAC", cryptoKey, messageData);
    return Array.from(new Uint8Array(signatureBuffer))
        .map((b) => b.toString(16).padStart(2, "0"))
        .join("");
}

test("1. verifyLemonSignature aprueba payloads válidos con la firma correcta", async () => {
    const payload = JSON.stringify({
        meta: { event_name: "subscription_created", custom_data: { user_id: "user_123" } },
        data: { attributes: { status: "active", customer_id: 9988 } },
    });

    const signature = await createTestSignature(payload, SECRET);
    const isValid = await verifyLemonSignature(payload, signature, SECRET);

    assert.strictEqual(isValid, true);
});

test("2. verifyLemonSignature rechaza payloads alterados o firmas apócrifas", async () => {
    const payload = JSON.stringify({
        meta: { event_name: "subscription_created", custom_data: { user_id: "user_123" } },
    });

    const validSignature = await createTestSignature(payload, SECRET);

    // Payload alterado
    const tamperedPayload = JSON.stringify({
        meta: { event_name: "subscription_created", custom_data: { user_id: "attacker_666" } },
    });

    const isValid = await verifyLemonSignature(tamperedPayload, validSignature, SECRET);
    assert.strictEqual(isValid, false);
});
