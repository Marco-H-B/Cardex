package com.cardex.app.presentation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import com.cardex.app.core.theme.CardexTheme

// Actividad principal de Cardex.
// Punto de entrada que inicializa Jetpack Compose con el Tema OLED Negro Puro.
class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        setContent {
            CardexTheme {
                HomeScreen(
                    onScanClick = {
                        // TODO: [Fase 3] Lanzar el flujo de escaneo óptico con CameraX y ML Kit
                    }
                )
            }
        }
    }
}
