package com.cardex.app.presentation.binder

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.Orientation
import androidx.compose.foundation.gestures.draggable
import androidx.compose.foundation.gestures.rememberDraggableState
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
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.filled.CameraAlt
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Style
import androidx.compose.material.icons.filled.Verified
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.FilterChipDefaults
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SearchBar
import androidx.compose.material3.SearchBarDefaults
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.cardex.app.presentation.common.CardImage
import com.cardex.app.core.theme.CarbonBorder
import com.cardex.app.core.theme.CommonBlue
import com.cardex.app.core.theme.DamagedGlacier
import com.cardex.app.core.theme.EpicCrimson
import com.cardex.app.core.theme.CardexGreen
import com.cardex.app.core.theme.GraphiteSurface
import com.cardex.app.core.theme.MythicGold
import com.cardex.app.core.theme.OledBlack
import com.cardex.app.core.theme.RarePurple
import com.cardex.app.core.theme.SlateTextSecondary
import com.cardex.app.core.theme.SnowTextPrimary
import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.presentation.viewer3d.Card3DViewer
import java.io.File
import kotlin.math.abs

/**
 * Pantalla principal del Archivador Virtual 3x3 (Virtual Binder Page).
 *
 * Características de Arquitectura e Interacción:
 * 1. Cuadrícula física de 3 filas x 3 columnas (9 bolsillos por hoja) con proporción TCG 63x88mm.
 * 2. Navegación por gestos horizontales (swipe) respaldada por [com.cardex.app.domain.structures.BinderDoublyLinkedList] en O(1).
 * 3. Búsqueda instantánea en vivo respaldada por [com.cardex.app.domain.structures.CardTrieSearch] en RAM en O(L).
 * 4. Transición fluida al Visor 3D Interactivo al tocar cualquier carta física.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
@Suppress("FunctionName")
fun BinderScreen(
    viewModel: BinderViewModel,
    onScanClick: () -> Unit
) {
    val uiState by viewModel.uiState.collectAsState()
    var isSearchActive by remember { mutableStateOf(false) }

    // Detección de arrastre horizontal acumulado para cambio de página en O(1)
    var dragAccumulator by remember { mutableFloatStateOf(0f) }
    val dragThreshold = 140f

    val draggableState = rememberDraggableState { delta ->
        dragAccumulator += delta
        if (dragAccumulator > dragThreshold) {
            viewModel.previousPage()
            dragAccumulator = 0f
        } else if (dragAccumulator < -dragThreshold) {
            viewModel.nextPage()
            dragAccumulator = 0f
        }
    }

    Box(modifier = Modifier.fillMaxSize()) {
        Scaffold(
            modifier = Modifier
                .fillMaxSize()
                .draggable(
                    state = draggableState,
                    orientation = Orientation.Horizontal,
                    onDragStopped = { dragAccumulator = 0f }
                ),
            containerColor = OledBlack,
            topBar = {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(OledBlack)
                ) {
                    TopAppBar(
                        title = {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Text(
                                    text = "CARDEX",
                                    style = MaterialTheme.typography.headlineMedium.copy(
                                        fontWeight = FontWeight.Black,
                                        letterSpacing = 1.5.sp,
                                        color = CardexGreen
                                    )
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    text = "ARCHIVADOR 3X3",
                                    style = MaterialTheme.typography.labelSmall.copy(
                                        fontWeight = FontWeight.Bold,
                                        color = SlateTextSecondary,
                                        letterSpacing = 1.sp
                                    ),
                                    modifier = Modifier.padding(top = 4.dp)
                                )
                            }
                        },
                        actions = {
                            IconButton(onClick = { isSearchActive = !isSearchActive }) {
                                Icon(
                                    imageVector = if (isSearchActive) Icons.Default.Close else Icons.Default.Search,
                                    contentDescription = "Buscar cartas",
                                    tint = if (isSearchActive) CardexGreen else SnowTextPrimary
                                )
                            }
                        },
                        colors = TopAppBarDefaults.topAppBarColors(
                            containerColor = OledBlack,
                            titleContentColor = CardexGreen
                        )
                    )

                    // Barra de Búsqueda Instantánea conectada al Árbol Trie en RAM
                    AnimatedVisibility(
                        visible = isSearchActive,
                        enter = fadeIn() + slideInVertically(),
                        exit = fadeOut() + slideOutVertically()
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 16.dp, vertical = 4.dp)
                        ) {
                            SearchBar(
                                inputField = {
                                    SearchBarDefaults.InputField(
                                        query = uiState.searchQuery,
                                        onQueryChange = { viewModel.onSearchQueryChanged(it) },
                                        onSearch = { },
                                        expanded = false,
                                        onExpandedChange = { },
                                        placeholder = {
                                            Text(
                                                text = "Buscar por nombre (O(L) con Trie)...",
                                                color = SlateTextSecondary,
                                                fontSize = 14.sp
                                            )
                                        },
                                        leadingIcon = {
                                            Icon(
                                                imageVector = Icons.Default.Search,
                                                contentDescription = null,
                                                tint = CardexGreen
                                            )
                                        },
                                        trailingIcon = {
                                            if (uiState.searchQuery.isNotEmpty()) {
                                                IconButton(onClick = { viewModel.onSearchQueryChanged("") }) {
                                                    Icon(
                                                        imageVector = Icons.Default.Close,
                                                        contentDescription = "Borrar",
                                                        tint = SlateTextSecondary
                                                    )
                                                }
                                            }
                                        }
                                    )
                                },
                                expanded = false,
                                onExpandedChange = { },
                                shape = RoundedCornerShape(16.dp),
                                modifier = Modifier.fillMaxWidth()
                            ) {}

                            // Sugerencias desplegables instantáneas emitidas por el Trie
                            if (uiState.searchSuggestions.isNotEmpty()) {
                                Surface(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(top = 8.dp),
                                    shape = RoundedCornerShape(12.dp),
                                    color = GraphiteSurface,
                                    border = androidx.compose.foundation.BorderStroke(1.dp, CarbonBorder)
                                ) {
                                    LazyColumn(
                                        modifier = Modifier.height(200.dp),
                                        contentPadding = PaddingValues(8.dp)
                                    ) {
                                        items(uiState.searchSuggestions) { card ->
                                            Row(
                                                modifier = Modifier
                                                    .fillMaxWidth()
                                                    .clickable {
                                                        viewModel.selectCardFor3D(card)
                                                        isSearchActive = false
                                                    }
                                                    .padding(horizontal = 12.dp, vertical = 8.dp),
                                                verticalAlignment = Alignment.CenterVertically
                                            ) {
                                                Box(
                                                    modifier = Modifier
                                                        .size(36.dp)
                                                        .clip(RoundedCornerShape(6.dp))
                                                        .background(OledBlack)
                                                ) {
                                                    CardImage(
                                                        imagePath = card.frontThumbnailPath,
                                                        contentDescription = null,
                                                        contentScale = ContentScale.Crop,
                                                        modifier = Modifier.fillMaxSize()
                                                    )
                                                }
                                                Spacer(modifier = Modifier.width(12.dp))
                                                Column(modifier = Modifier.weight(1f)) {
                                                    Text(
                                                        text = card.name,
                                                        style = MaterialTheme.typography.bodyMedium.copy(
                                                            fontWeight = FontWeight.Bold,
                                                            color = SnowTextPrimary
                                                        )
                                                    )
                                                    Text(
                                                        text = card.conditionGrade ?: "Sin calificar",
                                                        style = MaterialTheme.typography.labelSmall.copy(
                                                            color = SlateTextSecondary,
                                                            fontSize = 11.sp
                                                        )
                                                    )
                                                }
                                                Text(
                                                    text = "Ver 3D",
                                                    style = MaterialTheme.typography.labelSmall.copy(
                                                        color = CardexGreen,
                                                        fontWeight = FontWeight.Bold
                                                    )
                                                )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Chips de Categoría (Todas, Oficiales, Genéricas)
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 6.dp),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        FilterChip(
                            selected = uiState.selectedCategory == CardCategoryFilter.ALL,
                            onClick = { viewModel.setCategoryFilter(CardCategoryFilter.ALL) },
                            label = { Text("Todas (${uiState.totalCards})") },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = CardexGreen,
                                selectedLabelColor = OledBlack,
                                containerColor = GraphiteSurface,
                                labelColor = SnowTextPrimary
                            )
                        )
                        FilterChip(
                            selected = uiState.selectedCategory == CardCategoryFilter.OFFICIAL_TCG,
                            onClick = { viewModel.setCategoryFilter(CardCategoryFilter.OFFICIAL_TCG) },
                            label = { Text("Oficiales TCG") },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = CardexGreen,
                                selectedLabelColor = OledBlack,
                                containerColor = GraphiteSurface,
                                labelColor = SnowTextPrimary
                            )
                        )
                        FilterChip(
                            selected = uiState.selectedCategory == CardCategoryFilter.GENERIC,
                            onClick = { viewModel.setCategoryFilter(CardCategoryFilter.GENERIC) },
                            label = { Text("Genéricas") },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = CardexGreen,
                                selectedLabelColor = OledBlack,
                                containerColor = GraphiteSurface,
                                labelColor = SnowTextPrimary
                            )
                        )
                    }
                }
            },
            bottomBar = {
                // Barra de Paginación física inferior
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    color = OledBlack,
                    border = androidx.compose.foundation.BorderStroke(1.dp, CarbonBorder)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 20.dp, vertical = 10.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = { viewModel.previousPage() },
                            enabled = uiState.currentPageIndex > 0
                        ) {
                            Icon(
                                imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                                contentDescription = "Página anterior",
                                tint = if (uiState.currentPageIndex > 0) CardexGreen else GraphiteSurface
                            )
                        }

                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Text(
                                text = if (uiState.totalPages > 0) {
                                    "Página ${uiState.currentPageIndex + 1} de ${uiState.totalPages}"
                                } else {
                                    "Sin páginas"
                                },
                                style = MaterialTheme.typography.bodyMedium.copy(
                                    fontWeight = FontWeight.Bold,
                                    color = SnowTextPrimary
                                )
                            )
                            Text(
                                text = "${uiState.totalCards} cartas físicas registradas",
                                style = MaterialTheme.typography.labelSmall.copy(
                                    color = SlateTextSecondary,
                                    fontSize = 11.sp
                                )
                            )
                        }

                        IconButton(
                            onClick = { viewModel.nextPage() },
                            enabled = uiState.currentPageIndex < uiState.totalPages - 1
                        ) {
                            Icon(
                                imageVector = Icons.AutoMirrored.Filled.ArrowForward,
                                contentDescription = "Página siguiente",
                                tint = if (uiState.currentPageIndex < uiState.totalPages - 1) CardexGreen else GraphiteSurface
                            )
                        }
                    }
                }
            },
            floatingActionButton = {
                FloatingActionButton(
                    onClick = onScanClick,
                    containerColor = CardexGreen,
                    contentColor = OledBlack,
                    shape = CircleShape,
                    modifier = Modifier.padding(16.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.CameraAlt,
                        contentDescription = "Escanear Carta",
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        ) { innerPadding ->
            if (uiState.isLoading) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(innerPadding),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator(color = CardexGreen)
                }
            } else if (uiState.totalCards == 0) {
                // Estado vacío: Sin cartas escaneadas
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(innerPadding)
                        .padding(24.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    Box(
                        modifier = Modifier
                            .size(96.dp)
                            .clip(RoundedCornerShape(20.dp))
                            .background(GraphiteSurface),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = Icons.Default.Style,
                            contentDescription = null,
                            tint = CardexGreen,
                            modifier = Modifier.size(48.dp)
                        )
                    }

                    Spacer(modifier = Modifier.height(24.dp))

                    Text(
                        text = "Tu Archivador 3x3 está vacío",
                        style = MaterialTheme.typography.headlineMedium,
                        color = SnowTextPrimary,
                        textAlign = TextAlign.Center
                    )

                    Spacer(modifier = Modifier.height(8.dp))

                    Text(
                        text = "Presiona el botón de escaneo para digitalizar tu primera carta coleccionable con CameraX y ML Kit.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = SlateTextSecondary,
                        textAlign = TextAlign.Center
                    )
                }
            } else {
                // Cuadrícula física 3x3 (3 filas de 3 ranuras)
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(innerPadding)
                        .padding(horizontal = 12.dp, vertical = 8.dp),
                    verticalArrangement = Arrangement.SpaceEvenly
                ) {
                    for (row in 0 until 3) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .weight(1f),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            for (col in 0 until 3) {
                                val slotIndex = row * 3 + col
                                val card = uiState.currentSlots.getOrNull(slotIndex)

                                BinderPocketSlot(
                                    card = card,
                                    slotNumber = slotIndex + 1,
                                    onClick = { card?.let { viewModel.selectCardFor3D(it) } },
                                    modifier = Modifier
                                        .weight(1f)
                                        .aspectRatio(63f / 88f)
                                )
                            }
                        }
                    }
                }
            }
        }

        // Overlay Modal en Pantalla Completa: Visor 3D Interactivo
        uiState.selectedCardFor3D?.let { selectedCard ->
            Card3DViewer(
                card = selectedCard,
                onDismiss = { viewModel.dismiss3DViewer() }
            )
        }
    }
}

/**
 * Representación visual de un bolsillo individual del archivador 3x3 (Virtual Pocket Slot).
 * Emula la apariencia física de una funda plástica de polipropileno para TCG.
 */
@Composable
@Suppress("FunctionName")
private fun BinderPocketSlot(
    card: CardEntity?,
    slotNumber: Int,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val gradeColor = when (card?.conditionGrade?.lowercase()) {
        "mítico", "mitico", "gem mint", "mint" -> MythicGold
        "épico", "epico", "near mint" -> EpicCrimson
        "raro", "excellent" -> RarePurple
        "común", "comun", "light played" -> CommonBlue
        "dañado", "danado", "poor" -> DamagedGlacier
        else -> CarbonBorder
    }

    Box(
        modifier = modifier
            .clip(RoundedCornerShape(8.dp))
            .background(GraphiteSurface.copy(alpha = 0.6f))
            .border(
                width = if (card != null) 1.dp else 0.75.dp,
                color = if (card != null) gradeColor.copy(alpha = 0.7f) else CarbonBorder,
                shape = RoundedCornerShape(8.dp)
            )
            .clickable(enabled = card != null, onClick = onClick),
        contentAlignment = Alignment.Center
    ) {
        if (card != null) {
            // Miniatura WebP capturada por el sensor óptico
            CardImage(
                imagePath = card.frontThumbnailPath,
                contentDescription = card.name,
                contentScale = ContentScale.Crop,
                modifier = Modifier
                    .fillMaxSize()
                    .clip(RoundedCornerShape(8.dp))
            )

            // Insignia sutil de Grado / Float en esquina inferior
            card.conditionGrade?.let { grade ->
                Box(
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .fillMaxWidth()
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(Color.Transparent, OledBlack.copy(alpha = 0.9f))
                            )
                        )
                        .padding(horizontal = 4.dp, vertical = 3.dp)
                ) {
                    Text(
                        text = card.name,
                        style = MaterialTheme.typography.labelSmall.copy(
                            fontSize = 9.sp,
                            fontWeight = FontWeight.Bold,
                            color = SnowTextPrimary
                        ),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }
        } else {
            // Ranura vacía (emulación de bolsillo plástico transparente)
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.Center
            ) {
                Text(
                    text = "$slotNumber",
                    style = MaterialTheme.typography.labelSmall.copy(
                        fontFamily = FontFamily.Monospace,
                        color = SlateTextSecondary.copy(alpha = 0.4f),
                        fontSize = 12.sp
                    )
                )
            }
        }
    }
}
