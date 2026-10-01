package com.cardex.app.presentation.binder

import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.data.repository.FakeCardDao
import com.cardex.app.data.repository.CardRepositoryImpl
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class BinderViewModelTest {

    private val testDispatcher = StandardTestDispatcher()
    private lateinit var fakeDao: FakeCardDao
    private lateinit var repository: CardRepositoryImpl
    private lateinit var viewModel: BinderViewModel

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        fakeDao = FakeCardDao()
        repository = CardRepositoryImpl(fakeDao)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    private fun createTestCard(
        id: String,
        name: String,
        catalogId: String? = null,
        grade: String = "Mítico"
    ): CardEntity {
        return CardEntity(
            id = id,
            catalogId = catalogId,
            name = name,
            frontThumbnailPath = "path/front_$id.webp",
            backThumbnailPath = "path/back_$id.webp",
            frontHdPath = "path/front_hd_$id.webp",
            backHdPath = "path/back_hd_$id.webp",
            conditionGrade = grade
        )
    }

    @Test
    fun `archivador vacio debe inicializar con 0 paginas y 9 slots nulos`() = runBlocking {
        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals(0, state.totalCards)
        assertEquals(0, state.totalPages)
        assertEquals(9, state.currentSlots.size)
        assertTrue(state.currentSlots.all { it == null })
    }

    @Test
    fun `insertar 12 cartas debe generar 2 paginas con navegacion O(1)`() = runBlocking {
        // Preparar 12 cartas
        val cards = (1..12).map { i ->
            createTestCard(id = "card_$i", name = "Card #$i", catalogId = "cat_$i")
        }
        fakeDao.insertCards(cards)

        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals(12, state.totalCards)
        assertEquals(2, state.totalPages)
        assertEquals(0, state.currentPageIndex)

        // La página 0 debe tener exactamente 9 cartas no nulas
        assertEquals(9, state.currentSlots.count { it != null })
        assertEquals("Card #1", state.currentSlots[0]?.name)

        // Avanzar a la página 1 en O(1)
        val advanced = viewModel.nextPage()
        assertTrue(advanced)

        val page1State = viewModel.uiState.value
        assertEquals(1, page1State.currentPageIndex)
        // La página 1 debe tener 3 cartas y 6 slots vacíos
        assertEquals(3, page1State.currentSlots.count { it != null })
        assertEquals("Card #10", page1State.currentSlots[0]?.name)

        // Intentar avanzar más allá de la última página debe retornar false
        assertFalse(viewModel.nextPage())

        // Retroceder a la página 0 en O(1)
        val retroceded = viewModel.previousPage()
        assertTrue(retroceded)
        assertEquals(0, viewModel.uiState.value.currentPageIndex)

        // Intentar retroceder antes de la primera página debe retornar false
        assertFalse(viewModel.previousPage())
    }

    @Test
    fun `busqueda instantanea con Trie debe filtrar en memoria RAM`() = runBlocking {
        val pikachu = createTestCard("c1", "Pikachu", "cat_pika")
        val pidgeot = createTestCard("c2", "Pidgeot", "cat_pidg")
        val charizard = createTestCard("c3", "Charizard", "cat_chari")

        fakeDao.insertCards(listOf(pikachu, pidgeot, charizard))

        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        // Búsqueda con prefijo "pi"
        viewModel.onSearchQueryChanged("pi")
        val state = viewModel.uiState.value
        assertEquals(2, state.searchSuggestions.size)
        assertTrue(state.searchSuggestions.any { it.name == "Pikachu" })
        assertTrue(state.searchSuggestions.any { it.name == "Pidgeot" })

        // Búsqueda con prefijo "cha"
        viewModel.onSearchQueryChanged("cha")
        val charState = viewModel.uiState.value
        assertEquals(1, charState.searchSuggestions.size)
        assertEquals("Charizard", charState.searchSuggestions[0].name)

        // Búsqueda vacía limpia sugerencias
        viewModel.onSearchQueryChanged("")
        assertEquals(0, viewModel.uiState.value.searchSuggestions.size)
    }

    @Test
    fun `filtros de categoria deben segmentar Oficiales TCG frente a Genericas`() = runBlocking {
        val official = createTestCard("c1", "Oficial 1", catalogId = "cat_oficial")
        val generic = createTestCard("c2", "Genérica 1", catalogId = null)

        fakeDao.insertCards(listOf(official, generic))

        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        // Filtro Oficial TCG
        viewModel.setCategoryFilter(CardCategoryFilter.OFFICIAL_TCG)
        assertEquals(1, viewModel.uiState.value.totalCards)
        assertEquals("Oficial 1", viewModel.uiState.value.currentSlots[0]?.name)

        // Filtro Genérica
        viewModel.setCategoryFilter(CardCategoryFilter.GENERIC)
        assertEquals(1, viewModel.uiState.value.totalCards)
        assertEquals("Genérica 1", viewModel.uiState.value.currentSlots[0]?.name)

        // Restaurar a Todas
        viewModel.setCategoryFilter(CardCategoryFilter.ALL)
        assertEquals(2, viewModel.uiState.value.totalCards)
    }

    @Test
    fun `proyeccion 3D debe activar y desactivar la carta seleccionada`() = runBlocking {
        val card = createTestCard("c1", "Mewtwo")
        fakeDao.insertCard(card)

        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        assertNull(viewModel.uiState.value.selectedCardFor3D)

        viewModel.selectCardFor3D(card)
        assertNotNull(viewModel.uiState.value.selectedCardFor3D)
        assertEquals("Mewtwo", viewModel.uiState.value.selectedCardFor3D?.name)

        viewModel.dismiss3DViewer()
        assertNull(viewModel.uiState.value.selectedCardFor3D)
    }

    @Test
    fun `categoria generica con carta 439 debe ubicarse en pagina 48 bolsillo 6 con 49 paginas`() = runBlocking {
        val card = createTestCard("c_439", "Carta Generica #439", catalogId = null)
        fakeDao.insertCard(card)

        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        // En ALL: orden denso, 1 carta en página 0 bolsillo 0
        assertEquals(1, viewModel.uiState.value.totalCards)
        assertEquals(1, viewModel.uiState.value.totalPages)
        assertEquals("Carta Generica #439", viewModel.uiState.value.currentSlots[0]?.name)

        // Cambiar a categoría GENERIC: orden disperso por número
        viewModel.setCategoryFilter(CardCategoryFilter.GENERIC)
        assertEquals(1, viewModel.uiState.value.totalCards)
        assertEquals(49, viewModel.uiState.value.totalPages)
        // En la página inicial (0), los slots están vacíos esperando #001 a #009
        assertTrue(viewModel.uiState.value.currentSlots.all { it == null })

        // Navegar a la página 48 (índice 48)
        for (i in 0 until 48) {
            viewModel.nextPage()
        }
        assertEquals(48, viewModel.uiState.value.currentPageIndex)
        // En la página 48, el bolsillo 6 contiene la carta #439 (438 % 9 = 6)
        assertEquals("Carta Generica #439", viewModel.uiState.value.currentSlots[6]?.name)
    }

    @Test
    fun `cartas duplicadas deben agruparse en un solo slot con el contador de copias`() = runBlocking {
        val c1 = createTestCard("c1", "Charizard #004", catalogId = "cat_1", grade = "Dañado").copy(conditionFloat = 0.80)
        val c2 = createTestCard("c2", "Charizard #004", catalogId = "cat_1", grade = "Pristine").copy(conditionFloat = 0.02)
        val c3 = createTestCard("c3", "Charizard #004", catalogId = "cat_1", grade = "Near Mint").copy(conditionFloat = 0.10)
        fakeDao.insertCards(listOf(c1, c2, c3))

        viewModel = BinderViewModel(repository)
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals(3, state.totalCards) // 3 cartas físicas en total
        assertEquals(1, state.totalPages)

        // Slot 0 debe contener las 3 copias agrupadas
        val slot0 = state.currentSlots[0]
        assertNotNull(slot0)
        assertEquals(3, slot0!!.count)
        assertEquals(3, slot0.copies.size)
        // La carta principal visible arriba debe ser la de mejor condición (c2 con menor float: 0.02)
        assertEquals("c2", slot0.primaryCard.id)
    }
}
