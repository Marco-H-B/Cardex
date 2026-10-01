package com.cardex.app.presentation.marketplace

import com.cardex.app.data.repository.MarketplaceRepositoryImpl
import com.cardex.app.domain.model.MarketListing
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.advanceTimeBy
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runCurrent
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.UUID

@OptIn(ExperimentalCoroutinesApi::class)
class MarketplaceViewModelTest {

    private val testDispatcher = StandardTestDispatcher()

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    private fun createViewModel(): MarketplaceViewModel {
        val testListings = listOf(
            MarketListing(
                id = "m-01",
                cardInstanceId = UUID.randomUUID().toString(),
                cardName = "Charizard Ex Mítico",
                cardType = "OFFICIAL",
                conditionFloat = 0.002,
                wearTier = "Mítico",
                sellerId = "otro-vendedor",
                sellerName = "Vendedor A",
                pricePen = 600.0,
                thumbnailUrl = ""
            )
        )
        val repo = MarketplaceRepositoryImpl(testListings)
        return MarketplaceViewModel(repo, currentUserId = "marco-buyer")
    }

    @Test
    fun `inicializacion carga listados en uiState`() = runTest(testDispatcher) {
        val vm = createViewModel()
        runCurrent()

        assertEquals(1, vm.uiState.value.listings.size)
        assertEquals("Charizard Ex Mítico", vm.uiState.value.listings[0].cardName)
    }

    @Test
    fun `reserveListing inicia temporizador de 300 segundos`() = runTest(testDispatcher) {
        val vm = createViewModel()
        runCurrent()

        val listing = vm.uiState.value.listings[0]
        vm.reserveListing(listing)
        runCurrent()

        assertNotNull(vm.uiState.value.reservedListing)
        assertEquals(300, vm.uiState.value.reservationRemainingSeconds)

        // Avanzar el tiempo virtual 5 segundos exactos
        advanceTimeBy(5000)
        runCurrent()
        assertEquals(295, vm.uiState.value.reservationRemainingSeconds)
    }

    @Test
    fun `cancelReservation resetea estado y libera listing`() = runTest(testDispatcher) {
        val vm = createViewModel()
        runCurrent()

        val listing = vm.uiState.value.listings[0]
        vm.reserveListing(listing)
        runCurrent()

        vm.cancelReservation()
        runCurrent()

        assertNull(vm.uiState.value.reservedListing)
        assertEquals(0, vm.uiState.value.reservationRemainingSeconds)
    }

    @Test
    fun `payWithMercadoPago confirma compra y marca checkoutSuccess`() = runTest(testDispatcher) {
        val vm = createViewModel()
        runCurrent()

        val listing = vm.uiState.value.listings[0]
        vm.reserveListing(listing)
        runCurrent()

        vm.payWithMercadoPago()
        // Avanzar tiempo para completar el delay de 1000ms simulando la pasarela
        advanceTimeBy(1200)
        runCurrent()

        assertTrue(vm.uiState.value.checkoutSuccess)
        assertNull(vm.uiState.value.reservedListing)
    }
}
