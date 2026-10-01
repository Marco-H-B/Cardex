package com.cardex.app.core.theme

import com.cardex.app.data.local.entity.CardEntity
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Pruebas unitarias para la resolución dinámica de color por grado y float de desgaste.
 */
class ConditionGradeColorTest {

    private fun createCard(
        floatVal: Double? = null,
        grade: String? = null
    ): CardEntity {
        return CardEntity(
            id = "test-card-1",
            name = "Charizard Ex",
            frontThumbnailPath = "path/front_thumb.webp",
            backThumbnailPath = "path/back_thumb.webp",
            frontHdPath = "path/front_hd.webp",
            backHdPath = "path/back_hd.webp",
            conditionFloat = floatVal,
            conditionGrade = grade
        )
    }

    @Test
    fun `clasificacion por float cuantitativo debe mapear exactamente a los tiers de rareza y desgaste`() {
        // Tier 1: Float <= 0.07 -> MythicGold
        assertEquals(MythicGold, createCard(floatVal = 0.00).getConditionGradeColor())
        assertEquals(MythicGold, createCard(floatVal = 0.05).getConditionGradeColor())
        assertEquals(MythicGold, createCard(floatVal = 0.07).getConditionGradeColor())

        // Tier 2: 0.07 < Float <= 0.15 -> EpicCrimson
        assertEquals(EpicCrimson, createCard(floatVal = 0.071).getConditionGradeColor())
        assertEquals(EpicCrimson, createCard(floatVal = 0.12).getConditionGradeColor())
        assertEquals(EpicCrimson, createCard(floatVal = 0.15).getConditionGradeColor())

        // Tier 3: 0.15 < Float <= 0.38 -> RarePurple
        assertEquals(RarePurple, createCard(floatVal = 0.151).getConditionGradeColor())
        assertEquals(RarePurple, createCard(floatVal = 0.25).getConditionGradeColor())
        assertEquals(RarePurple, createCard(floatVal = 0.38).getConditionGradeColor())

        // Tier 4: 0.38 < Float <= 0.70 -> CommonBlue
        assertEquals(CommonBlue, createCard(floatVal = 0.381).getConditionGradeColor())
        assertEquals(CommonBlue, createCard(floatVal = 0.55).getConditionGradeColor())
        assertEquals(CommonBlue, createCard(floatVal = 0.70).getConditionGradeColor())

        // Tier 5: Float > 0.70 -> DamagedGlacier
        assertEquals(DamagedGlacier, createCard(floatVal = 0.701).getConditionGradeColor())
        assertEquals(DamagedGlacier, createCard(floatVal = 0.88).getConditionGradeColor())
        assertEquals(DamagedGlacier, createCard(floatVal = 1.00).getConditionGradeColor())
    }

    @Test
    fun `clasificacion por texto de grado debe resolver correctamente etiquetas TCG oficiales`() {
        // Mint / Mítico / Pristine
        assertEquals(MythicGold, createCard(grade = "MINT").getConditionGradeColor())
        assertEquals(MythicGold, createCard(grade = "Pristine 10").getConditionGradeColor())
        assertEquals(MythicGold, createCard(grade = "Gem Mint").getConditionGradeColor())
        assertEquals(MythicGold, createCard(grade = "Mítico").getConditionGradeColor())

        // Near Mint / Épico (Near Mint no debe colisionar con Mint)
        assertEquals(EpicCrimson, createCard(grade = "Near Mint 9").getConditionGradeColor())
        assertEquals(EpicCrimson, createCard(grade = "Near Mint").getConditionGradeColor())
        assertEquals(EpicCrimson, createCard(grade = "Épico").getConditionGradeColor())

        // Raro / Light Play
        assertEquals(RarePurple, createCard(grade = "Light Play 7-8").getConditionGradeColor())
        assertEquals(RarePurple, createCard(grade = "Excellent").getConditionGradeColor())
        assertEquals(RarePurple, createCard(grade = "Raro").getConditionGradeColor())

        // Común / Moderate Play
        assertEquals(CommonBlue, createCard(grade = "Moderate Play 5-6").getConditionGradeColor())
        assertEquals(CommonBlue, createCard(grade = "Común").getConditionGradeColor())
        assertEquals(CommonBlue, createCard(grade = "Played").getConditionGradeColor())

        // Dañado / Poor
        assertEquals(DamagedGlacier, createCard(grade = "Damaged").getConditionGradeColor())
        assertEquals(DamagedGlacier, createCard(grade = "Dañado").getConditionGradeColor())
        assertEquals(DamagedGlacier, createCard(grade = "Poor").getConditionGradeColor())
    }

    @Test
    fun `carta nula o grado desconocido debe retornar el fallback especificado`() {
        val nullCard: CardEntity? = null
        assertEquals(SlateTextSecondary, nullCard.getConditionGradeColor())
        assertEquals(CarbonBorder, nullCard.getConditionGradeColor(fallback = CarbonBorder))

        val unknownGradeCard = createCard(grade = "Desconocido")
        assertEquals(SlateTextSecondary, unknownGradeCard.getConditionGradeColor())
        assertEquals(CarbonBorder, unknownGradeCard.getConditionGradeColor(fallback = CarbonBorder))
    }
}
