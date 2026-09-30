package com.cardex.app.core.theme

import androidx.compose.ui.graphics.Color

// Paleta Oficial de Cardex (OLED Puro e Interfaz de Alta Fidelidad)
// Fondo absoluto negro puro (#000000) para apagar los diodos orgánicos en pantallas OLED.
val OledBlack = Color(0xFF000000)
val GraphiteSurface = Color(0xFF121212)
val CarbonBorder = Color(0xFF262626)
val SnowTextPrimary = Color(0xFFF5F5F7)
val SlateTextSecondary = Color(0xFF8E8E93)

// Paleta Oficial de Grados de Desgaste (Float Tiers)
val MythicGold = Color(0xFFFFD700)      // 0.00 - 0.07 (Gema Impecable)
val EpicCrimson = Color(0xFFE63946)     // 0.07 - 0.15 (Casi Perfecta)
val RarePurple = Color(0xFF9D4EDD)      // 0.15 - 0.38 (Desgaste Ligero)
val CommonBlue = Color(0xFF023E8A)      // 0.38 - 0.70 (Bordes Blancos)
val DamagedCyan = Color(0xFF90E0EF)     // 0.70 - 1.00 (Dañada o Partida)
val DamagedGlacier = DamagedCyan
