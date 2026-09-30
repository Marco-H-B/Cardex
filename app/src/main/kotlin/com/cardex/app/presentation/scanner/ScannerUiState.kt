package com.cardex.app.presentation.scanner

import com.cardex.app.domain.model.CapturedSide
import com.cardex.app.domain.model.CardSide

/**
 * Estado inmutable de la pantalla del Escáner Óptico.
 */
data class ScannerUiState(
    val currentSide: CardSide = CardSide.FRONT,
    val isProcessing: Boolean = false,
    val lastSharpnessScore: Double? = null,
    val isBlurry: Boolean = false,
    val statusMessage: String = "Apunta la carta hacia la guía rectangular y captura el anverso.",
    val errorMessage: String? = null,
    val capturedFront: CapturedSide? = null,
    val capturedBack: CapturedSide? = null,
    val savedCardId: String? = null,
    val isScanComplete: Boolean = false
)
