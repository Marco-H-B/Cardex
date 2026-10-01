package com.cardex.app.data.repository

import com.cardex.app.data.local.dao.CardDao
import com.cardex.app.data.local.entity.CardEntity
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test

// Implementación simulada (Fake) del DAO para pruebas unitarias rápidas sin levantar SQLite en disco.
class FakeCardDao : CardDao {
    private val cards = mutableListOf<CardEntity>()

    override fun getAllCards(): Flow<List<CardEntity>> = flowOf(cards.toList())

    override fun getCardById(id: String): Flow<CardEntity?> = flowOf(cards.find { it.id == id })

    override suspend fun insertCard(card: CardEntity) {
        cards.removeAll { it.id == card.id }
        cards.add(card)
    }

    override suspend fun insertCards(cards: List<CardEntity>) {
        for (c in cards) insertCard(c)
    }

    override suspend fun updateCard(card: CardEntity) {
        insertCard(card)
    }

    override suspend fun deleteCard(card: CardEntity) {
        cards.remove(card)
    }

    override suspend fun deleteCardById(id: String) {
        cards.removeAll { it.id == id }
    }

    override suspend fun getPendingSyncCards(): List<CardEntity> = cards.filter { !it.isSynced }

    override fun getCardCount(): Flow<Int> = flowOf(cards.size)
}

// Pruebas unitarias de Clean Architecture para el repositorio de cartas.
class CardRepositoryTest {

    private lateinit var fakeDao: FakeCardDao
    private lateinit var repository: CardRepositoryImpl

    @Before
    fun setUp() {
        fakeDao = FakeCardDao()
        repository = CardRepositoryImpl(fakeDao)
    }

    @Test
    fun `saveCard debe persistir la carta y poder recuperarla por id`() = runBlocking {
        val card = CardEntity(
            id = "uuid-001",
            catalogId = "pika-025",
            name = "Pikachu",
            frontThumbnailPath = "/cache/pika_front_thumb.webp",
            backThumbnailPath = "/cache/pika_back_thumb.webp",
            frontHdPath = "/cache/pika_front_hd.webp",
            backHdPath = "/cache/pika_back_hd.webp",
            conditionFloat = 0.0412,
            conditionGrade = "Gem Mint"
        )

        repository.saveCard(card)

        val retrieved = repository.getCardById("uuid-001").first()
        assertNotNull(retrieved)
        assertEquals("Pikachu", retrieved?.name)
        assertEquals("Gem Mint", retrieved?.conditionGrade)
    }

    @Test
    fun `saveCards debe persistir un lote masivo de cartas en Room`() = runBlocking {
        val list = listOf(
            CardEntity(id = "c1", name = "Charizard", frontThumbnailPath = "", backThumbnailPath = "", frontHdPath = "", backHdPath = ""),
            CardEntity(id = "c2", name = "Blastoise", frontThumbnailPath = "", backThumbnailPath = "", frontHdPath = "", backHdPath = "")
        )
        repository.saveCards(list)

        val retrieved1 = repository.getCardById("c1").first()
        val retrieved2 = repository.getCardById("c2").first()
        assertNotNull(retrieved1)
        assertNotNull(retrieved2)
        assertEquals("Charizard", retrieved1?.name)
        assertEquals("Blastoise", retrieved2?.name)
    }

    @Test
    fun `deleteCard debe remover la carta del almacenamiento local`() = runBlocking {
        val card = CardEntity(
            id = "uuid-002",
            name = "Charizard",
            frontThumbnailPath = "front_thumb.webp",
            backThumbnailPath = "back_thumb.webp",
            frontHdPath = "front_hd.webp",
            backHdPath = "back_hd.webp"
        )

        repository.saveCard(card)
        repository.deleteCard("uuid-002")

        val retrieved = repository.getCardById("uuid-002").first()
        assertEquals(null, retrieved)
    }

    @Test
    fun `getPendingSyncCards debe retornar unicamente cartas no sincronizadas`() = runBlocking {
        val cardSynced = CardEntity(
            id = "c1",
            name = "Mew",
            frontThumbnailPath = "f.webp",
            backThumbnailPath = "b.webp",
            frontHdPath = "f_hd.webp",
            backHdPath = "b_hd.webp",
            isSynced = true
        )
        val cardPending = CardEntity(
            id = "c2",
            name = "Mewtwo",
            frontThumbnailPath = "f2.webp",
            backThumbnailPath = "b2.webp",
            frontHdPath = "f2_hd.webp",
            backHdPath = "b2_hd.webp",
            isSynced = false
        )

        repository.saveCard(cardSynced)
        repository.saveCard(cardPending)

        val pending = repository.getPendingSyncCards()
        assertEquals(1, pending.size)
        assertEquals("Mewtwo", pending[0].name)
    }
}
