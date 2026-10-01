package com.cardex.app.presentation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.lifecycle.lifecycleScope
import com.cardex.app.core.theme.CardexTheme
import com.cardex.app.data.image.WebpCardCompressor
import com.cardex.app.data.local.database.CardDatabase
import com.cardex.app.data.repository.CardRepositoryImpl
import com.cardex.app.data.repository.MarketplaceRepositoryImpl
import com.cardex.app.data.seed.PhysicalCardSeeder
import com.cardex.app.presentation.binder.BinderScreen
import com.cardex.app.presentation.binder.BinderViewModel
import com.cardex.app.presentation.marketplace.MarketplaceScreen
import com.cardex.app.presentation.marketplace.MarketplaceViewModel
import com.cardex.app.presentation.p2p.P2PTradeScreen
import com.cardex.app.presentation.p2p.P2PTradeViewModel
import com.cardex.app.presentation.scanner.ScannerScreen
import com.cardex.app.presentation.scanner.ScannerViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

// Actividad principal de Cardex.
// Punto de entrada que inicializa Jetpack Compose con el Tema OLED Negro Puro.
class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        val db = CardDatabase.getInstance(applicationContext)
        val repository = CardRepositoryImpl(db.cardDao())
        val compressor = WebpCardCompressor(applicationContext)
        val marketplaceRepository = MarketplaceRepositoryImpl()

        // Ingesta e inicialización de las 177 cartas físicas en segundo plano si la base de datos está vacía
        lifecycleScope.launch(Dispatchers.IO) {
            PhysicalCardSeeder.seedIfEmpty(repository)
        }

        setContent {
            CardexTheme {
                var currentScreen by remember { mutableStateOf("home") }
                val scannerViewModel = remember {
                    ScannerViewModel(
                        cardRepository = repository,
                        webpCardCompressor = compressor
                    )
                }
                val binderViewModel = remember {
                    BinderViewModel(cardRepository = repository)
                }
                val marketplaceViewModel = remember {
                    MarketplaceViewModel(marketplaceRepository = marketplaceRepository)
                }
                val p2pViewModel = remember {
                    P2PTradeViewModel(cardRepository = repository)
                }

                when (currentScreen) {
                    "scanner" -> {
                        ScannerScreen(
                            viewModel = scannerViewModel,
                            onNavigateBack = { currentScreen = "home" }
                        )
                    }
                    "marketplace" -> {
                        MarketplaceScreen(
                            viewModel = marketplaceViewModel,
                            onNavigateBack = { currentScreen = "home" }
                        )
                    }
                    "p2p" -> {
                        P2PTradeScreen(
                            viewModel = p2pViewModel,
                            onNavigateBack = { currentScreen = "home" }
                        )
                    }
                    else -> {
                        BinderScreen(
                            viewModel = binderViewModel,
                            onScanClick = { currentScreen = "scanner" },
                            onMarketplaceClick = { currentScreen = "marketplace" },
                            onP2PClick = { currentScreen = "p2p" }
                        )
                    }
                }
            }
        }
    }
}
