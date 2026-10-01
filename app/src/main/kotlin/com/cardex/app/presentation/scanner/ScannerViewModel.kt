package com.cardex.app.presentation.scanner

import android.graphics.Bitmap
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cardex.app.data.image.CompressedCardImages
import com.cardex.app.data.image.WebpCardCompressor
import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.algorithms.LaplacianVarianceCalculator
import com.cardex.app.domain.model.CapturedSide
import com.cardex.app.domain.model.CardSide
import com.cardex.app.domain.repository.CardRepository
import com.cardex.app.domain.structures.CaptureStack
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.util.UUID

/**
 * ViewModel que orquesta el ciclo de escaneo óptico, validación de nitidez,
 * compresión WebP y persistencia local atómica.
 */
class ScannerViewModel(
    private val cardRepository: CardRepository,
    private val webpCardCompressor: WebpCardCompressor,
    private val laplacianCalculator: LaplacianVarianceCalculator = LaplacianVarianceCalculator()
) : ViewModel() {

    private val _uiState = MutableStateFlow(ScannerUiState())
    val uiState: StateFlow<ScannerUiState> = _uiState.asStateFlow()

    // Pila de Captura en memoria RAM (CC232 UNI) para control LIFO del escaneo
    private val captureStack = CaptureStack()

    // Almacenamiento temporal de las imágenes comprimidas en el flujo activo
    private var frontCompressedImages: CompressedCardImages? = null
    private var backCompressedImages: CompressedCardImages? = null

    /**
     * Procesa la captura de una de las caras de la carta (Anverso o Reverso).
     */
    fun processCapture(bitmap: Bitmap, cardName: String = "Carta Coleccionable") {
        val currentSide = _uiState.value.currentSide
        _uiState.update { it.copy(isProcessing = true, errorMessage = null, isBlurry = false) }

        viewModelScope.launch {
            try {
                // 1. Detección de Nitidez en escala de grises mediante Varianza Laplaciana
                val grayscalePixels = laplacianCalculator.extractGrayscalePixels(bitmap)
                val variance = laplacianCalculator.calculateVariance(
                    grayscalePixels,
                    bitmap.width,
                    bitmap.height
                )

                if (variance < LaplacianVarianceCalculator.BLUR_THRESHOLD) {
                    _uiState.update {
                        it.copy(
                            isProcessing = false,
                            isBlurry = true,
                            lastSharpnessScore = variance,
                            statusMessage = "Foto borrosa (Nitidez: ${"%.1f".format(variance)} < ${LaplacianVarianceCalculator.BLUR_THRESHOLD.toInt()}). Por favor, mantén el pulso firme y reintenta."
                        )
                    }
                    return@launch
                }

                // 2. Compresión WebP en segundo plano (Thumbnail + Full HD)
                val prefix = if (currentSide == CardSide.FRONT) "front" else "back"
                val compressed = webpCardCompressor.compressAndSave(bitmap, prefix)

                val capturedSide = CapturedSide(
                    side = currentSide,
                    filePath = compressed.fullHdFile.absolutePath,
                    sharpnessScore = variance.toFloat()
                )

                // 3. Gestión de la Pila de Captura (LIFO)
                captureStack.push(capturedSide)

                if (currentSide == CardSide.FRONT) {
                    frontCompressedImages = compressed
                    _uiState.update {
                        it.copy(
                            isProcessing = false,
                            currentSide = CardSide.BACK,
                            capturedFront = capturedSide,
                            lastSharpnessScore = variance,
                            isBlurry = false,
                            statusMessage = "¡Anverso nítido registrado! Ahora dale la vuelta a la carta y escanea el REVERSO."
                        )
                    }
                } else {
                    backCompressedImages = compressed
                    _uiState.update {
                        it.copy(
                            capturedBack = capturedSide,
                            lastSharpnessScore = variance,
                            isBlurry = false,
                            statusMessage = "Comprimiendo y guardando en tu catálogo local..."
                        )
                    }

                    // 4. Ambas caras capturadas: Persistir en Room Database
                    saveCompletedCard(cardName)
                }
            } catch (e: Exception) {
                _uiState.update {
                    it.copy(
                        isProcessing = false,
                        errorMessage = "Error durante el procesamiento óptico: ${e.localizedMessage}"
                    )
                }
            }
        }
    }

    /**
     * Deshace la última captura extrayendo el elemento del tope de la pila (LIFO O(1)).
     */
    fun retry() {
        if (captureStack.isEmpty()) return

        val popped = captureStack.pop()
        if (popped.side == CardSide.BACK) {
            backCompressedImages = null
            _uiState.update {
                it.copy(
                    currentSide = CardSide.BACK,
                    capturedBack = null,
                    statusMessage = "Reverso descartado. Vuelve a capturar el reverso."
                )
            }
        } else {
            frontCompressedImages = null
            _uiState.update {
                it.copy(
                    currentSide = CardSide.FRONT,
                    capturedFront = null,
                    statusMessage = "Anverso descartado. Vuelve a capturar el anverso."
                )
            }
        }
    }

    /**
     * Reinicia por completo la sesión de escaneo vaciando la pila.
     */
    fun resetScan() {
        captureStack.clear()
        frontCompressedImages = null
        backCompressedImages = null
        _uiState.value = ScannerUiState()
    }

    private suspend fun saveCompletedCard(cardName: String) {
        val front = frontCompressedImages ?: return
        val back = backCompressedImages ?: return
        val cardId = UUID.randomUUID().toString()
        val extractedNumber = Regex("""#(\d+)""").find(cardName)?.value

        val cardEntity = CardEntity(
            id = cardId,
            name = cardName,
            cardNumber = extractedNumber,
            frontThumbnailPath = front.thumbnailFile.absolutePath,
            backThumbnailPath = back.thumbnailFile.absolutePath,
            frontHdPath = front.fullHdFile.absolutePath,
            backHdPath = back.fullHdFile.absolutePath,
            conditionGrade = "MINT",
            conditionFloat = 0.05,
            isSynced = false
        )

        cardRepository.saveCard(cardEntity)
        captureStack.clear()

        _uiState.update {
            it.copy(
                isProcessing = false,
                savedCardId = cardId,
                isScanComplete = true,
                statusMessage = "¡Carta guardada exitosamente en Room SQLite!"
            )
        }
    }
}
