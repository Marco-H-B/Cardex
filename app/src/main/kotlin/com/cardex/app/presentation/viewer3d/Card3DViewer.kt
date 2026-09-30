package com.cardex.app.presentation.viewer3d

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.RotateRight
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Verified
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.cardex.app.presentation.common.CardImage
import com.cardex.app.core.theme.CarbonBorder
import com.cardex.app.core.theme.CommonBlue
import com.cardex.app.core.theme.DamagedGlacier
import com.cardex.app.core.theme.EpicCrimson
import com.cardex.app.core.theme.GraphiteSurface
import com.cardex.app.core.theme.MythicGold
import com.cardex.app.core.theme.OledBlack
import com.cardex.app.core.theme.RarePurple
import com.cardex.app.core.theme.SlateTextSecondary
import com.cardex.app.core.theme.SnowTextPrimary
import com.cardex.app.data.local.entity.CardEntity
import java.io.File
import kotlin.math.abs

/**
 * Visor Tridimensional Interactivo para inspección minuciosa de cartas físicas coleccionables.
 *
 * Características Técnicas:
 * - Rotación libre en ejes X e Y mediante gestos táctiles directos.
 * - Conmutación automática de textura entre Anverso (Cara A) y Reverso (Cara B)
 *   exactamente al cruzar el umbral angular de los 90 grados.
 * - Simulación de perspectiva física con 'cameraDistance' de alta precisión.
 * - Brillo holográfico cromático reactivo al ángulo de giro.
 * - Ficha técnica de coleccionista con Float decimal inmutable y Grado oficial.
 */
@Composable
@Suppress("FunctionName")
fun Card3DViewer(
    card: CardEntity,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    // Ángulos de rotación tridimensional en grados
    var rotationY by remember { mutableFloatStateOf(0f) }
    var rotationX by remember { mutableFloatStateOf(0f) }

    val density = LocalDensity.current

    // Normalizar ángulo Y en el rango [0, 360) para evaluar la cara visible
    val normalizedY = ((rotationY % 360f) + 360f) % 360f
    // La cara frontal es visible de 0° a 90° y de 270° a 360°
    val isFrontVisible = normalizedY in 0f..90f || normalizedY in 270f..360f

    // Color temático del Grado de desgaste (Float Tier)
    val gradeColor = when (card.conditionGrade?.lowercase()) {
        "mítico", "mitico", "gem mint" -> MythicGold
        "épico", "epico", "near mint" -> EpicCrimson
        "raro", "excellent" -> RarePurple
        "común", "comun", "light played" -> CommonBlue
        "dañado", "danado", "poor" -> DamagedGlacier
        else -> MythicGold
    }

    // Fondo degradado radial centrado en #1A1A1A hacia #000000 OLED
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(
                Brush.radialGradient(
                    colors = listOf(Color(0xFF1C1C1E), OledBlack),
                    radius = 1200f
                )
            )
            .pointerInput(Unit) {
                detectDragGestures { change, dragAmount ->
                    change.consume()
                    // Factor de sensibilidad táctil calibrado
                    val sensitivity = 0.5f
                    rotationY += dragAmount.x * sensitivity
                    // Limitar rotación X entre -45° y 45° para ergonomía visual
                    rotationX = (rotationX - dragAmount.y * sensitivity).coerceIn(-45f, 45f)
                }
            }
    ) {
        // Botón de cierre en esquina superior derecha
        IconButton(
            onClick = onDismiss,
            modifier = Modifier
                .align(Alignment.TopEnd)
                .padding(top = 40.dp, end = 20.dp)
                .size(44.dp)
                .clip(CircleShape)
                .background(GraphiteSurface.copy(alpha = 0.8f))
                .border(1.dp, CarbonBorder, CircleShape)
        ) {
            Icon(
                imageVector = Icons.Default.Close,
                contentDescription = "Cerrar visor 3D",
                tint = SnowTextPrimary
            )
        }

        // Indicador de control táctil superior
        Row(
            modifier = Modifier
                .align(Alignment.TopCenter)
                .padding(top = 48.dp)
                .clip(RoundedCornerShape(20.dp))
                .background(GraphiteSurface.copy(alpha = 0.85f))
                .border(1.dp, CarbonBorder, RoundedCornerShape(20.dp))
                .padding(horizontal = 14.dp, vertical = 6.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = Icons.AutoMirrored.Filled.RotateRight,
                contentDescription = null,
                tint = gradeColor,
                modifier = Modifier.size(16.dp)
            )
            Spacer(modifier = Modifier.width(6.dp))
            Text(
                text = if (isFrontVisible) "Anverso (Cara A)" else "Reverso (Cara B)",
                style = MaterialTheme.typography.bodyMedium.copy(
                    fontSize = 12.sp,
                    fontWeight = FontWeight.SemiBold,
                    color = SnowTextPrimary
                )
            )
        }

        // Contenedor Central de la Carta 3D
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(horizontal = 40.dp, vertical = 120.dp),
            contentAlignment = Alignment.Center
        ) {
            // Sombra ovalada de proyección en suelo dinámica
            Box(
                modifier = Modifier
                    .width(220.dp)
                    .height(28.dp)
                    .align(Alignment.BottomCenter)
                    .graphicsLayer {
                        // La sombra se comprime o estira según la inclinación
                        scaleX = 1f + (abs(rotationX) / 90f) * 0.2f
                        alpha = (0.5f - (abs(rotationX) / 100f)).coerceIn(0.1f, 0.5f)
                    }
                    .background(
                        Brush.radialGradient(
                            colors = listOf(Color.Black.copy(alpha = 0.7f), Color.Transparent)
                        ),
                        shape = CircleShape
                    )
            )

            // Escenario de Carta 3D acelerado por hardware
            Box(
                modifier = Modifier
                    .fillMaxWidth(0.78f)
                    .aspectRatio(63f / 88f) // Proporción física estándar TCG
                    .graphicsLayer {
                        this.rotationY = rotationY
                        this.rotationX = rotationX
                        // Distancia de cámara calibrada para emular perspectiva focal de 50mm
                        this.cameraDistance = 16f * density.density
                    }
                    .shadow(elevation = 24.dp, shape = RoundedCornerShape(12.dp))
                    .clip(RoundedCornerShape(12.dp))
                    .background(GraphiteSurface)
                    .border(
                        width = 1.5.dp,
                        color = gradeColor.copy(alpha = 0.6f),
                        shape = RoundedCornerShape(12.dp)
                    )
            ) {
                val imagePath = if (isFrontVisible) card.frontHdPath else card.backHdPath
                val imageFile = File(imagePath)

                // Si estamos en el reverso, invertir la textura en Y para que no se vea como espejo
                val contentModifier = if (!isFrontVisible) {
                    Modifier
                        .fillMaxSize()
                        .graphicsLayer { this.rotationY = 180f }
                } else {
                    Modifier.fillMaxSize()
                }

                CardImage(
                    imagePath = imagePath,
                    contentDescription = card.name,
                    contentScale = ContentScale.Crop,
                    modifier = contentModifier
                )

                // Franja holográfica reactiva al ángulo de rotación
                val holographicBrush = Brush.linearGradient(
                    colors = listOf(
                        Color.Transparent,
                        Color.White.copy(alpha = 0.18f),
                        gradeColor.copy(alpha = 0.25f),
                        Color.Cyan.copy(alpha = 0.15f),
                        Color.Transparent
                    ),
                    start = androidx.compose.ui.geometry.Offset(
                        x = (rotationY * 8f) % 800f,
                        y = 0f
                    ),
                    end = androidx.compose.ui.geometry.Offset(
                        x = ((rotationY * 8f) % 800f) + 300f,
                        y = 600f
                    )
                )

                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(holographicBrush)
                )
            }
        }

        // Ficha Técnica Inferior de Coleccionista
        Surface(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .fillMaxWidth()
                .padding(16.dp),
            shape = RoundedCornerShape(24.dp),
            color = GraphiteSurface.copy(alpha = 0.95f),
            border = androidx.compose.foundation.BorderStroke(1.dp, CarbonBorder)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(20.dp)
            ) {
                // Fila de Título y Badges
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = card.name,
                            style = MaterialTheme.typography.titleLarge.copy(
                                fontWeight = FontWeight.Bold,
                                color = SnowTextPrimary
                            )
                        )
                        card.setName?.let { set ->
                            Text(
                                text = "$set ${card.cardNumber?.let { "• #$it" } ?: ""}",
                                style = MaterialTheme.typography.bodyMedium.copy(
                                    color = SlateTextSecondary,
                                    fontSize = 13.sp
                                )
                            )
                        }
                    }

                    // Badge de Grado Oficial
                    card.conditionGrade?.let { grade ->
                        Box(
                            modifier = Modifier
                                .clip(RoundedCornerShape(8.dp))
                                .background(gradeColor.copy(alpha = 0.18f))
                                .border(1.dp, gradeColor, RoundedCornerShape(8.dp))
                                .padding(horizontal = 10.dp, vertical = 5.dp)
                        ) {
                            Text(
                                text = grade.uppercase(),
                                style = MaterialTheme.typography.labelSmall.copy(
                                    fontWeight = FontWeight.Bold,
                                    color = gradeColor,
                                    letterSpacing = 0.5.sp
                                )
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(14.dp))

                // Fila de Métricas: Float inmutable y Categoría
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(12.dp))
                        .background(OledBlack)
                        .border(1.dp, CarbonBorder, RoundedCornerShape(12.dp))
                        .padding(12.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "FLOAT DE DESGASTE",
                            style = MaterialTheme.typography.labelSmall.copy(
                                color = SlateTextSecondary,
                                fontSize = 10.sp,
                                fontWeight = FontWeight.Bold
                            )
                        )
                        Text(
                            text = card.conditionFloat?.let { String.format("%.9f", it) } ?: "0.000000000",
                            style = MaterialTheme.typography.bodyMedium.copy(
                                fontFamily = FontFamily.Monospace,
                                fontWeight = FontWeight.Bold,
                                color = gradeColor,
                                fontSize = 14.sp
                            )
                        )
                    }

                    // Badge Oficial vs Genérica
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier
                            .clip(RoundedCornerShape(6.dp))
                            .background(
                                if (card.catalogId != null) MythicGold.copy(alpha = 0.2f)
                                else Color(0xFF3A3A3C)
                            )
                            .padding(horizontal = 8.dp, vertical = 4.dp)
                    ) {
                        if (card.catalogId != null) {
                            Icon(
                                imageVector = Icons.Default.Verified,
                                contentDescription = null,
                                tint = MythicGold,
                                modifier = Modifier.size(14.dp)
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                            Text(
                                text = "OFICIAL TCG",
                                style = MaterialTheme.typography.labelSmall.copy(
                                    fontWeight = FontWeight.Bold,
                                    color = MythicGold,
                                    fontSize = 11.sp
                                )
                            )
                        } else {
                            Text(
                                text = "GENÉRICA",
                                style = MaterialTheme.typography.labelSmall.copy(
                                    fontWeight = FontWeight.Bold,
                                    color = SnowTextPrimary,
                                    fontSize = 11.sp
                                )
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(16.dp))

                // Botón de acción principal
                Button(
                    onClick = onDismiss,
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(14.dp),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = gradeColor,
                        contentColor = OledBlack
                    )
                ) {
                    Text(
                        text = "Regresar al Archivador",
                        style = MaterialTheme.typography.labelLarge.copy(
                            fontWeight = FontWeight.Bold
                        )
                    )
                }
            }
        }
    }
}
