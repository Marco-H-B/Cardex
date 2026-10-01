// ============================================================================
// Supabase Edge Function: lemonsqueezy-webhook
// Maneja eventos de suscripción y pago para actualizar el estado PRO en Cardex
// ============================================================================

import { corsHeaders } from "../_shared/cors.ts";

function getWebhookSecret(): string {
    if (typeof Deno !== "undefined" && Deno.env) {
        return Deno.env.get("LEMONSQUEEZY_WEBHOOK_SECRET") || "cardex_lemon_webhook_secret_key";
    }
    return "cardex_lemon_webhook_secret_key";
}

/**
 * Valida la firma HMAC-SHA256 enviada por Lemon Squeezy en la cabecera x-signature.
 */
export async function verifyLemonSignature(rawBody: string, signature: string, secret: string): Promise<boolean> {
    const encoder = new TextEncoder();
    const keyData = encoder.encode(secret);
    const messageData = encoder.encode(rawBody);

    const cryptoKey = await crypto.subtle.importKey("raw", keyData, { name: "HMAC", hash: "SHA-256" }, false, [
        "verify",
    ]);

    // Convertir firma hex a ArrayBuffer binario
    const signatureBytes = new Uint8Array(signature.match(/.{1,2}/g)?.map((byte) => parseInt(byte, 16)) || []);

    return await crypto.subtle.verify("HMAC", cryptoKey, signatureBytes, messageData);
}

if (typeof Deno !== "undefined" && typeof Deno.serve === "function") {
    Deno.serve(async (req: Request) => {
        if (req.method === "OPTIONS") {
            return new Response("ok", { headers: corsHeaders });
        }

        try {
            if (req.method !== "POST") {
                return new Response("Method Not Allowed", { status: 405 });
            }

            const signature = req.headers.get("x-signature");
            if (!signature) {
                return new Response(JSON.stringify({ error: "Cabecera x-signature faltante." }), {
                    status: 401,
                    headers: { ...corsHeaders, "Content-Type": "application/json" },
                });
            }

            const rawBody = await req.text();
            const secret = getWebhookSecret();
            const isValid = await verifyLemonSignature(rawBody, signature, secret);

            if (!isValid) {
                return new Response(JSON.stringify({ error: "Firma de webhook inválida." }), {
                    status: 403,
                    headers: { ...corsHeaders, "Content-Type": "application/json" },
                });
            }

            const payload = JSON.parse(rawBody);
            const eventName = payload.meta?.event_name;
            const customData = payload.meta?.custom_data;
            const userId = customData?.user_id;

            if (!userId) {
                return new Response(JSON.stringify({ message: "Evento recibido sin user_id asociado. Omitido." }), {
                    status: 200,
                    headers: { ...corsHeaders, "Content-Type": "application/json" },
                });
            }

            // Lógica de actualización de suscripción
            let newTier = "FREE";
            if (
                eventName === "subscription_created" ||
                eventName === "subscription_updated" ||
                eventName === "order_created"
            ) {
                const status = payload.data?.attributes?.status;
                if (status === "active" || status === "paid" || eventName === "order_created") {
                    newTier = "PRO";
                }
            } else if (eventName === "subscription_cancelled" || eventName === "subscription_expired") {
                newTier = "FREE";
            }

            // En Supabase Edge Runtime, podemos llamar a la API REST de PostgreSQL usando Service Role Key
            const supabaseUrl = Deno.env.get("SUPABASE_URL");
            const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

            if (supabaseUrl && supabaseServiceKey) {
                await fetch(`${supabaseUrl}/rest/v1/profiles?id=eq.${userId}`, {
                    method: "PATCH",
                    headers: {
                        apikey: supabaseServiceKey,
                        Authorization: `Bearer ${supabaseServiceKey}`,
                        "Content-Type": "application/json",
                        Prefer: "return=minimal",
                    },
                    body: JSON.stringify({
                        subscription_tier: newTier,
                        lemon_squeezy_customer_id: payload.data?.attributes?.customer_id?.toString(),
                        lemon_squeezy_subscription_id: payload.data?.id?.toString(),
                        updated_at: new Date().toISOString(),
                    }),
                });
            }

            return new Response(JSON.stringify({ success: true, event: eventName, user_id: userId, tier: newTier }), {
                status: 200,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        } catch (err: unknown) {
            const msg = err instanceof Error ? err.message : "Error procesando webhook";
            return new Response(JSON.stringify({ error: msg }), {
                status: 500,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }
    });
}
