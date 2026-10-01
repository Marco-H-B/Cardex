package com.cardex.app.presentation.binder

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.repository.CardRepository
import com.cardex.app.domain.structures.BinderDoublyLinkedList
import com.cardex.app.domain.structures.CardTrieSearch
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

/**
 * ViewModel que orquesta el Archivador Virtual 3x3 y el Visor 3D Interactivo.
 *
 * Conecta la persistencia Room SQLite con las estructuras algorítmicas de CC232:
 * 1. [BinderDoublyLinkedList]: Paginación física de 9 cartas por hoja a 120 FPS en tiempo O(1).
 * 2. [CardTrieSearch]: Autocompletado y búsqueda instantánea en memoria RAM en tiempo O(L).
 */
class BinderViewModel(
    private val cardRepository: CardRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(BinderUiState(isLoading = true))
    val uiState: StateFlow<BinderUiState> = _uiState.asStateFlow()

    // Estructura algorítmica canónica de CC232 para paginación bidireccional en O(1)
    internal val binderList = BinderDoublyLinkedList<CardSlotItem>()

    // Estructura algorítmica canónica de CC232 para autocompletado en memoria RAM en O(L)
    internal val cardTrie = CardTrieSearch()

    // Caché en RAM de cartas por ID para resolución inmediata O(1) tras consulta en el Trie
    private val cardLookupMap = HashMap<String, CardEntity>()

    // Colección en memoria bruta emitida por Room antes de filtros locales
    private var rawCardsCache: List<CardEntity> = emptyList()

    init {
        observeCardsFromDatabase()
    }

    private fun observeCardsFromDatabase() {
        viewModelScope.launch {
            cardRepository.getAllCards().collect { cards ->
                rawCardsCache = cards
                rebuildBinderAndIndex()
            }
        }
    }

    /**
     * Reconstruye la Lista Doblemente Enlazada y el Árbol Trie aplicando los filtros activos.
     * Agrupa cartas duplicadas en una misma ranura mostrando hasta 3 sobrepuestas con contador.
     */
    internal fun rebuildBinderAndIndex() {
        binderList.clear()
        cardTrie.clear()
        cardLookupMap.clear()

        // Filtrar la colección según la categoría y grado seleccionados
        val filteredCards = rawCardsCache.filter { card ->
            val matchesCategory = when (_uiState.value.selectedCategory) {
                CardCategoryFilter.ALL -> true
                CardCategoryFilter.OFFICIAL_TCG -> card.catalogId != null
                CardCategoryFilter.GENERIC -> card.catalogId == null
            }
            val matchesGrade = _uiState.value.selectedGradeFilter == null ||
                    card.conditionGrade.equals(_uiState.value.selectedGradeFilter, ignoreCase = true)

            matchesCategory && matchesGrade
        }

        // Indexar cada carta física en el Trie y Map para el buscador
        for (card in filteredCards) {
            cardTrie.insert(card.name, card.id)
            cardLookupMap[card.id] = card
        }

        // Agrupar cartas duplicadas por su clave de identidad o número de coleccionista
        val groupedCards = filteredCards.groupBy { getGroupingKey(it) }

        val slotItems = groupedCards.values.map { cardGroup ->
            // Ordenar copias para que la de mejor estado (menor float) quede visible arriba
            val sortedCopies = cardGroup.sortedBy { it.conditionFloat ?: 1.0 }
            CardSlotItem(
                primaryCard = sortedCopies.first(),
                copies = sortedCopies,
                count = sortedCopies.size
            )
        }

        // Iterar sobre 'slotItems' e insertar según el modo de visualización:
        // - En ALL: Modo denso / cronológico conforme el usuario fue escaneando (appendCard).
        // - En TCG y GENERIC: Modo Álbum Disperso por número de coleccionista (#001 a #999).
        if (_uiState.value.selectedCategory == CardCategoryFilter.ALL) {
            for (slotItem in slotItems) {
                binderList.appendCard(slotItem)
            }
        } else {
            // Ordenamiento por posición fija según el número de la carta
            for (slotItem in slotItems) {
                val cardNum = extractCardNumber(slotItem.primaryCard)
                if (cardNum != null && cardNum > 0) {
                    binderList.setCardAtPosition(cardNum - 1, slotItem)
                } else {
                    binderList.appendCard(slotItem)
                }
            }
        }

        syncStateWithCurrentPage(filteredCards.size)
    }

    private fun getGroupingKey(card: CardEntity): String {
        val num = extractCardNumber(card)
        return if (num != null) {
            "NUM_$num"
        } else if (!card.catalogId.isNullOrBlank()) {
            "CAT_${card.catalogId}"
        } else {
            "NAME_${card.name.trim().lowercase()}"
        }
    }

    /**
     * Extrae el número entero de coleccionista de la carta (ej. #439 -> 439, 025/165 -> 25).
     */
    private fun extractCardNumber(card: CardEntity): Int? {
        val fromNumber = card.cardNumber?.let { numStr ->
            Regex("""\d+""").find(numStr)?.value?.toIntOrNull()
        }
        if (fromNumber != null && fromNumber > 0) return fromNumber

        val fromName = Regex("""#(\d+)""").find(card.name)?.groupValues?.getOrNull(1)?.toIntOrNull()
        if (fromName != null && fromName > 0) return fromName

        val fromCatalog = card.catalogId?.let { catId ->
            Regex("""\d+""").find(catId)?.value?.toIntOrNull()
        }
        if (fromCatalog != null && fromCatalog > 0) return fromCatalog

        return null
    }

    /**
     * Avanza a la siguiente página del archivador en O(1) tiempo constante.
     * Retorna true si avanzó exitosamente, false si ya está en la última página.
     */
    fun nextPage(): Boolean {
        // TODO: [Marco - Paso 4]: Invocar binderList.nextPage().
        //       Si retorna true, sincronizar el estado visual llamando a syncStateWithCurrentPage() y retornar true.
        //       Si retorna false, retornar false.
        val moved = binderList.nextPage()
        if (moved) {
            syncStateWithCurrentPage()
            return true
        }
        return false
    }

    /**
     * Retrocede a la página anterior del archivador en O(1) tiempo constante.
     * Retorna true si retrocedió exitosamente, false si ya está en la primera página.
     */
    fun previousPage(): Boolean {
        // TODO: [Marco - Paso 5]: Invocar binderList.previousPage().
        //       Si retorna true, sincronizar el estado visual llamando a syncStateWithCurrentPage() y retornar true.
        //       Si retorna false, retornar false.
        val moved = binderList.previousPage()
        if (moved) {
            syncStateWithCurrentPage()
            return true
        }
        return false
    }

    /**
     * Procesa los cambios en el texto del buscador y consulta el Árbol Trie en tiempo O(L).
     */
    fun onSearchQueryChanged(query: String) {
        // TODO: [Marco - Paso 6]:
        // 1. Si query.isBlank():
        //    Actualizar _uiState con searchQuery = query y searchSuggestions = emptyList().
        // 2. Si query no está en blanco:
        //    - Consultar los IDs sugeridos mediante cardTrie.searchPrefix(query).
        //    - Mapear cada ID a su CardEntity correspondiente usando cardLookupMap[id].
        //    - Actualizar _uiState con el query y la lista de sugerencias resultantes.
        if (query.isBlank()) {
            _uiState.update { it.copy(searchQuery = query, searchSuggestions = emptyList()) }
        } else {
            val matchingIds = cardTrie.searchPrefix(query)
            val suggestions = matchingIds.mapNotNull { cardLookupMap[it] }
            _uiState.update { it.copy(searchQuery = query, searchSuggestions = suggestions) }
        }
    }

    /**
     * Cambia el filtro de categoría (Todas, Oficiales TCG, Genéricas) y reconstruye el archivador.
     */
    fun setCategoryFilter(filter: CardCategoryFilter) {
        _uiState.update { it.copy(selectedCategory = filter) }
        rebuildBinderAndIndex()
    }

    /**
     * Cambia el filtro de grado de desgaste (Mítico, Épico, Raro, etc.) y reconstruye el archivador.
     */
    fun setGradeFilter(grade: String?) {
        _uiState.update { it.copy(selectedGradeFilter = grade) }
        rebuildBinderAndIndex()
    }

    /**
     * Selecciona una carta para proyectarla en el Visor 3D Interactivo.
     */
    fun selectCardFor3D(card: CardEntity?) {
        _uiState.update { it.copy(selectedCardFor3D = card) }
    }

    /**
     * Cierra el Visor 3D Interactivo regresando a la vista del archivador.
     */
    fun dismiss3DViewer() {
        _uiState.update { it.copy(selectedCardFor3D = null) }
    }

    /**
     * Sincroniza las 9 ranuras visibles de la página activa con el estado inmutable de Compose.
     */
    private fun syncStateWithCurrentPage(totalPhysicalCards: Int? = null) {
        val currentPage = binderList.getCurrentPage()
        val slots = currentPage?.getCards() ?: List(9) { null }
        val pageIdx = currentPage?.pageIndex ?: 0

        _uiState.update { current ->
            current.copy(
                currentPageIndex = pageIdx,
                totalPages = binderList.totalPages(),
                totalCards = totalPhysicalCards ?: current.totalCards.takeIf { it > 0 } ?: binderList.totalCards(),
                currentSlots = slots,
                isLoading = false
            )
        }
    }
}
