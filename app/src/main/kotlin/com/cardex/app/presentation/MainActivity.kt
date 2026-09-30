package com.cardex.app.presentation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import com.cardex.app.core.theme.CardexTheme
import com.cardex.app.data.image.WebpCardCompressor
import com.cardex.app.data.local.database.CardDatabase
import com.cardex.app.data.repository.CardRepositoryImpl
import com.cardex.app.presentation.binder.BinderScreen
import com.cardex.app.presentation.binder.BinderViewModel
import com.cardex.app.presentation.scanner.ScannerScreen
import com.cardex.app.presentation.scanner.ScannerViewModel

// Actividad principal de Cardex.
// Punto de entrada que inicializa Jetpack Compose con el Tema OLED Negro Puro.
class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        val db = CardDatabase.getInstance(applicationContext)
        val repository = CardRepositoryImpl(db.cardDao())
        val compressor = WebpCardCompressor(applicationContext)

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

                if (currentScreen == "scanner") {
                    ScannerScreen(
                        viewModel = scannerViewModel,
                        onNavigateBack = { currentScreen = "home" }
                    )
                } else {
                    BinderScreen(
                        viewModel = binderViewModel,
                        onScanClick = { currentScreen = "scanner" }
                    )
                }
            }
        }
    }
}
