package com.cardex.app.data.image

import android.content.Context
import android.graphics.Bitmap
import android.os.Build
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.util.UUID

/**
 * Resultado estructurado de las dos variantes WebP comprimidas de la carta.
 */
data class CompressedCardImages(
    val thumbnailFile: File,
    val fullHdFile: File,
    val thumbnailBytesSize: Long,
    val fullHdBytesSize: Long
)

/**
 * Pipeline de compresión de mapas de bits a formato WebP optimizado para TCG.
 *
 * Ejecuta el escalado bilineal en el pool de hilos de cómputo matemático ([Dispatchers.Default])
 * y persiste los archivos en el almacenamiento privado de la app ([Dispatchers.IO]),
 * evitando cualquier sobrecarga o congelamiento en el hilo principal de renderizado (UI).
 */
class WebpCardCompressor(private val context: Context) {

    companion object {
        const val THUMBNAIL_WIDTH = 300
        const val THUMBNAIL_HEIGHT = 418
        const val THUMBNAIL_QUALITY = 65

        const val FULL_HD_WIDTH = 1080
        const val FULL_HD_HEIGHT = 1500
        const val FULL_HD_QUALITY = 75

        private const val DIRECTORY_NAME = "cards"
    }

    /**
     * Procesa y comprime un [Bitmap] de entrada produciendo la miniatura (Thumbnail)
     * y la imagen Full HD en formato WebP con calidad diferenciada.
     *
     * @param originalBitmap Mapa de bits original capturado por el sensor óptico.
     * @param prefix Prefijo para identificar la cara ("front" o "back").
     * @return [CompressedCardImages] con las rutas absolutas y pesos en bytes.
     */
    suspend fun compressAndSave(
        originalBitmap: Bitmap,
        prefix: String = "card"
    ): CompressedCardImages = withContext(Dispatchers.Default) {
        val uniqueId = UUID.randomUUID().toString()
        val cardsDir = File(context.filesDir, DIRECTORY_NAME).apply {
            if (!exists()) mkdirs()
        }

        // 1. Generación de Thumbnail (300 x 418)
        val thumbnailBitmap = Bitmap.createScaledBitmap(
            originalBitmap,
            THUMBNAIL_WIDTH,
            THUMBNAIL_HEIGHT,
            true
        )

        // 2. Generación de Full HD (1080 x 1500)
        val fullHdBitmap = Bitmap.createScaledBitmap(
            originalBitmap,
            FULL_HD_WIDTH,
            FULL_HD_HEIGHT,
            true
        )

        val thumbFile = File(cardsDir, "${prefix}_thumb_${uniqueId}.webp")
        val fullHdFile = File(cardsDir, "${prefix}_full_${uniqueId}.webp")

        // 3. Escritura en disco bajo Dispatchers.IO
        withContext(Dispatchers.IO) {
            writeBitmapToWebpFile(thumbnailBitmap, thumbFile, THUMBNAIL_QUALITY)
            writeBitmapToWebpFile(fullHdBitmap, fullHdFile, FULL_HD_QUALITY)
        }

        // Reciclar mapas de bits temporales escalados si no son idénticos al original
        if (thumbnailBitmap != originalBitmap) thumbnailBitmap.recycle()
        if (fullHdBitmap != originalBitmap) fullHdBitmap.recycle()

        CompressedCardImages(
            thumbnailFile = thumbFile,
            fullHdFile = fullHdFile,
            thumbnailBytesSize = thumbFile.length(),
            fullHdBytesSize = fullHdFile.length()
        )
    }

    private fun writeBitmapToWebpFile(bitmap: Bitmap, targetFile: File, quality: Int) {
        val format = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            Bitmap.CompressFormat.WEBP_LOSSY
        } else {
            @Suppress("DEPRECATION")
            Bitmap.CompressFormat.WEBP
        }

        FileOutputStream(targetFile).use { outStream ->
            bitmap.compress(format, quality, outStream)
        }
    }
}
