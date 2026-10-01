package com.cardex.app.core.config

/**
 * Configuración oficial y constantes de monetización SaaS de Cardex Pro vía Lemon Squeezy.
 *
 * Define cuotas diarias de escaneo óptico, identificadores de variante y generación
 * de URLs de pasarela de pago (checkout) con metadatos de usuario inmutables.
 */
object SubscriptionConfig {

    /**
     * URL oficial de checkout del producto Cardex Pro en Lemon Squeezy.
     */
    const val LEMON_SQUEEZY_CHECKOUT_URL =
        "https://cardex.lemonsqueezy.com/checkout/buy/6a0f7072-e3f7-40ec-a78d-199256ef95c5"

    /**
     * Identificador único de variante asignado por la API de Lemon Squeezy.
     */
    const val LEMON_SQUEEZY_VARIANT_ID = "6a0f7072-e3f7-40ec-a78d-199256ef95c5"

    /**
     * Etiqueta de precio comercial visible al usuario.
     */
    const val PRO_PRICE_LABEL = "$9.99 / mes"

    /**
     * Límite diario de escaneos de cartas para usuarios en el plan gratuito (Free).
     */
    const val FREE_DAILY_SCAN_LIMIT = 5

    /**
     * Límite diario de escaneos de cartas para usuarios con suscripción activa (Cardex Pro).
     */
    const val PRO_DAILY_SCAN_LIMIT = 10

    /**
     * Construye la URL de compra enlazada al identificador del usuario para el webhook de activación.
     *
     * @param userId Identificador único UUID del usuario en el sistema.
     * @return URL lista para ser consumida por CustomTabs o navegador web externo.
     */
    fun buildCheckoutUrl(userId: String): String {
        return "$LEMON_SQUEEZY_CHECKOUT_URL?checkout[custom][user_id]=$userId"
    }
}
