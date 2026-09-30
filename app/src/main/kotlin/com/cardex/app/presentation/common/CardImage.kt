package com.cardex.app.presentation.common

import android.graphics.BitmapFactory
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.produceState
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.ImageBitmap
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.layout.ContentScale
import com.cardex.app.core.theme.GraphiteSurface
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File

/**
 * Componente nativo de alto rendimiento para decodificación y renderizado asíncrono de mapas de bits WebP locales.
 *
 * Utiliza [Dispatchers.IO] dentro de [produceState] para evitar bloqueos del hilo principal (UI thread),
 * eliminando dependencias externas de terceros y garantizando compatibilidad absoluta con el IDE.
 */
@Composable
fun CardImage(
    imagePath: String,
    contentDescription: String?,
    modifier: Modifier = Modifier,
    contentScale: ContentScale = ContentScale.Crop
) {
    val bitmapState by produceState<ImageBitmap?>(initialValue = null, key1 = imagePath) {
        value = withContext(Dispatchers.IO) {
            val file = File(imagePath)
            if (file.exists() && file.length() > 0) {
                BitmapFactory.decodeFile(file.absolutePath)?.asImageBitmap()
            } else {
                null
            }
        }
    }

    val bitmap = bitmapState
    if (bitmap != null) {
        Image(
            bitmap = bitmap,
            contentDescription = contentDescription,
            contentScale = contentScale,
            modifier = modifier
        )
    } else {
        Box(modifier = modifier.background(GraphiteSurface))
    }
}
