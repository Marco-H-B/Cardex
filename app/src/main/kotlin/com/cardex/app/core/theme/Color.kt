package com.cardex.app.core.theme

import androidx.compose.ui.graphics.Color

// ==============================================================================
// 🎨 PALETA ESTRUCTURAL DE INTERFAZ (APPLE HIG + MODO OSCURO NEGRO PURO OLED)
// ==============================================================================

// 🌑 MODO OSCURO OLED
// Fondo negro absoluto (#000000) para apagar los píxeles en pantallas OLED.
val OledBlack = Color(0xFF000000)
// Contenedores elevados en gris titanio (#1C1C1E).
val TitaniumSurface = Color(0xFF1C1C1E)
val GraphiteSurface = TitaniumSurface
// Bordes y divisores finos (#2C2C2E).
val CarbonBorder = Color(0xFF2C2C2E)
// Texto principal en blanco puro (#FFFFFF).
val SnowTextPrimary = Color(0xFFFFFFFF)
// Subtítulos y etiquetas secundarias en gris del sistema (#8E8E93).
val SlateTextSecondary = Color(0xFF8E8E93)
// Acento interactivo y botones en verde de alta luminosidad (#30D158).
val CardexGreen = Color(0xFF30D158)
val CardexAccent = CardexGreen

// ☀️ MODO CLARO (APPLE HIG PORCELANA & SYSTEM GRAY)
val LightBackground = Color(0xFFF2F2F7)
val LightSurface = Color(0xFFFFFFFF)
val LightTextPrimary = Color(0xFF000000)
val CardexLightGreen = Color(0xFF34C759)

// ==============================================================================
// 💎 PALETA OFICIAL DE GRADOS DE DESGASTE (FLOAT TIERS ESPECÍFICOS DE CARTAS)
// ==============================================================================
val MythicGold = Color(0xFFFFD700)      // 0.00 - 0.07 (Gema Impecable / Grado Mítico)
val EpicCrimson = Color(0xFFE63946)     // 0.07 - 0.15 (Casi Perfecta / Grado Épico)
val RarePurple = Color(0xFF9D4EDD)      // 0.15 - 0.38 (Desgaste Ligero / Grado Raro)
val CommonBlue = Color(0xFF023E8A)      // 0.38 - 0.70 (Bordes Blancos / Grado Común)
val DamagedCyan = Color(0xFF90E0EF)     // 0.70 - 1.00 (Dañada o Partida / Grado Dañado)
val DamagedGlacier = DamagedCyan
