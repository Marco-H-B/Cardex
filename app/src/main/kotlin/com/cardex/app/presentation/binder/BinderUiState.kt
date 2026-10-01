package com.cardex.app.presentation.binder

import com.cardex.app.data.local.entity.CardEntity

/**
 * Filtro de categoría de cartas del archivador.
 */
enum class CardCategoryFilter {
    ALL,
    OFFICIAL_TCG,
    GENERIC
}

/**
 * Modelo que encapsula el contenido de un bolsillo individual del archivador 3x3.
 * Soporta apilamiento de cartas duplicadas de la misma posición (hasta 3 visibles con contador de copias).
 */
data class CardSlotItem(
    val primaryCard: CardEntity,
    val copies: List<CardEntity> = listOf(primaryCard),
    val count: Int = copies.size
) {
    val name: String get() = primaryCard.name
    val id: String get() = primaryCard.id
    val conditionGrade: String? get() = primaryCard.conditionGrade
    val conditionFloat: Double? get() = primaryCard.conditionFloat
    val frontThumbnailPath: String get() = primaryCard.frontThumbnailPath
}

/**
 * Estado inmutable de la interfaz de usuario para el Archivador Virtual 3x3.
 *
 * @property currentPageIndex Índice de la página actualmente desplegada (base 0).
 * @property totalPages Cantidad total de hojas/páginas generadas en la colección.
 * @property totalCards Cantidad total de cartas escaneadas en el archivador.
 * @property currentSlots Arreglo/lista de exactamente 9 elementos que representan
 *                        los 9 bolsillos físicos de la hoja 3x3 (null si el bolsillo está vacío).
 * @property searchQuery Texto ingresado por el usuario en la barra de búsqueda en tiempo real.
 * @property searchSuggestions Cartas sugeridas instantáneamente por el árbol Trie en RAM (O(L)).
 * @property selectedCategory Filtro activo de categoría (Todas, Oficiales o Genéricas).
 * @property selectedGradeFilter Filtro activo por grado de desgaste (ej. "Mítico", "Épico", etc.).
 * @property selectedCardFor3D Carta seleccionada para ser proyectada en el Visor 3D Interactivo.
 * @property isLoading Indica si los datos iniciales están siendo cargados desde Room Database.
 */
data class BinderUiState(
    val currentPageIndex: Int = 0,
    val totalPages: Int = 0,
    val totalCards: Int = 0,
    val currentSlots: List<CardSlotItem?> = List(9) { null },
    val searchQuery: String = "",
    val searchSuggestions: List<CardEntity> = emptyList(),
    val selectedCategory: CardCategoryFilter = CardCategoryFilter.ALL,
    val selectedGradeFilter: String? = null,
    val selectedCardFor3D: CardEntity? = null,
    val isLoading: Boolean = false
)
