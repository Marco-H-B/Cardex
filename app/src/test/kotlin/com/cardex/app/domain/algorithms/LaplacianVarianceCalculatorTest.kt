package com.cardex.app.domain.algorithms

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * Suite de pruebas unitarias TDD para [LaplacianVarianceCalculator].
 *
 * Valida la detección de nitidez y rechazo de desenfoque mediante la
 * Varianza de la Convolución Laplaciana en tiempo O(W * H).
 */
class LaplacianVarianceCalculatorTest {

    private lateinit var calculator: LaplacianVarianceCalculator

    @Before
    fun setUp() {
        calculator = LaplacianVarianceCalculator()
    }

    @Test(expected = IllegalArgumentException::class)
    fun `matriz menor a 3x3 lanza excepcion por dimensiones invalidas`() {
        val pixels = intArrayOf(10, 20, 30, 40)
        calculator.calculateVariance(pixels, width = 2, height = 2)
    }

    @Test
    fun `imagen uniforme y plana tiene varianza cero y es rechazada por borrosa`() {
        val width = 10
        val height = 10
        val flatPixels = IntArray(width * height) { 128 }

        val variance = calculator.calculateVariance(flatPixels, width, height)
        val isSharp = calculator.isSharp(flatPixels, width, height)

        assertEquals(0.0, variance, 0.001)
        assertFalse(isSharp)
    }

    @Test
    fun `imagen con bordes de alto contraste supera el umbral y es catalogada como nitida`() {
        val width = 10
        val height = 10
        // Patrón con franjas verticales alternadas de alto contraste (0 y 255)
        val sharpPixels = IntArray(width * height) { index ->
            val x = index % width
            if (x % 2 == 0) 255 else 0
        }

        val variance = calculator.calculateVariance(sharpPixels, width, height)
        val isSharp = calculator.isSharp(sharpPixels, width, height)

        assertTrue(
            "La varianza ($variance) debe superar el umbral de 100.0",
            variance >= LaplacianVarianceCalculator.BLUR_THRESHOLD
        )
        assertTrue(isSharp)
    }

    @Test
    fun `gradiente suave de bajo contraste no alcanza el umbral de nitidez`() {
        val width = 20
        val height = 20
        // Gradiente continuo muy suave: la diferencia entre pixeles adyacentes es mínima (1 unidad)
        val smoothPixels = IntArray(width * height) { index ->
            val x = index % width
            val y = index / width
            (x + y) % 256
        }

        val variance = calculator.calculateVariance(smoothPixels, width, height)
        val isSharp = calculator.isSharp(smoothPixels, width, height)

        assertTrue(
            "Un gradiente suave lineal debe tener varianza prácticamente nula ($variance)",
            variance < LaplacianVarianceCalculator.BLUR_THRESHOLD
        )
        assertFalse(isSharp)
    }
}
