package com.cardex.app.presentation.marketplace

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
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.Payment
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.ShoppingBag
import androidx.compose.material.icons.filled.Timer
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.FilterChipDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.material3.rememberModalBottomSheetState
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
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.cardex.app.core.theme.CarbonBorder
import com.cardex.app.core.theme.CardexGreen
import com.cardex.app.core.theme.CommonBlue
import com.cardex.app.core.theme.DamagedGlacier
import com.cardex.app.core.theme.EpicCrimson
import com.cardex.app.core.theme.GraphiteSurface
import com.cardex.app.core.theme.MythicGold
import com.cardex.app.core.theme.OledBlack
import com.cardex.app.core.theme.RarePurple
import com.cardex.app.core.theme.SlateTextSecondary
import com.cardex.app.core.theme.SnowTextPrimary
import com.cardex.app.domain.model.MarketListing
import com.cardex.app.domain.model.MarketListingStatus
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MarketplaceScreen(
    viewModel: MarketplaceViewModel,
    onNavigateBack: () -> Unit = {}
) {
    val uiState by viewModel.uiState.collectAsState()
    var isSearchActive by remember { mutableStateOf(false) }

    Scaffold(
        modifier = Modifier.fillMaxSize(),
        containerColor = OledBlack,
        topBar = {
            TopAppBar(
                title = {
                    if (isSearchActive) {
                        OutlinedTextField(
                            value = uiState.filter.query,
                            onValueChange = { viewModel.onSearchQueryChanged(it) },
                            placeholder = { Text("Buscar carta en el mercado...", color = SlateTextSecondary) },
                            modifier = Modifier.fillMaxWidth(),
                            singleLine = true,
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedTextColor = SnowTextPrimary,
                                unfocusedTextColor = SnowTextPrimary,
                                focusedBorderColor = CardexGreen,
                                unfocusedBorderColor = CarbonBorder
                            )
                        )
                    } else {
                        Text(
                            text = "MERCADO C2C",
                            style = MaterialTheme.typography.titleLarge.copy(
                                fontWeight = FontWeight.Bold,
                                color = CardexGreen
                            )
                        )
                    }
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
                actions = {
                    IconButton(onClick = { isSearchActive = !isSearchActive }) {
                        Icon(
                            imageVector = if (isSearchActive) Icons.Default.Close else Icons.Default.Search,
                            contentDescription = "Buscar",
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
        ) {
            // Filtros de Tipo (Todas / Oficiales / Genéricas)
            CardTypeFilterRow(
                selectedType = uiState.filter.cardType,
                onTypeSelected = { viewModel.onCardTypeSelected(it) }
            )

            // Filtros de Grado de Desgaste (Mítico, Épico, Raro, Común, Dañado)
            WearTierFilterRow(
                selectedTier = uiState.filter.selectedWearTier,
                onTierSelected = { viewModel.onWearTierSelected(it) }
            )

            // Mensajes de error o advertencia de concurrencia
            AnimatedVisibility(visible = uiState.errorMessage != null) {
                uiState.errorMessage?.let { errorMsg ->
                    Surface(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 6.dp),
                        color = EpicCrimson.copy(alpha = 0.2f),
                        shape = RoundedCornerShape(8.dp),
                        border = androidx.compose.foundation.BorderStroke(1.dp, EpicCrimson)
                    ) {
                        Row(
                            modifier = Modifier.padding(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Lock,
                                contentDescription = null,
                                tint = EpicCrimson,
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = errorMsg,
                                color = SnowTextPrimary,
                                style = MaterialTheme.typography.bodySmall,
                                modifier = Modifier.weight(1f)
                            )
                            IconButton(onClick = { viewModel.dismissErrorMessage() }) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Cerrar",
                                    tint = SnowTextPrimary,
                                    modifier = Modifier.size(16.dp)
                                )
                            }
                        }
                    }
                }
            }

            // Notificación de compra exitosa
            AnimatedVisibility(visible = uiState.checkoutSuccess) {
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 6.dp),
                    color = CardexGreen.copy(alpha = 0.2f),
                    shape = RoundedCornerShape(8.dp),
                    border = androidx.compose.foundation.BorderStroke(1.dp, CardexGreen)
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.CheckCircle,
                            contentDescription = null,
                            tint = CardexGreen,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "¡Compra completada con Mercado Pago! La carta ha sido transferida a tu inventario.",
                            color = SnowTextPrimary,
                            style = MaterialTheme.typography.bodySmall,
                            modifier = Modifier.weight(1f)
                        )
                        IconButton(onClick = { viewModel.dismissSuccessMessage() }) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Cerrar",
                                tint = SnowTextPrimary,
                                modifier = Modifier.size(16.dp)
                            )
                        }
                    }
                }
            }

            // Lista de Cartas Publicadas
            if (uiState.isLoading) {
                Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    CircularProgressIndicator(color = CardexGreen)
                }
            } else if (uiState.listings.isEmpty()) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(24.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "No hay cartas en venta con los filtros seleccionados.",
                        color = SlateTextSecondary,
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(uiState.listings, key = { it.id }) { listing ->
                        MarketListingCard(
                            listing = listing,
                            onBuyClick = { viewModel.reserveListing(listing) }
                        )
                    }
                }
            }
        }

        // Modal BottomSheet de Bloqueo Pesimista (FOR UPDATE) con temporizador de 5 minutos
        if (uiState.reservedListing != null) {
            val sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
            ModalBottomSheet(
                onDismissRequest = { viewModel.cancelReservation() },
                sheetState = sheetState,
                containerColor = GraphiteSurface,
                scrimColor = OledBlack.copy(alpha = 0.85f)
            ) {
                ReservationBottomSheetContent(
                    listing = uiState.reservedListing!!,
                    remainingSeconds = uiState.reservationRemainingSeconds,
                    isProcessing = uiState.isCheckingOut,
                    onPay = { viewModel.payWithMercadoPago() },
                    onCancel = { viewModel.cancelReservation() }
                )
            }
        }
    }
}

@Composable
private fun CardTypeFilterRow(
    selectedType: String?,
    onTypeSelected: (String?) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 4.dp),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        FilterChip(
            selected = selectedType == null,
            onClick = { onTypeSelected(null) },
            label = { Text("Todas") },
            colors = filterChipColors()
        )
        FilterChip(
            selected = selectedType == "OFFICIAL",
            onClick = { onTypeSelected("OFFICIAL") },
            label = { Text("Oficiales TCG") },
            colors = filterChipColors()
        )
        FilterChip(
            selected = selectedType == "GENERIC",
            onClick = { onTypeSelected("GENERIC") },
            label = { Text("Genéricas") },
            colors = filterChipColors()
        )
    }
}

@Composable
private fun WearTierFilterRow(
    selectedTier: String?,
    onTierSelected: (String?) -> Unit
) {
    val tiers = listOf(
        "Mítico" to MythicGold,
        "Épico" to EpicCrimson,
        "Raro" to RarePurple,
        "Común" to CommonBlue,
        "Dañado" to DamagedGlacier
    )

    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        contentPadding = PaddingValues(horizontal = 16.dp),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            FilterChip(
                selected = selectedTier == null,
                onClick = { onTierSelected(null) },
                label = { Text("Todos los Grados") },
                colors = filterChipColors()
            )
        }
        items(tiers) { (tierName, color) ->
            FilterChip(
                selected = selectedTier == tierName,
                onClick = {
                    onTierSelected(if (selectedTier == tierName) null else tierName)
                },
                label = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Box(
                            modifier = Modifier
                                .size(8.dp)
                                .clip(CircleShape)
                                .background(color)
                        )
                        Spacer(modifier = Modifier.width(6.dp))
                        Text(tierName)
                    }
                },
                colors = filterChipColors()
            )
        }
    }
}

@Composable
private fun filterChipColors() = FilterChipDefaults.filterChipColors(
    containerColor = GraphiteSurface,
    labelColor = SlateTextSecondary,
    selectedContainerColor = CardexGreen.copy(alpha = 0.25f),
    selectedLabelColor = CardexGreen
)

@Composable
private fun MarketListingCard(
    listing: MarketListing,
    onBuyClick: () -> Unit
) {
    val tierColor = when (listing.wearTier.lowercase()) {
        "mítico" -> MythicGold
        "épico" -> EpicCrimson
        "raro" -> RarePurple
        "común" -> CommonBlue
        else -> DamagedGlacier
    }

    Box(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(GraphiteSurface)
            .border(1.dp, CarbonBorder, RoundedCornerShape(16.dp))
            .padding(14.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Miniatura o placeholder
            Box(
                modifier = Modifier
                    .size(64.dp, 88.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(OledBlack)
                    .border(1.dp, tierColor.copy(alpha = 0.5f), RoundedCornerShape(8.dp)),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = Icons.Default.ShoppingBag,
                    contentDescription = null,
                    tint = tierColor,
                    modifier = Modifier.size(32.dp)
                )
            }

            Spacer(modifier = Modifier.width(14.dp))

            // Información de la carta
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = listing.cardName,
                    color = SnowTextPrimary,
                    style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.Bold),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                Text(
                    text = "${listing.setName ?: "Catálogo"} · ${listing.cardNumber ?: ""}",
                    color = SlateTextSecondary,
                    style = MaterialTheme.typography.bodySmall
                )

                Spacer(modifier = Modifier.height(6.dp))

                // Badge de Desgaste Float
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Box(
                        modifier = Modifier
                            .clip(RoundedCornerShape(4.dp))
                            .background(tierColor.copy(alpha = 0.15f))
                            .padding(horizontal = 6.dp, vertical = 2.dp)
                    ) {
                        Text(
                            text = listing.wearTier.uppercase(),
                            color = tierColor,
                            style = MaterialTheme.typography.labelSmall.copy(fontWeight = FontWeight.Bold)
                        )
                    }

                    Spacer(modifier = Modifier.width(6.dp))

                    Text(
                        text = String.format(Locale.US, "%.9f", listing.conditionFloat),
                        color = SlateTextSecondary,
                        style = MaterialTheme.typography.labelSmall.copy(fontFamily = FontFamily.Monospace)
                    )
                }

                Spacer(modifier = Modifier.height(6.dp))

                Text(
                    text = "Vendido por: ${listing.sellerName}",
                    color = SlateTextSecondary,
                    style = MaterialTheme.typography.labelSmall
                )
            }

            Spacer(modifier = Modifier.width(8.dp))

            // Precio y Botón de Acción
            Column(horizontalAlignment = Alignment.End) {
                Text(
                    text = String.format(Locale.US, "S/ %.2f", listing.pricePen),
                    color = CardexGreen,
                    style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.Bold)
                )

                Spacer(modifier = Modifier.height(8.dp))

                when (listing.status) {
                    MarketListingStatus.AVAILABLE -> {
                        Button(
                            onClick = onBuyClick,
                            colors = ButtonDefaults.buttonColors(
                                containerColor = CardexGreen,
                                contentColor = OledBlack
                            ),
                            shape = RoundedCornerShape(8.dp),
                            contentPadding = PaddingValues(horizontal = 14.dp, vertical = 6.dp)
                        ) {
                            Text("Comprar", fontWeight = FontWeight.Bold, fontSize = 12.sp)
                        }
                    }
                    MarketListingStatus.RESERVED -> {
                        Box(
                            modifier = Modifier
                                .clip(RoundedCornerShape(8.dp))
                                .background(MythicGold.copy(alpha = 0.2f))
                                .padding(horizontal = 10.dp, vertical = 6.dp)
                        ) {
                            Text("En Reserva", color = MythicGold, fontSize = 11.sp, fontWeight = FontWeight.Bold)
                        }
                    }
                    MarketListingStatus.SOLD -> {
                        Box(
                            modifier = Modifier
                                .clip(RoundedCornerShape(8.dp))
                                .background(CarbonBorder)
                                .padding(horizontal = 10.dp, vertical = 6.dp)
                        ) {
                            Text("Vendida", color = SlateTextSecondary, fontSize = 11.sp)
                        }
                    }
                    else -> {}
                }
            }
        }
    }
}

@Composable
private fun ReservationBottomSheetContent(
    listing: MarketListing,
    remainingSeconds: Int,
    isProcessing: Boolean,
    onPay: () -> Unit,
    onCancel: () -> Unit
) {
    val minutes = remainingSeconds / 60
    val seconds = remainingSeconds % 60
    val formattedTime = String.format(Locale.US, "%02d:%02d", minutes, seconds)

    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(24.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Indicador de Candado Pesimista
        Box(
            modifier = Modifier
                .size(56.dp)
                .clip(CircleShape)
                .background(CardexGreen.copy(alpha = 0.15f)),
            contentAlignment = Alignment.Center
        ) {
            Icon(
                imageVector = Icons.Default.Lock,
                contentDescription = null,
                tint = CardexGreen,
                modifier = Modifier.size(28.dp)
            )
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = "Bloqueo Pesimista Activo",
            style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.Bold),
            color = SnowTextPrimary
        )

        Spacer(modifier = Modifier.height(6.dp))

        Text(
            text = "Esta carta ha sido reservada en PostgreSQL (SELECT ... FOR UPDATE). Tienes 5 minutos exclusivos para completar tu compra antes de que se libere.",
            style = MaterialTheme.typography.bodySmall,
            color = SlateTextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )

        Spacer(modifier = Modifier.height(16.dp))

        // Temporizador de 5 minutos
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .clip(RoundedCornerShape(12.dp))
                .background(OledBlack)
                .border(1.dp, if (remainingSeconds < 60) EpicCrimson else CardexGreen, RoundedCornerShape(12.dp))
                .padding(horizontal = 20.dp, vertical = 10.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Timer,
                contentDescription = null,
                tint = if (remainingSeconds < 60) EpicCrimson else CardexGreen,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = formattedTime,
                color = if (remainingSeconds < 60) EpicCrimson else CardexGreen,
                style = MaterialTheme.typography.headlineSmall.copy(
                    fontWeight = FontWeight.Bold,
                    fontFamily = FontFamily.Monospace
                )
            )
        }

        Spacer(modifier = Modifier.height(20.dp))

        // Desglose del pago
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .clip(RoundedCornerShape(12.dp))
                .background(OledBlack)
                .padding(16.dp)
        ) {
            Column {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(text = "Carta:", color = SlateTextSecondary, style = MaterialTheme.typography.bodyMedium)
                    Text(text = listing.cardName, color = SnowTextPrimary, style = MaterialTheme.typography.bodyMedium, fontWeight = FontWeight.Bold)
                }
                Spacer(modifier = Modifier.height(6.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(text = "Vendedor:", color = SlateTextSecondary, style = MaterialTheme.typography.bodyMedium)
                    Text(text = listing.sellerName, color = SnowTextPrimary, style = MaterialTheme.typography.bodyMedium)
                }
                Spacer(modifier = Modifier.height(6.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(text = "Total a Pagar:", color = SlateTextSecondary, style = MaterialTheme.typography.bodyMedium)
                    Text(
                        text = String.format(Locale.US, "S/ %.2f PEN", listing.pricePen),
                        color = CardexGreen,
                        style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.Bold)
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(24.dp))

        // Botón de Mercado Pago
        Button(
            onClick = onPay,
            enabled = !isProcessing,
            modifier = Modifier
                .fillMaxWidth()
                .height(52.dp),
            colors = ButtonDefaults.buttonColors(
                containerColor = Color(0xFF009EE3), // Azul oficial Mercado Pago
                contentColor = Color.White
            ),
            shape = RoundedCornerShape(12.dp)
        ) {
            if (isProcessing) {
                CircularProgressIndicator(color = Color.White, modifier = Modifier.size(24.dp))
            } else {
                Icon(imageVector = Icons.Default.Payment, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Pagar con Mercado Pago", fontWeight = FontWeight.Bold, fontSize = 16.sp)
            }
        }

        Spacer(modifier = Modifier.height(10.dp))

        // Botón Cancelar Reserva
        OutlinedButton(
            onClick = onCancel,
            enabled = !isProcessing,
            modifier = Modifier
                .fillMaxWidth()
                .height(48.dp),
            colors = ButtonDefaults.outlinedButtonColors(
                contentColor = SlateTextSecondary
            ),
            shape = RoundedCornerShape(12.dp)
        ) {
            Text("Liberar Carta / Cancelar")
        }

        Spacer(modifier = Modifier.height(16.dp))
    }
}
