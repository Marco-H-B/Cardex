// ============================================================================
// Supabase Edge Function: calculate-float
// Invocable via POST https://<project-ref>.supabase.co/functions/v1/calculate-float
// ============================================================================

import { corsHeaders } from "../_shared/cors.ts";
import type { FloatCalculationRequest } from "../_shared/types.ts";
import { calculateFloat } from "./floatCalculator.ts";

// Clave secreta para firma criptográfica HMAC-SHA256
const DEFAULT_SECRET = "cardex_secret_hmac_key_prod_default_2026";

function getSigningSecret(): string {
    if (typeof Deno !== "undefined" && Deno.env) {
        return Deno.env.get("FLOAT_SIGNING_SECRET") || DEFAULT_SECRET;
    }
    if (typeof process !== "undefined" && process.env) {
        return process.env.FLOAT_SIGNING_SECRET || DEFAULT_SECRET;
    }
    return DEFAULT_SECRET;
}

if (typeof Deno !== "undefined" && typeof Deno.serve === "function") {
    Deno.serve(async (req: Request) => {
        // 1. Manejo de cabeceras preflight de CORS
        if (req.method === "OPTIONS") {
            return new Response("ok", { headers: corsHeaders });
        }

        try {
            if (req.method !== "POST") {
                return new Response(JSON.stringify({ error: "Método no permitido. Se requiere POST." }), {
                    status: 405,
                    headers: { ...corsHeaders, "Content-Type": "application/json" },
                });
            }

            const payload: FloatCalculationRequest = await req.json();

            // Validaciones de contrato
            if (!payload.cardId || !payload.userId || !payload.finishVariant) {
                return new Response(
                    JSON.stringify({ error: "Faltan campos obligatorios: cardId, userId o finishVariant." }),
                    { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
                );
            }

            const secretKey = getSigningSecret();
            const result = await calculateFloat(payload, secretKey);

            return new Response(JSON.stringify(result), {
                status: 200,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        } catch (err: unknown) {
            const errorMessage = err instanceof Error ? err.message : "Error desconocido al calcular el Float.";
            return new Response(JSON.stringify({ error: errorMessage }), {
                status: 500,
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }
    });
}
