package com.cardex.app.core.config

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

// Pruebas unitarias para SubscriptionConfig y constantes de Lemon Squeezy.
class SubscriptionConfigTest {

    @Test
    fun `constantes de Lemon Squeezy deben mantener valores oficiales de configuracion`() {
        // Verificación de URL base de checkout y Variant ID
        assertEquals(
            "https://cardex.lemonsqueezy.com/checkout/buy/6a0f7072-e3f7-40ec-a78d-199256ef95c5",
            SubscriptionConfig.LEMON_SQUEEZY_CHECKOUT_URL
        )
        assertEquals(
            "6a0f7072-e3f7-40ec-a78d-199256ef95c5",
            SubscriptionConfig.LEMON_SQUEEZY_VARIANT_ID
        )
        assertEquals("$9.99 / mes", SubscriptionConfig.PRO_PRICE_LABEL)

        // Verificación de cuotas diarias: 5 cartas (Free) frente a 10 cartas (Pro)
        assertEquals(5, SubscriptionConfig.FREE_DAILY_SCAN_LIMIT)
        assertEquals(10, SubscriptionConfig.PRO_DAILY_SCAN_LIMIT)
        assertTrue(SubscriptionConfig.PRO_DAILY_SCAN_LIMIT > SubscriptionConfig.FREE_DAILY_SCAN_LIMIT)
        assertEquals(
            SubscriptionConfig.FREE_DAILY_SCAN_LIMIT * 2,
            SubscriptionConfig.PRO_DAILY_SCAN_LIMIT
        )
    }

    @Test
    fun `buildCheckoutUrl debe concatenar el custom user_id correctamente para webhook`() {
        val testUserId = "00000000-0000-0000-0000-000000000001"
        val expectedUrl = "https://cardex.lemonsqueezy.com/checkout/buy/6a0f7072-e3f7-40ec-a78d-199256ef95c5?checkout[custom][user_id]=$testUserId"

        val generatedUrl = SubscriptionConfig.buildCheckoutUrl(testUserId)

        assertEquals(expectedUrl, generatedUrl)
        assertTrue(generatedUrl.startsWith(SubscriptionConfig.LEMON_SQUEEZY_CHECKOUT_URL))
        assertTrue(generatedUrl.contains("checkout[custom][user_id]=$testUserId"))
    }

    @Test
    fun `buildCheckoutUrl debe funcionar con identificadores UUID aleatorios`() {
        val randomUuid = "a1b2c3d4-e5f6-7890-abcd-ef1234567890"
        val generatedUrl = SubscriptionConfig.buildCheckoutUrl(randomUuid)

        assertTrue(generatedUrl.endsWith("checkout[custom][user_id]=$randomUuid"))
    }
}
