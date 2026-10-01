package com.cardex.app.core.theme

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Test

/**
 * Pruebas unitarias para validar las paletas estructurales oficiales de Cardex:
 * - Modo Oscuro Negro Puro OLED (#000000)
 * - Modo Claro Porcelana (#F2F2F7 / Apple HIG)
 * Conforme a spec/04_UI_UX_DESIGN.md.
 */
class ThemeTest {

    @Test
    fun `dark color scheme debe respetar el negro absoluto oled y verde apple hig`() {
        assertEquals(OledBlack, DarkColorScheme.background)
        assertEquals(TitaniumSurface, DarkColorScheme.surface)
        assertEquals(CardexGreen, DarkColorScheme.primary)
        assertEquals(SnowTextPrimary, DarkColorScheme.onBackground)
        assertEquals(CarbonBorder, DarkColorScheme.outline)
    }

    @Test
    fun `light color scheme debe respetar el fondo porcelana, superficie blanca y borde platino`() {
        assertEquals(LightBackground, LightColorScheme.background)
        assertEquals(LightSurface, LightColorScheme.surface)
        assertEquals(CardexLightGreen, LightColorScheme.primary)
        assertEquals(LightTextPrimary, LightColorScheme.onBackground)
        assertEquals(LightBorder, LightColorScheme.outline)
    }

    @Test
    fun `ambas paletas deben tener fondos y textos de contraste complementario`() {
        assertNotEquals(DarkColorScheme.background, LightColorScheme.background)
        assertNotEquals(DarkColorScheme.surface, LightColorScheme.surface)
        assertNotEquals(DarkColorScheme.onBackground, LightColorScheme.onBackground)
        assertEquals(OledBlack, DarkColorScheme.background)
        assertEquals(LightBackground, LightColorScheme.background)
    }
}
