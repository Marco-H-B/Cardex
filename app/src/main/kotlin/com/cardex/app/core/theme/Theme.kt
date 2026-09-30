package com.cardex.app.core.theme

import android.app.Activity
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

private val DarkColorScheme = darkColorScheme(
    primary = MythicGold,
    onPrimary = OledBlack,
    primaryContainer = GraphiteSurface,
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

@Composable
fun CardexTheme(
    content: @Composable () -> Unit
) {
    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as? Activity)?.window
            if (window != null) {
                val insetsController = WindowCompat.getInsetsController(window, view)
                insetsController.isAppearanceLightStatusBars = false
                insetsController.isAppearanceLightNavigationBars = false
            }
        }
    }

    MaterialTheme(
        colorScheme = DarkColorScheme,
        typography = CardexTypography,
        content = content
    )
}
