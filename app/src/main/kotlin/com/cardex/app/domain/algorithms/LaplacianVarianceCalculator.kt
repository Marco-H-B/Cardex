package com.cardex.app.domain.algorithms

import android.graphics.Bitmap
import android.graphics.Color

/**
 * Calculador de nitidez mediante la Varianza de la Convolución Laplaciana (Laplacian Variance).
 *
 * Algoritmo canónico de visión por computadora para detectar si una imagen está
 * correctamente enfocada o desenfocada (borrosa), procesando el canal de luminancia
 * en tiempo O(W * H) con memoria auxiliar mínima.
 *
 * Máscara Laplaciana discreta de 3x3:
 * [  0,  1,  0 ]
 * [  1, -4,  1 ]
 * [  0,  1,  0 ]
 */
class LaplacianVarianceCalculator {

    companion object {
        // Umbral de corte empírico. Varianzas inferiores a 100.0 indican que las transiciones de borde son graduales y la foto carece de nitidez.
        const val BLUR_THRESHOLD: Double = 100.0
    }

    // Evalúa si una imagen representada por su arreglo plano de escala de grises
    // es lo suficientemente nítida para ser procesada.
    fun isSharp(pixels: IntArray, width: Int, height: Int): Boolean {
        return calculateVariance(pixels, width, height) >= BLUR_THRESHOLD
    }

    /**
     * Calcula la varianza estadística del operador Laplaciano sobre la matriz de intensidades.
     *
     * @param pixels Arreglo plano de tamaño [width] * [height] con valores de luminancia [0..255].
     * @param width Ancho en píxeles de la imagen.
     * @param height Alto en píxeles de la imagen.
     * @return Valor de varianza (sigma al cuadrado). Mayor varianza = mayor definición de bordes.
     * @throws IllegalArgumentException Si el ancho o alto son menores a 3, o si el arreglo no coincide con las dimensiones.
     */
    fun calculateVariance(pixels: IntArray, width: Int, height: Int): Double {
        if (width < 3 || height < 3 || pixels.size != width * height) {
            throw IllegalArgumentException("Dimensiones inválidas: width=$width, height=$height, size=${pixels.size}")
        }

        val n = (width - 2) * (height - 2)

        val laplacians = DoubleArray(n)
        var sum = 0.0
        var index = 0

        for (y in 1 until height - 1) {
            for (x in 1 until width - 1) {
                // Obtenemos los vecinos ortogonales usando direccionamiento lineal: y * width + x
                val top = pixels[(y - 1) * width + x]
                val left = pixels[y * width + (x - 1)]
                val right = pixels[y * width + (x + 1)]
                val bottom = pixels[(y + 1) * width + x]
                val center = pixels[y * width + x]

                // Convolución Laplaciana: suma de vecinos ortogonales menos 4 veces el centro
                val laplacian = (top + left + right + bottom - 4 * center).toDouble()

                // Guardamos el resultado en nuestro arreglo y acumulamos para la media
                laplacians[index] = laplacian
                sum += laplacian
                index++
            }
        }

        val mean = sum / n
        var sumSqDiff = 0.0

        for (i in 0 until n) {
            val diff = laplacians[i] - mean
            sumSqDiff += diff * diff
        }

        return sumSqDiff / n
    }

    /**
     * Extrae un arreglo plano de intensidades en escala de grises (luminancia Y)
     * a partir de un objeto [Bitmap] de Android usando la fórmula de luminancia ITU-R BT.601:
     * Y = 0.299*R + 0.587*G + 0.114*B.
     */
    fun extractGrayscalePixels(bitmap: Bitmap): IntArray {
        val width = bitmap.width
        val height = bitmap.height
        val argbPixels = IntArray(width * height)
        bitmap.getPixels(argbPixels, 0, width, 0, 0, width, height)

        val grayscale = IntArray(width * height)
        for (i in argbPixels.indices) {
            val pixel = argbPixels[i]
            val r = Color.red(pixel)
            val g = Color.green(pixel)
            val b = Color.blue(pixel)
            grayscale[i] = (0.299 * r + 0.587 * g + 0.114 * b).toInt()
        }
        return grayscale
    }
}
