package com.cardex.app.presentation.p2p

import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.network.p2p.TradeState
import com.cardex.app.domain.repository.CardRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runCurrent
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class P2PTradeViewModelTest {

    private val testDispatcher = StandardTestDispatcher()

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    private class FakeCardRepository(private val cards: List<CardEntity>) : CardRepository {
        override fun getAllCards(): Flow<List<CardEntity>> = flowOf(cards)
        override fun getCardById(id: String): Flow<CardEntity?> = flowOf(cards.find { it.id == id })
        override suspend fun saveCard(card: CardEntity) {}
        override suspend fun saveCards(cards: List<CardEntity>) {}
        override suspend fun deleteCard(id: String) {}
        override suspend fun getPendingSyncCards(): List<CardEntity> = emptyList()
    }

    private fun sampleCard(id: String = "test-card-1", name: String = "Pikachu"): CardEntity {
        return CardEntity(
            id = id,
            name = name,
            frontThumbnailPath = "front_thumb.webp",
            backThumbnailPath = "back_thumb.webp",
            frontHdPath = "front_hd.webp",
            backHdPath = "back_hd.webp"
        )
    }

    @Test
    fun `inicializacion carga cartas locales en uiState`() = runTest(testDispatcher) {
        val repo = FakeCardRepository(listOf(sampleCard()))
        val vm = P2PTradeViewModel(repo)
        runCurrent()

        assertEquals(1, vm.uiState.value.localCards.size)
        assertEquals("Pikachu", vm.uiState.value.localCards[0].name)
        assertTrue(vm.uiState.value.isHost)
        assertTrue(vm.uiState.value.tradeState is TradeState.Idle)
    }

    @Test
    fun `cambio de modo anfitrion y direccion IP actualiza uiState`() = runTest(testDispatcher) {
        val repo = FakeCardRepository(emptyList())
        val vm = P2PTradeViewModel(repo)
        runCurrent()

        vm.setHostMode(false)
        assertFalse(vm.uiState.value.isHost)

        vm.setPeerIp("192.168.1.100")
        assertEquals("192.168.1.100", vm.uiState.value.peerIpInput)
    }

    @Test
    fun `seleccionar carta para ofrecer actualiza selectedLocalCard`() = runTest(testDispatcher) {
        val card = sampleCard("c-01", "Charizard")
        val repo = FakeCardRepository(listOf(card))
        val vm = P2PTradeViewModel(repo)
        runCurrent()

        vm.selectCardToOffer(card)
        assertEquals(card, vm.uiState.value.selectedLocalCard)
    }
}
