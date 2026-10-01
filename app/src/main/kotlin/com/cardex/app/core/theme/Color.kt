package com.cardex.app.core.theme

import androidx.compose.ui.graphics.Color
import com.cardex.app.data.local.entity.CardEntity

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
val LightBorder = Color(0xFFE5E5EA)
val CardexLightGreen = Color(0xFF34C759)

// ==============================================================================
// 💎 PALETA OFICIAL DE GRADOS DE DESGASTE (FLOAT TIERS ESPECÍFICOS DE CARTAS)
// ==============================================================================
val MythicGold = Color(0xFFFFD700)      // 0.00 - 0.07 (Gema Impecable / Grado Mítico)
val EpicCrimson = Color(0xFFE63946)     // 0.07 - 0.15 (Casi Perfecta / Grado Épico)
val RarePurple = Color(0xFF9D4EDD)      // 0.15 - 0.38 (Desgaste Ligero / Grado Raro)
val CommonBlue = Color(0xFF0A84FF)      // 0.38 - 0.70 (Bordes Blancos / Grado Común - Azul Eléctrico vibrante)
val CommonSapphire = CommonBlue
val RareAmethyst = RarePurple
val DamagedCyan = Color(0xFF90E0EF)     // 0.70 - 1.00 (Dañada o Partida / Grado Dañado)
val DamagedGlacier = DamagedCyan

/**
 * Retorna el color oficial de grado de desgaste según el Float inmutable [0.0, 1.0] o la etiqueta de texto.
 * Mapeo de física y estado de conservación:
 * - Float [0.00, 0.07] / Mint, Mítico, Pristine -> MythicGold
 * - Float (0.07, 0.15] / Near Mint, Épico -> EpicCrimson
 * - Float (0.15, 0.38] / Raro, Excellent, Light Play -> RarePurple
 * - Float (0.38, 0.70] / Común, Moderate Play -> CommonBlue
 * - Float (0.70, 1.00] / Dañado, Damaged, Poor -> DamagedGlacier
 */
fun CardEntity?.getConditionGradeColor(fallback: Color = SlateTextSecondary): Color {
    if (this == null) return fallback

    // 1. Prioridad: Clasificación continua por Float inmutable de desgaste
    conditionFloat?.let { floatVal ->
        return when {
            floatVal <= 0.07 -> MythicGold
            floatVal <= 0.15 -> EpicCrimson
            floatVal <= 0.38 -> RarePurple
            floatVal <= 0.70 -> CommonBlue
            else -> DamagedGlacier
        }
    }

    // 2. Clasificación categórica por texto de Grado oficial
    val grade = conditionGrade?.lowercase() ?: return fallback
    return when {
        grade.contains("near") || grade.contains("épic") || grade.contains("epic") ||
        grade.contains("nm") -> EpicCrimson

        grade.contains("mint") || grade.contains("mític") || grade.contains("mitic") ||
        grade.contains("pristine") || grade.contains("gem") -> MythicGold

        grade.contains("light") || grade.contains("rar") || grade.contains("excel") ||
        grade.contains("ex") -> RarePurple

        grade.contains("moderat") || grade.contains("com") || grade.contains("play") -> CommonBlue

        grade.contains("dañ") || grade.contains("dan") || grade.contains("poor") ||
        grade.contains("damag") -> DamagedGlacier

        else -> fallback
    }
}
