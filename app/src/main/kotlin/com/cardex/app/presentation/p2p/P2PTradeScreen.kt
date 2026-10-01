package com.cardex.app.presentation.p2p

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Devices
import androidx.compose.material.icons.filled.QrCode2
import androidx.compose.material.icons.filled.Router
import androidx.compose.material.icons.filled.SwapHoriz
import androidx.compose.material.icons.filled.Wifi
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.FilterChipDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.cardex.app.core.theme.CarbonBorder
import com.cardex.app.core.theme.CardexGreen
import com.cardex.app.core.theme.EpicCrimson
import com.cardex.app.core.theme.GraphiteSurface
import com.cardex.app.core.theme.MythicGold
import com.cardex.app.core.theme.OledBlack
import com.cardex.app.core.theme.SlateTextSecondary
import com.cardex.app.core.theme.SnowTextPrimary
import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.network.p2p.TradeState

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun P2PTradeScreen(
    viewModel: P2PTradeViewModel,
    onNavigateBack: () -> Unit = {}
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    val scrollState = rememberScrollState()

    Scaffold(
        modifier = Modifier.fillMaxSize(),
        containerColor = OledBlack,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = "INTERCAMBIO P2P (CC311)",
                        style = MaterialTheme.typography.titleMedium.copy(
                            fontWeight = FontWeight.Bold,
                            color = CardexGreen
                        )
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = "Volver",
                            tint = SnowTextPrimary
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = OledBlack,
                    titleContentColor = SnowTextPrimary
                )
            )
        }
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
                .verticalScroll(scrollState)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // 1. Selector de Rol P2P (Host vs Cliente)
            P2PRoleSelector(
                isHost = uiState.isHost,
                onRoleChanged = { viewModel.setHostMode(it) }
            )

            // 2. Configuración de Red Local (Wi-Fi Direct / Puerto 8888)
            P2PNetworkConfigBox(
                isHost = uiState.isHost,
                ipInput = uiState.peerIpInput,
                onIpChanged = { viewModel.setPeerIp(it) },
                onConnectClick = { viewModel.startTradeSession(context) },
                isConnected = uiState.tradeState !is TradeState.Idle && uiState.tradeState !is TradeState.Aborted
            )

            // 3. Monitor de Estado de la Sesión P2P (Máquina de Estados)
            P2PStateCard(
                tradeState = uiState.tradeState,
                onAccept = { viewModel.acceptOffer() },
                onCommit = { viewModel.commitTrade(context) },
                onCancel = { viewModel.cancelTrade(context) }
            )

            // 4. Selector de Carta del Archivador Local
            Text(
                text = "CARTA A OFRECER (TU COLECCIÓN)",
                style = MaterialTheme.typography.labelMedium.copy(fontWeight = FontWeight.Bold),
                color = SlateTextSecondary
            )

            if (uiState.localCards.isEmpty()) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(12.dp))
                        .background(GraphiteSurface)
                        .padding(20.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "No tienes cartas registradas en tu base de datos local para intercambiar.",
                        color = SlateTextSecondary,
                        style = MaterialTheme.typography.bodySmall,
                        textAlign = TextAlign.Center
                    )
                }
            } else {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(10.dp),
                    contentPadding = PaddingValues(vertical = 4.dp)
                ) {
                    items(uiState.localCards, key = { it.id }) { card ->
                        val isSelected = uiState.selectedLocalCard?.id == card.id
                        CardOfferItem(
                            card = card,
                            isSelected = isSelected,
                            onClick = { viewModel.selectCardToOffer(card) }
                        )
                    }
                }
            }

            // 5. Botón de Acción para Emitir Oferta (OP_OFFER)
            Button(
                onClick = { viewModel.sendSelectedCardOffer() },
                enabled = uiState.tradeState is TradeState.Connected && uiState.selectedLocalCard != null,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(50.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = CardexGreen,
                    contentColor = OledBlack,
                    disabledContainerColor = GraphiteSurface,
                    disabledContentColor = SlateTextSecondary
                ),
                shape = RoundedCornerShape(12.dp)
            ) {
                Icon(imageVector = Icons.Default.SwapHoriz, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    text = if (uiState.selectedLocalCard != null) {
                        "Enviar Oferta: ${uiState.selectedLocalCard?.name}"
                    } else {
                        "Selecciona una Carta para Ofrecer"
                    },
                    fontWeight = FontWeight.Bold,
                    fontSize = 14.sp
                )
            }
        }
    }
}

@Composable
private fun P2PRoleSelector(
    isHost: Boolean,
    onRoleChanged: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .background(GraphiteSurface)
            .padding(4.dp),
        horizontalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        FilterChip(
            selected = isHost,
            onClick = { onRoleChanged(true) },
            label = {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(imageVector = Icons.Default.Router, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(6.dp))
                    Text("Crear Sala (Host :8888)")
                }
            },
            colors = FilterChipDefaults.filterChipColors(
                containerColor = GraphiteSurface,
                labelColor = SlateTextSecondary,
                selectedContainerColor = CardexGreen.copy(alpha = 0.25f),
                selectedLabelColor = CardexGreen
            ),
            modifier = Modifier.weight(1f)
        )

        FilterChip(
            selected = !isHost,
            onClick = { onRoleChanged(false) },
            label = {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(imageVector = Icons.Default.Devices, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(6.dp))
                    Text("Unirse a Sala (Cliente)")
                }
            },
            colors = FilterChipDefaults.filterChipColors(
                containerColor = GraphiteSurface,
                labelColor = SlateTextSecondary,
                selectedContainerColor = CardexGreen.copy(alpha = 0.25f),
                selectedLabelColor = CardexGreen
            ),
            modifier = Modifier.weight(1f)
        )
    }
}

@Composable
private fun P2PNetworkConfigBox(
    isHost: Boolean,
    ipInput: String,
    onIpChanged: (String) -> Unit,
    onConnectClick: () -> Unit,
    isConnected: Boolean
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(GraphiteSurface)
            .border(1.dp, CarbonBorder, RoundedCornerShape(16.dp))
            .padding(16.dp)
    ) {
        Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(imageVector = Icons.Default.Wifi, contentDescription = null, tint = CardexGreen)
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    text = if (isHost) "Anfitrión Wi-Fi Direct (ServerSocket :8888)" else "Conectar con Anfitrión TCP",
                    color = SnowTextPrimary,
                    style = MaterialTheme.typography.titleSmall.copy(fontWeight = FontWeight.Bold)
                )
            }

            if (!isHost) {
                OutlinedTextField(
                    value = ipInput,
                    onValueChange = onIpChanged,
                    label = { Text("IP del Anfitrión (ej. 192.168.49.1)") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedTextColor = SnowTextPrimary,
                        unfocusedTextColor = SnowTextPrimary,
                        focusedBorderColor = CardexGreen,
                        unfocusedBorderColor = CarbonBorder
                    )
                )
            } else {
                Text(
                    text = "Al presionar Iniciar, se abrirá un ServerSocket en el puerto 8888 esperando la trama OP_HELLO del compañero.",
                    color = SlateTextSecondary,
                    style = MaterialTheme.typography.bodySmall
                )
            }

            Button(
                onClick = onConnectClick,
                enabled = !isConnected,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(44.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = if (isConnected) CardexGreen.copy(alpha = 0.3f) else CardexGreen,
                    contentColor = OledBlack
                ),
                shape = RoundedCornerShape(8.dp)
            ) {
                Text(
                    text = if (isConnected) "Enlace P2P Activo" else if (isHost) "Iniciar Servidor TCP" else "Conectar al Anfitrión",
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

@Composable
private fun P2PStateCard(
    tradeState: TradeState,
    onAccept: () -> Unit,
    onCommit: () -> Unit,
    onCancel: () -> Unit
) {
    val (statusTitle, statusColor, description) = when (tradeState) {
        is TradeState.Idle -> Triple("INACTIVO", SlateTextSecondary, "Listo para iniciar sesión P2P local.")
        is TradeState.Connected -> Triple("CONECTADO", CardexGreen, "Enlace TCP establecido con ${tradeState.peerAddress}. Esperando oferta...")
        is TradeState.OfferSent -> Triple("OFERTA ENVIADA", MythicGold, "Oferta emitida con UUID: ${tradeState.offeredCardUuid}. Esperando respuesta...")
        is TradeState.OfferReceived -> Triple("¡OFERTA RECIBIDA!", MythicGold, "El compañero ofrece la carta con UUID: ${tradeState.receivedCardUuid}.")
        is TradeState.Accepted -> Triple("ACUERDO ACEPTADO", CardexGreen, "Ambas partes aceptaron los términos. Listos para compromiso atómico.")
        is TradeState.Committing -> Triple("TRANSFIRIENDO", CardexGreen, "Escribiendo transacción atómica en SQLite local...")
        is TradeState.Completed -> Triple("¡INTERCAMBIO EXITOSO!", CardexGreen, "Transferencia atómica confirmada por ambas partes.")
        is TradeState.Aborted -> Triple("SESIÓN CANCELADA", EpicCrimson, "Motivo: ${tradeState.reason}")
    }

    Box(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(GraphiteSurface)
            .border(1.dp, statusColor.copy(alpha = 0.5f), RoundedCornerShape(16.dp))
            .padding(16.dp)
    ) {
        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = statusTitle,
                    color = statusColor,
                    style = MaterialTheme.typography.titleSmall.copy(
                        fontWeight = FontWeight.Bold,
                        fontFamily = FontFamily.Monospace
                    )
                )

                if (tradeState !is TradeState.Idle && tradeState !is TradeState.Completed) {
                    IconButton(onClick = onCancel, modifier = Modifier.size(24.dp)) {
                        Icon(imageVector = Icons.Default.Close, contentDescription = "Cancelar", tint = EpicCrimson)
                    }
                }
            }

            Text(
                text = description,
                color = SnowTextPrimary,
                style = MaterialTheme.typography.bodySmall
            )

            // Acciones dinámicas según el estado
            if (tradeState is TradeState.OfferReceived) {
                Button(
                    onClick = onAccept,
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = CardexGreen, contentColor = OledBlack),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Text("Aceptar Oferta (OP_ACCEPT)", fontWeight = FontWeight.Bold)
                }
            } else if (tradeState is TradeState.Accepted) {
                Button(
                    onClick = onCommit,
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = CardexGreen, contentColor = OledBlack),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Icon(imageVector = Icons.Default.QrCode2, contentDescription = null)
                    Spacer(modifier = Modifier.width(6.dp))
                    Text("Confirmar Transferencia (OP_COMMIT)", fontWeight = FontWeight.Bold)
                }
            }
        }
    }
}

@Composable
private fun CardOfferItem(
    card: CardEntity,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Box(
        modifier = Modifier
            .size(110.dp, 160.dp)
            .clip(RoundedCornerShape(12.dp))
            .background(if (isSelected) CardexGreen.copy(alpha = 0.15f) else GraphiteSurface)
            .border(
                width = if (isSelected) 2.dp else 1.dp,
                color = if (isSelected) CardexGreen else CarbonBorder,
                shape = RoundedCornerShape(12.dp)
            )
            .clickable(onClick = onClick)
            .padding(8.dp)
    ) {
        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            Column {
                Text(
                    text = card.name,
                    color = SnowTextPrimary,
                    style = MaterialTheme.typography.bodySmall.copy(fontWeight = FontWeight.Bold),
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = card.cardNumber ?: "#---",
                    color = SlateTextSecondary,
                    style = MaterialTheme.typography.labelSmall
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = card.conditionGrade ?: "RAW",
                    color = CardexGreen,
                    style = MaterialTheme.typography.labelSmall.copy(fontWeight = FontWeight.Bold)
                )

                if (isSelected) {
                    Icon(
                        imageVector = Icons.Default.CheckCircle,
                        contentDescription = null,
                        tint = CardexGreen,
                        modifier = Modifier.size(18.dp)
                    )
                }
            }
        }
    }
}
