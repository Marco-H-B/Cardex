// ============================================================================
// Neon Function: lemonWebhook
// Maneja eventos de webhook de Lemon Squeezy conectando directamente a Postgres
// ============================================================================

import pg from "pg";
import { corsHeaders } from "./cors.ts";

const { Pool } = pg;

// Pool de PostgreSQL reutilizable entre invocaciones cálidas (warm isolates) en Neon Functions
export const pool = process.env.DATABASE_URL
    ? new Pool({
          connectionString: process.env.DATABASE_URL,
          max: 5,
      })
    : null;

export function getWebhookSecret(): string {
    return process.env.LEMONSQUEEZY_WEBHOOK_SECRET || "cardex_lemon_webhook_secret_key";
}

/**
 * Valida la firma HMAC-SHA256 enviada por Lemon Squeezy en la cabecera x-signature.
 * Compatible con la Web Crypto API nativa de Node.js 24.
 */
export async function verifyLemonSignature(rawBody: string, signature: string, secret: string): Promise<boolean> {
    const encoder = new TextEncoder();
    const keyData = encoder.encode(secret);
    const messageData = encoder.encode(rawBody);

    const cryptoKey = await crypto.subtle.importKey(
        "raw",
        keyData,
        { name: "HMAC", hash: "SHA-256" },
        false,
        ["verify"],
    );

    // Convertir firma hex a Uint8Array binario
    const hexBytes = signature.match(/.{1,2}/g)?.map((byte) => parseInt(byte, 16)) || [];
    const signatureBytes = new Uint8Array(hexBytes);

    return await crypto.subtle.verify("HMAC", cryptoKey, signatureBytes, messageData);
}

/**
 * Handler HTTP principal para webhooks de Lemon Squeezy.
 */
export async function handleLemonWebhook(req: Request): Promise<Response> {
    if (req.method === "OPTIONS") {
        return new Response("ok", { headers: corsHeaders });
    }

    if (req.method !== "POST") {
        return new Response(JSON.stringify({ error: "Method Not Allowed. Se requiere POST." }), {
            status: 405,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
    }

    try {
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
            return new Response(
                JSON.stringify({ message: "Evento recibido sin user_id asociado. Omitido." }),
                {
                    status: 200,
                    headers: { ...corsHeaders, "Content-Type": "application/json" },
                },
            );
        }

        // Lógica de cálculo del estado de suscripción
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

        const customerId = payload.data?.attributes?.customer_id?.toString() ?? null;
        const subscriptionId = payload.data?.id?.toString() ?? null;

        // Conectar a PostgreSQL usando pg.Pool y DATABASE_URL inyectado por Neon
        if (pool) {
            await pool.query(
                `UPDATE public.profiles SET subscription_tier = $1, lemon_squeezy_customer_id = $2, lemon_squeezy_subscription_id = $3, updated_at = NOW() WHERE id = $4`,
                [newTier, customerId, subscriptionId, userId],
            );
        } else {
            console.warn(
                "[lemonWebhook] DATABASE_URL no configurado. Se omite actualización de base de datos (entorno local/test).",
            );
        }

        return new Response(
            JSON.stringify({
                success: true,
                event: eventName,
                user_id: userId,
                tier: newTier,
                dbUpdated: Boolean(pool),
            }),
            {
                status: 200,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            },
        );
    } catch (err: unknown) {
        const msg = err instanceof Error ? err.message : "Error procesando webhook";
        return new Response(JSON.stringify({ error: msg }), {
            status: 500,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
    }
}
