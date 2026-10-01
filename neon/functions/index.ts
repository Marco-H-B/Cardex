// ============================================================================
// Entrypoint Canónico para Neon Functions: Cardex API
// Compatible con Web Standards (fetch handler) en Node.js 24
// ============================================================================

import { corsHeaders } from "./cors.ts";
import type { FloatCalculationRequest } from "./types.ts";
import { calculateFloat } from "./floatCalculator.ts";
import { handleLemonWebhook } from "./lemonWebhook.ts";

const DEFAULT_FLOAT_SECRET = "cardex_secret_hmac_key_prod_default_2026";

function getFloatSigningSecret(): string {
    return process.env.FLOAT_SIGNING_SECRET || DEFAULT_FLOAT_SECRET;
}

/**
 * Enrutador principal de peticiones HTTP para Neon Functions.
 */
export async function fetchHandler(request: Request): Promise<Response> {
    // 1. Manejo de preflight CORS (OPTIONS)
    if (request.method === "OPTIONS") {
        return new Response("ok", { headers: corsHeaders });
    }

    const url = new URL(request.url);
    const pathname = url.pathname.replace(/\/$/, ""); // Normalizar trailing slash

    // 2. Health check: GET / o GET /health
    if ((pathname === "" || pathname === "/health") && request.method === "GET") {
        return new Response(
            JSON.stringify({ status: "ok", service: "cardex-neon-api" }),
            {
                status: 200,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            },
        );
    }

    // 3. POST /calculate-float
    if (pathname === "/calculate-float") {
        if (request.method !== "POST") {
            return new Response(
                JSON.stringify({ error: "Método no permitido. Se requiere POST." }),
                {
                    status: 405,
                    headers: { ...corsHeaders, "Content-Type": "application/json" },
                },
            );
        }

        try {
            const payload: FloatCalculationRequest = await request.json();

            // Validaciones del contrato
            if (!payload.cardId || !payload.userId || !payload.finishVariant) {
                return new Response(
                    JSON.stringify({
                        error: "Faltan campos obligatorios: cardId, userId o finishVariant.",
                    }),
                    {
                        status: 400,
                        headers: { ...corsHeaders, "Content-Type": "application/json" },
                    },
                );
            }

            const secretKey = getFloatSigningSecret();
            const result = await calculateFloat(payload, secretKey);

            return new Response(JSON.stringify(result), {
                status: 200,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        } catch (err: unknown) {
            const errorMessage =
                err instanceof Error ? err.message : "Error desconocido al calcular el Float.";
            return new Response(JSON.stringify({ error: errorMessage }), {
                status: 500,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }
    }

    // 4. POST /lemonsqueezy-webhook
    if (pathname === "/lemonsqueezy-webhook") {
        return handleLemonWebhook(request);
    }

    // 5. Ruta no encontrada (404)
    return new Response(
        JSON.stringify({ error: "Ruta no encontrada", path: pathname }),
        {
            status: 404,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
        },
    );
}

export default {
    fetch: fetchHandler,
};
