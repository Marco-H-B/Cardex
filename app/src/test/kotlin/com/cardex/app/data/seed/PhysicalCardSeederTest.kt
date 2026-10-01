package com.cardex.app.data.seed

import com.cardex.app.data.repository.CardRepositoryImpl
import com.cardex.app.data.repository.FakeCardDao
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class PhysicalCardSeederTest {

    private lateinit var fakeDao: FakeCardDao
    private lateinit var repository: CardRepositoryImpl

    @Before
    fun setUp() {
        fakeDao = FakeCardDao()
        repository = CardRepositoryImpl(fakeDao)
    }

    @Test
    fun `generate177Cards debe generar exactamente 177 cartas validas`() {
        val cards = PhysicalCardSeeder.generate177Cards()
        assertEquals(177, cards.size)

        val officialCount = cards.count { it.catalogId?.startsWith("POK-") == true }
        val genericCount = cards.count { it.catalogId?.startsWith("GEN-") == true }

        assertEquals(120, officialCount)
        assertEquals(57, genericCount)

        // Verificar invariantes de cada carta
        for (card in cards) {
            assertNotNull(card.id)
            assertNotNull(card.name)
            assertNotNull(card.catalogId)
            assertTrue("Float debe estar en rango [0.0, 1.0]", card.conditionFloat!! in 0.0..1.0)
            assertNotNull("Debe tener asignado un grado de condición", card.conditionGrade)
            assertTrue(card.isSynced)
        }
    }

    @Test
    fun `seedIfEmpty debe poblar la base de datos si esta vacia y no duplicar si ya tiene cartas`() = runBlocking {
        // Inicialmente vacío
        assertEquals(0, repository.getAllCards().first().size)

        // Primera llamada: debe sembrar 177
        PhysicalCardSeeder.seedIfEmpty(repository)
        val seededCards = repository.getAllCards().first()
        assertEquals(177, seededCards.size)

        // Segunda llamada: debe ser idempotente (no duplicar)
        PhysicalCardSeeder.seedIfEmpty(repository)
        val afterSecondCall = repository.getAllCards().first()
        assertEquals(177, afterSecondCall.size)
    }
}
