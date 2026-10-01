package com.cardex.app.data.repository

import com.cardex.app.domain.model.MarketFilter
import com.cardex.app.domain.model.MarketListing
import com.cardex.app.domain.model.MarketListingStatus
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.util.UUID

class MarketplaceRepositoryTest {

    private fun createRepository(): MarketplaceRepositoryImpl {
        val testListings = listOf(
            MarketListing(
                id = "listing-mitica",
                cardInstanceId = UUID.randomUUID().toString(),
                cardName = "Charizard Ex",
                cardType = "OFFICIAL",
                conditionFloat = 0.005,
                wearTier = "Mítico",
                sellerId = "vendedor-1",
                sellerName = "Vendedor A",
                pricePen = 500.0,
                thumbnailUrl = ""
            ),
            MarketListing(
                id = "listing-generica",
                cardInstanceId = UUID.randomUUID().toString(),
                cardName = "Robot Cibernético",
                cardType = "GENERIC",
                conditionFloat = 0.45,
                wearTier = "Raro",
                sellerId = "vendedor-2",
                sellerName = "Vendedor B",
                pricePen = 40.0,
                thumbnailUrl = ""
            )
        )
        return MarketplaceRepositoryImpl(testListings)
    }

    @Test
    fun `getListings filtra correctamente por Grado y Tipo`() = runTest {
        val repo = createRepository()

        // Filtrar solo Mítico
        val miticas = repo.getListings(MarketFilter(selectedWearTier = "Mítico")).first()
        assertEquals(1, miticas.size)
        assertEquals("Charizard Ex", miticas[0].cardName)

        // Filtrar solo Genéricas
        val genericas = repo.getListings(MarketFilter(cardType = "GENERIC")).first()
        assertEquals(1, genericas.size)
        assertEquals("Robot Cibernético", genericas[0].cardName)
    }

    @Test
    fun `reserveCard bloquea exitosamente y previene compras simultaneas`() = runTest {
        val repo = createRepository()

        // Comprador 1 reserva la carta mítica
        val res1 = repo.reserveCard("listing-mitica", "comprador-1")
        assertTrue(res1.success)
        assertEquals(500.0, res1.pricePen)
        assertNotNull(res1.reservedUntilEpochMillis)

        // Comprador 2 intenta reservar la misma carta al mismo instante
        val res2 = repo.reserveCard("listing-mitica", "comprador-2")
        assertFalse(res2.success)
        assertTrue(res2.message.contains("ya ha sido reservada"))

        // El listado debe figurar como RESERVED
        val listing = repo.getListingById("listing-mitica").first()
        assertEquals(MarketListingStatus.RESERVED, listing?.status)
        assertEquals("comprador-1", listing?.reservedBy)
    }

    @Test
    fun `reserveCard rechaza si el vendedor intenta comprarse a si mismo`() = runTest {
        val repo = createRepository()

        val res = repo.reserveCard("listing-mitica", "vendedor-1")
        assertFalse(res.success)
        assertTrue(res.message.contains("No puedes comprar tu propia carta"))
    }

    @Test
    fun `cancelReservation libera el candado y devuelve carta a AVAILABLE`() = runTest {
        val repo = createRepository()
        repo.reserveCard("listing-mitica", "comprador-1")

        val cancelled = repo.cancelReservation("listing-mitica", "comprador-1")
        assertTrue(cancelled)

        val listing = repo.getListingById("listing-mitica").first()
        assertEquals(MarketListingStatus.AVAILABLE, listing?.status)
        assertNull(listing?.reservedBy)
    }

    @Test
    fun `confirmPurchase cambia estado a SOLD tras pago en Mercado Pago`() = runTest {
        val repo = createRepository()
        repo.reserveCard("listing-mitica", "comprador-1")

        val confirmed = repo.confirmPurchase("listing-mitica", "comprador-1", "mp-payment-999")
        assertTrue(confirmed)

        val listing = repo.getListingById("listing-mitica").first()
        assertEquals(MarketListingStatus.SOLD, listing?.status)
    }
}
