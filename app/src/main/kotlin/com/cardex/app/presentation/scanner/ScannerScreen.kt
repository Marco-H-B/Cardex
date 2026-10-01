package com.cardex.app.presentation.scanner

import android.app.Activity
import android.graphics.BitmapFactory
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.IntentSenderRequest
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.CameraAlt
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material.icons.filled.WorkspacePremium
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.cardex.app.core.config.SubscriptionConfig
import com.cardex.app.core.theme.CarbonBorder
import com.cardex.app.core.theme.CardexGreen
import com.cardex.app.core.theme.EpicCrimson
import com.cardex.app.core.theme.GraphiteSurface
import com.cardex.app.core.theme.MythicGold
import com.cardex.app.core.theme.OledBlack
import com.cardex.app.core.theme.SlateTextSecondary
import com.cardex.app.core.theme.SnowTextPrimary
import com.cardex.app.domain.model.CardSide
import com.cardex.app.presentation.subscription.CardexProBottomSheet
import com.google.mlkit.vision.documentscanner.GmsDocumentScannerOptions
import com.google.mlkit.vision.documentscanner.GmsDocumentScanning

/**
 * Pantalla de Escaneo Óptico TCG con guía rectangular de 63x88 mm,
 * detección de homografía por ML Kit y validación de nitidez por Laplaciano.
 */
@Suppress("FunctionName")
@Composable
fun ScannerScreen(
    viewModel: ScannerViewModel,
    onNavigateBack: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    val uiState by viewModel.uiState.collectAsState()
    var isProSheetOpen by remember { mutableStateOf(false) }
    val context = LocalContext.current
    val activity = context as? Activity

    // Configuración del escáner de documentos de Google Play Services (ML Kit)
    val scannerOptions = GmsDocumentScannerOptions.Builder()
        .setGalleryImportAllowed(false)
        .setPageLimit(1)
        .setResultFormats(GmsDocumentScannerOptions.RESULT_FORMAT_JPEG)
        .setScannerMode(GmsDocumentScannerOptions.SCANNER_MODE_FULL)
        .build()

    val scannerClient = GmsDocumentScanning.getClient(scannerOptions)

    // Launcher para recibir el resultado del escaneo con homografía aplicada por hardware
    val scannerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartIntentSenderForResult()
    ) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val scanResult =
                com.google.mlkit.vision.documentscanner.GmsDocumentScanningResult.fromActivityResultIntent(result.data)
            scanResult?.pages?.firstOrNull()?.imageUri?.let { uri ->
                context.contentResolver.openInputStream(uri)?.use { stream ->
                    val bitmap = BitmapFactory.decodeStream(stream)
                    if (bitmap != null) {
                        viewModel.processCapture(bitmap, "Carta TCG #${(100..999).random()}")
                    }
                }
            }
        }
    }

    Surface(
        modifier = modifier.fillMaxSize(),
        color = OledBlack
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding()
                .navigationBarsPadding()
                .padding(horizontal = 24.dp, vertical = 12.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            // 1. Barra Superior con Indicador de Cara, Cuota Diaria y Progreso
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                // Indicador discreto de cuota diaria y acceso a Cardex Pro
                Surface(
                    onClick = { isProSheetOpen = true },
                    shape = RoundedCornerShape(12.dp),
                    color = GraphiteSurface,
                    border = androidx.compose.foundation.BorderStroke(1.dp, CarbonBorder),
                    modifier = Modifier.padding(bottom = 10.dp)
                ) {
                    Row(
                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.WorkspacePremium,
                            contentDescription = null,
                            tint = MythicGold,
                            modifier = Modifier.size(15.dp)
                        )
                        Spacer(modifier = Modifier.width(6.dp))
                        Text(
                            text = "Cuota Diaria: ${SubscriptionConfig.FREE_DAILY_SCAN_LIMIT} cartas",
                            color = SlateTextSecondary,
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Medium
                        )
                        Text(
                            text = " • ",
                            color = SlateTextSecondary,
                            fontSize = 12.sp
                        )
                        Text(
                            text = "Hazte PRO",
                            color = CardexGreen,
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }

                Text(
                    text = "MOTOR ÓPTICO DE ESCANEO",
                    color = SlateTextSecondary,
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    letterSpacing = 1.5.sp
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = if (uiState.currentSide == CardSide.FRONT) "PASO 1: ANVERSO" else "PASO 2: REVERSO",
                    color = CardexGreen,
                    fontSize = 20.sp,
                    fontWeight = FontWeight.Black
                )
            }

            // 2. Visor Central: Guía Rectangular TCG (63 x 88 mm = Ratio 63/88 ~ 0.716)
            Box(
                modifier = Modifier
                    .fillMaxWidth(0.78f)
                    .aspectRatio(63f / 88f)
                    .clip(RoundedCornerShape(16.dp))
                    .background(GraphiteSurface)
                    .border(
                        width = 2.dp,
                        color = if (uiState.isBlurry) EpicCrimson else CardexGreen,
                        shape = RoundedCornerShape(16.dp)
                    ),
                contentAlignment = Alignment.Center
            ) {
                if (uiState.isProcessing) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        CircularProgressIndicator(
                            color = CardexGreen,
                            modifier = Modifier.size(48.dp)
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "Calculando nitidez...",
                            color = SnowTextPrimary,
                            fontSize = 14.sp
                        )
                    }
                } else if (uiState.isScanComplete) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center,
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.CheckCircle,
                            contentDescription = "Completado",
                            tint = CardexGreen,
                            modifier = Modifier.size(64.dp)
                        )
                        Spacer(modifier = Modifier.height(12.dp))
                        Text(
                            text = "¡Escaneo Exitoso!",
                            color = SnowTextPrimary,
                            fontWeight = FontWeight.Bold,
                            fontSize = 18.sp
                        )
                        Text(
                            text = "Guardada en Room Database",
                            color = SlateTextSecondary,
                            fontSize = 12.sp
                        )
                    }
                } else {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = "Guía TCG (63 × 88 mm)",
                            color = SlateTextSecondary,
                            fontSize = 13.sp
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "Alinea los bordes de la carta con el marco",
                            color = SnowTextPrimary,
                            fontSize = 12.sp,
                            textAlign = TextAlign.Center
                        )
                    }
                }
            }

            // 3. Panel de Mensajes y Diagnóstico de Nitidez
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(12.dp))
                    .background(GraphiteSurface)
                    .border(1.dp, CarbonBorder, RoundedCornerShape(12.dp))
                    .padding(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                if (uiState.isBlurry) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Warning,
                            contentDescription = "Alerta",
                            tint = EpicCrimson,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "RECHAZO DE NITIDEZ (LAPLACIANO)",
                            color = EpicCrimson,
                            fontWeight = FontWeight.Bold,
                            fontSize = 13.sp
                        )
                    }
                    Spacer(modifier = Modifier.height(6.dp))
                }

                Text(
                    text = uiState.statusMessage,
                    color = if (uiState.isBlurry) EpicCrimson else SnowTextPrimary,
                    fontSize = 13.sp,
                    textAlign = TextAlign.Center,
                    lineHeight = 18.sp
                )

                uiState.lastSharpnessScore?.let { score ->
                    Spacer(modifier = Modifier.height(6.dp))
                    Text(
                        text = "Varianza Laplaciana: ${"%.2f".format(score)} (Umbral >= 100.0)",
                        color = SlateTextSecondary,
                        fontSize = 11.sp
                    )
                }
            }

            // 4. Controles de Acción Inferiores: Perfectamente Centrados y Simétricos
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Lado Izquierdo: Botón Reintentar / Deshacer (LIFO Pop)
                Box(
                    modifier = Modifier.weight(1f),
                    contentAlignment = Alignment.Center
                ) {
                    OutlinedButton(
                        onClick = { viewModel.retry() },
                        enabled = uiState.capturedFront != null && !uiState.isProcessing,
                        contentPadding = PaddingValues(horizontal = 8.dp, vertical = 10.dp),
                        colors = ButtonDefaults.outlinedButtonColors(
                            contentColor = SlateTextSecondary,
                            disabledContentColor = SlateTextSecondary.copy(alpha = 0.35f)
                        ),
                        shape = RoundedCornerShape(12.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Refresh,
                            contentDescription = "Reintentar",
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            text = "Reintentar",
                            maxLines = 1,
                            softWrap = false,
                            style = MaterialTheme.typography.labelMedium.copy(
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 12.sp
                            )
                        )
                    }
                }

                // Centro Matemático: Botón Disparador Principal de Cámara
                Box(
                    modifier = Modifier.weight(1f),
                    contentAlignment = Alignment.Center
                ) {
                    Button(
                        onClick = {
                            activity?.let { act ->
                                scannerClient.getStartScanIntent(act)
                                    .addOnSuccessListener { intentSender ->
                                        scannerLauncher.launch(
                                            IntentSenderRequest.Builder(intentSender).build()
                                        )
                                    }
                            }
                        },
                        enabled = !uiState.isProcessing && !uiState.isScanComplete,
                        colors = ButtonDefaults.buttonColors(
                            containerColor = CardexGreen,
                            contentColor = OledBlack,
                            disabledContainerColor = GraphiteSurface,
                            disabledContentColor = SlateTextSecondary.copy(alpha = 0.4f)
                        ),
                        shape = CircleShape,
                        modifier = Modifier.size(68.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.CameraAlt,
                            contentDescription = "Escanear Carta",
                            modifier = Modifier.size(32.dp)
                        )
                    }
                }

                // Lado Derecho: Botón Salir o Nueva Captura
                Box(
                    modifier = Modifier.weight(1f),
                    contentAlignment = Alignment.Center
                ) {
                    OutlinedButton(
                        onClick = {
                            if (uiState.isScanComplete) {
                                viewModel.resetScan()
                            } else {
                                onNavigateBack()
                            }
                        },
                        contentPadding = PaddingValues(horizontal = 8.dp, vertical = 10.dp),
                        colors = ButtonDefaults.outlinedButtonColors(
                            contentColor = SlateTextSecondary
                        ),
                        shape = RoundedCornerShape(12.dp)
                    ) {
                        Icon(
                            imageVector = if (uiState.isScanComplete) Icons.Default.Add else Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            text = if (uiState.isScanComplete) "Nueva" else "Salir",
                            maxLines = 1,
                            softWrap = false,
                            style = MaterialTheme.typography.labelMedium.copy(
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 12.sp
                            )
                        )
                    }
                }
            }
        }

        // Hoja Modal de Suscripción a Cardex Pro
        CardexProBottomSheet(
            isOpen = isProSheetOpen,
            onDismiss = { isProSheetOpen = false }
        )
    }
}
