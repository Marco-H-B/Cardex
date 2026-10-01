package com.cardex.app.presentation.subscription

import android.content.Intent
import android.net.Uri
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.WorkspacePremium
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.SheetState
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.cardex.app.core.config.SubscriptionConfig
import com.cardex.app.core.theme.CarbonBorder
import com.cardex.app.core.theme.CardexGreen
import com.cardex.app.core.theme.GraphiteSurface
import com.cardex.app.core.theme.MythicGold
import com.cardex.app.core.theme.OledBlack
import com.cardex.app.core.theme.SlateTextSecondary
import com.cardex.app.core.theme.SnowTextPrimary

/**
 * Hoja modal inferior (Bottom Sheet) de suscripción a Cardex Pro.
 * Diseñada bajo los principios de Apple Human Interface Guidelines (HIG) con fondo OLED Negro Puro.
 *
 * Presenta la propuesta de valor de la membresía Pro, la comparación de cuotas
 * y el acceso directo al checkout seguro de Lemon Squeezy con inyección de User ID.
 *
 * @param isOpen Indica si el Bottom Sheet se encuentra visible.
 * @param onDismiss Callback invocado para cerrar el modal.
 * @param userId Identificador del usuario autenticado para la atribución de compra.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CardexProBottomSheet(
    isOpen: Boolean,
    onDismiss: () -> Unit,
    userId: String = "00000000-0000-0000-0000-000000000001"
) {
    if (!isOpen) return

    val sheetState: SheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
    val context = LocalContext.current
    val scrollState = rememberScrollState()

    // Gradiente distintivo Dorado / Esmeralda oficial de Cardex Pro
    val proGradient = Brush.horizontalGradient(
        colors = listOf(
            MythicGold,
            CardexGreen
        )
    )

    ModalBottomSheet(
        onDismissRequest = onDismiss,
        sheetState = sheetState,
        containerColor = OledBlack,
        contentColor = SnowTextPrimary,
        scrimColor = Color.Black.copy(alpha = 0.75f),
        dragHandle = {
            Box(
                modifier = Modifier
                    .padding(top = 12.dp, bottom = 8.dp)
                    .size(width = 36.dp, height = 4.dp)
                    .clip(CircleShape)
                    .background(CarbonBorder)
            )
        },
        shape = RoundedCornerShape(topStart = 28.dp, topEnd = 28.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .navigationBarsPadding()
                .padding(horizontal = 24.dp, vertical = 8.dp)
                .verticalScroll(scrollState),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Fila superior con botón de cerrar discreto a la derecha
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                IconButton(
                    onClick = onDismiss,
                    modifier = Modifier.size(32.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.Close,
                        contentDescription = "Cerrar",
                        tint = SlateTextSecondary,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }

            // 1. Badge Corona Cardex Pro
            Surface(
                shape = RoundedCornerShape(20.dp),
                color = GraphiteSurface,
                border = androidx.compose.foundation.BorderStroke(
                    width = 1.dp,
                    brush = proGradient
                ),
                modifier = Modifier.padding(bottom = 12.dp)
            ) {
                Row(
                    modifier = Modifier.padding(horizontal = 14.dp, vertical = 6.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.WorkspacePremium,
                        contentDescription = null,
                        tint = MythicGold,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(6.dp))
                    Text(
                        text = "CARDEX PRO",
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Black,
                        letterSpacing = 1.2.sp,
                        color = SnowTextPrimary
                    )
                }
            }

            // 2. Título y Subtítulo de Conversión
            Text(
                text = "Desbloquea el Coleccionismo Élite",
                fontSize = 22.sp,
                fontWeight = FontWeight.Bold,
                color = SnowTextPrimary,
                textAlign = TextAlign.Center
            )

            Spacer(modifier = Modifier.height(6.dp))

            Text(
                text = "Cuota duplicada, análisis avanzado de desgaste y shaders holográficos ilimitados.",
                fontSize = 13.sp,
                color = SlateTextSecondary,
                textAlign = TextAlign.Center,
                lineHeight = 18.sp
            )

            Spacer(modifier = Modifier.height(20.dp))

            // 3. Tarjeta Comparativa: Plan Free vs Plan Pro
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(18.dp))
                    .background(GraphiteSurface)
                    .border(1.dp, CarbonBorder, RoundedCornerShape(18.dp))
                    .padding(16.dp)
            ) {
                // Cabecera de comparación
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "BENEFICIOS",
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Bold,
                        color = SlateTextSecondary,
                        letterSpacing = 1.sp
                    )
                    Text(
                        text = "PLAN PRO",
                        fontSize = 11.sp,
                        fontWeight = FontWeight.Black,
                        color = CardexGreen,
                        letterSpacing = 1.sp
                    )
                }

                Spacer(modifier = Modifier.height(12.dp))

                // Fila 1: Cuota de Escaneo
                BenefitRow(
                    title = "Cuota de escaneo diario",
                    freeText = "${SubscriptionConfig.FREE_DAILY_SCAN_LIMIT} cartas/día",
                    proText = "${SubscriptionConfig.PRO_DAILY_SCAN_LIMIT} cartas/día (Doble)",
                    isProHighlight = true
                )

                Spacer(modifier = Modifier.height(10.dp))

                // Fila 2: Visor 3D y Shaders
                BenefitRow(
                    title = "Visor 3D Holográfico",
                    freeText = "Modo Estándar",
                    proText = "Shaders y FOV Sin Límites",
                    isProHighlight = true
                )

                Spacer(modifier = Modifier.height(10.dp))

                // Fila 3: Tasación Histórica
                BenefitRow(
                    title = "Santos Griales & Tasación",
                    freeText = "Catálogo Base",
                    proText = "Histórico en Tiempo Real",
                    isProHighlight = true
                )

                Spacer(modifier = Modifier.height(10.dp))

                // Fila 4: Marketplace
                BenefitRow(
                    title = "Marketplace P2P",
                    freeText = "Acceso Básico",
                    proText = "Prioridad en Vitrina",
                    isProHighlight = true
                )
            }

            Spacer(modifier = Modifier.height(20.dp))

            // 4. Botón de Acción Principal CTA con Gradiente
            Button(
                onClick = {
                    val checkoutUrl = SubscriptionConfig.buildCheckoutUrl(userId)
                    try {
                        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse(checkoutUrl)).apply {
                            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        }
                        context.startActivity(browserIntent)
                    } catch (e: Exception) {
                        // En caso de que no haya navegador web instalado
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(52.dp)
                    .clip(RoundedCornerShape(16.dp))
                    .background(proGradient),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color.Transparent,
                    contentColor = OledBlack
                ),
                contentPadding = androidx.compose.foundation.layout.PaddingValues(0.dp)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.WorkspacePremium,
                        contentDescription = null,
                        tint = OledBlack,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "Obtener Cardex Pro — ${SubscriptionConfig.PRO_PRICE_LABEL}",
                        fontSize = 15.sp,
                        fontWeight = FontWeight.Bold,
                        color = OledBlack
                    )
                }
            }

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = "Cancela cuando quieras • Facturación vía Lemon Squeezy",
                fontSize = 11.sp,
                color = SlateTextSecondary,
                textAlign = TextAlign.Center
            )

            Spacer(modifier = Modifier.height(4.dp))

            // 5. Botón Secundario de Cierre
            TextButton(
                onClick = onDismiss,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = "Continuar con Plan Free",
                    color = SlateTextSecondary,
                    fontSize = 13.sp,
                    fontWeight = FontWeight.Medium
                )
            }

            Spacer(modifier = Modifier.height(12.dp))
        }
    }
}

/**
 * Renglón individual comparativo entre el Plan Free y Plan Pro.
 */
@Composable
private fun BenefitRow(
    title: String,
    freeText: String,
    proText: String,
    isProHighlight: Boolean = false
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                fontSize = 13.sp,
                fontWeight = FontWeight.SemiBold,
                color = SnowTextPrimary
            )
            Text(
                text = "Free: $freeText",
                fontSize = 11.sp,
                color = SlateTextSecondary
            )
        }

        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.padding(start = 8.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Check,
                contentDescription = null,
                tint = if (isProHighlight) CardexGreen else SlateTextSecondary,
                modifier = Modifier.size(16.dp)
            )
            Spacer(modifier = Modifier.width(4.dp))
            Text(
                text = proText,
                fontSize = 12.sp,
                fontWeight = FontWeight.Bold,
                color = if (isProHighlight) CardexGreen else SnowTextPrimary
            )
        }
    }
}
