package com.cardex.app.core.theme

import android.app.Activity
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

// Paleta Oficial Modo Oscuro Negro Puro OLED (#000000)
val DarkColorScheme = darkColorScheme(
    primary = CardexGreen,
    onPrimary = OledBlack,
    primaryContainer = TitaniumSurface,
    onPrimaryContainer = SnowTextPrimary,
    secondary = SlateTextSecondary,
    onSecondary = SnowTextPrimary,
    background = OledBlack,
    onBackground = SnowTextPrimary,
    surface = GraphiteSurface,
    onSurface = SnowTextPrimary,
    surfaceVariant = GraphiteSurface,
    onSurfaceVariant = SlateTextSecondary,
    outline = CarbonBorder
)

// Paleta Oficial Modo Claro Porcelana (#F2F2F7 / Apple HIG)
val LightColorScheme = lightColorScheme(
    primary = CardexLightGreen,
    onPrimary = LightSurface,
    primaryContainer = LightSurface,
    onPrimaryContainer = LightTextPrimary,
    secondary = SlateTextSecondary,
    onSecondary = LightSurface,
    background = LightBackground,
    onBackground = LightTextPrimary,
    surface = LightSurface,
    onSurface = LightTextPrimary,
    surfaceVariant = LightBackground,
    onSurfaceVariant = SlateTextSecondary,
    outline = LightBorder
)

@Composable
fun CardexTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    val colorScheme = if (darkTheme) DarkColorScheme else LightColorScheme

    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as? Activity)?.window
            if (window != null) {
                val insetsController = WindowCompat.getInsetsController(window, view)
                insetsController.isAppearanceLightStatusBars = !darkTheme
                insetsController.isAppearanceLightNavigationBars = !darkTheme
            }
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = CardexTypography,
        content = content
    )
}
