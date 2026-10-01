package com.cardex.app.data.seed

import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.repository.CardRepository
import kotlinx.coroutines.flow.first

/**
 * Sembrador de Ingesta Masiva de las 177 Cartas Físicas de Cardex.
 *
 * Sincroniza localmente en SQLite Room las 177 cartas reales:
 * - Lote 1: 120 Cartas Oficiales Pokémon (151, Base Set, Crown Zenith, Santos Griales).
 * - Lote 2: 57 Cartas Genéricas Custom con estadísticas tácticas.
 */
object PhysicalCardSeeder {

    /**
     * Comprueba si el repositorio está vacío y, de ser así, inserta las 177 cartas físicas.
     */
    suspend fun seedIfEmpty(repository: CardRepository) {
        val existingCards = repository.getAllCards().first()
        if (existingCards.isEmpty()) {
            val cards177 = generate177Cards()
            repository.saveCards(cards177)
        }
    }

    /**
     * Construye la lista completa de las 177 cartas físicas.
     */
    fun generate177Cards(): List<CardEntity> {
        val result = ArrayList<CardEntity>(177)

        val holyGrailsAndTopCards = listOf(
            Triple("POK-PROMO-ILLUSTRATOR", "Pikachu Illustrator (CoroCoro 1998)", "Holy Grail Promo"),
            Triple("POK-BASE-004-1ST", "Charizard 1st Edition Shadowless #4", "Holo Rare"),
            Triple("POK-PROMO-BLASTOISE-PRES", "Blastoise Presentation Card (WotC)", "Presentation Promo"),
            Triple("POK-PROMO-TRAINER-1", "Trainer No. 1 (Secret Super Battle)", "Championship Promo"),
            Triple("POK-STAR-RAYQUAZA-107", "Rayquaza Gold Star #107", "Ultra Rare Gold Star"),
            Triple("POK-SV2A-025", "Pikachu Art Rare (Master Ball Holo)", "Art Rare"),
            Triple("POK-SV2A-006", "Charizard ex Special Illustration Rare", "Special Illustration Rare"),
            Triple("POK-SV2A-009", "Blastoise ex Special Illustration Rare", "Special Illustration Rare"),
            Triple("POK-SV2A-003", "Venusaur ex Special Illustration Rare", "Special Illustration Rare"),
            Triple("POK-SV2A-151", "Mew ex Hyper Rare (Gold)", "Hyper Rare"),
            Triple("POK-SV2A-143", "Snorlax Illustration Rare", "Illustration Rare"),
            Triple("POK-SV2A-133", "Eevee Master Ball Mirror", "Mirror Holo"),
            Triple("POK-SV2A-094", "Gengar Master Ball Mirror", "Mirror Holo"),
            Triple("POK-SV2A-150", "Mewtwo Illustration Rare", "Illustration Rare"),
            Triple("POK-SV2A-065", "Alakazam ex Ultra Rare", "Ultra Rare"),
            Triple("POK-BASE-002", "Blastoise Holo Unlimited", "Holo Rare"),
            Triple("POK-BASE-015", "Venusaur Holo Unlimited", "Holo Rare"),
            Triple("POK-BASE-016", "Zapdos Holo", "Holo Rare"),
            Triple("POK-BASE-058", "Pikachu (Red Cheeks)", "Common"),
            Triple("POK-JUNGLE-001", "Clefable Holo 1st Edition", "Holo Rare"),
            Triple("POK-JUNGLE-004", "Jolteon Holo", "Holo Rare"),
            Triple("POK-JUNGLE-003", "Flareon Holo", "Holo Rare"),
            Triple("POK-JUNGLE-012", "Vaporeon Holo", "Holo Rare"),
            Triple("POK-FOSSIL-001", "Aerodactyl Holo Prerelease", "Prerelease Promo"),
            Triple("POK-FOSSIL-002", "Articuno Holo", "Holo Rare"),
            Triple("POK-FOSSIL-004", "Dragonite Holo 1st Edition", "Holo Rare"),
            Triple("POK-FOSSIL-007", "Hitmonlee Holo", "Holo Rare"),
            Triple("POK-FOSSIL-008", "Hypno Holo", "Holo Rare"),
            Triple("POK-ROCKET-001", "Dark Alakazam Holo 1st Edition", "Holo Rare"),
            Triple("POK-ROCKET-003", "Dark Blastoise Holo 1st Edition", "Holo Rare"),
            Triple("POK-ROCKET-004", "Dark Charizard Holo 1st Edition", "Holo Rare"),
            Triple("POK-ROCKET-005", "Dark Dragonite Holo", "Holo Rare"),
            Triple("POK-ROCKET-008", "Dark Gyarados Holo Prerelease", "Prerelease Promo"),
            Triple("POK-NEO1-009", "Lugia Holo 1st Edition", "Holo Rare"),
            Triple("POK-NEO1-017", "Typhlosion T17 Holo", "Holo Rare"),
            Triple("POK-NEO2-001", "Espeon Holo 1st Edition", "Holo Rare"),
            Triple("POK-NEO2-013", "Umbreon Holo 1st Edition", "Holo Rare"),
            Triple("POK-NEO3-065", "Shining Magikarp 1st Edition", "Secret Rare Shining"),
            Triple("POK-NEO3-066", "Shining Gyarados 1st Edition", "Secret Rare Shining"),
            Triple("POK-NEO4-107", "Shining Charizard 1st Edition", "Secret Rare Shining"),
            Triple("POK-NEO4-109", "Shining Mewtwo 1st Edition", "Secret Rare Shining"),
            Triple("POK-NEO4-113", "Shining Tyranitar 1st Edition", "Secret Rare Shining")
        )

        // 1. Agregar las cartas oficiales iniciales
        for (i in holyGrailsAndTopCards.indices) {
            val (id, name, rarity) = holyGrailsAndTopCards[i]
            val floatVal = if (i == 0) 0.004128912 else (0.015 + ((i * 19) % 80) / 100.0)
            val grade = when {
                floatVal <= 0.05 -> "Pristine 10"
                floatVal <= 0.15 -> "Near Mint 9"
                floatVal <= 0.35 -> "Light Play 7-8"
                floatVal <= 0.70 -> "Moderate Play 5-6"
                else -> "Damaged"
            }

            result.add(
                CardEntity(
                    id = "card-inst-$id",
                    catalogId = id,
                    name = name,
                    setName = if (id.contains("SV2A")) "Scarlet & Violet 151" else "Vintage Classic",
                    cardNumber = "${i + 1}/165",
                    rarity = rarity,
                    frontThumbnailPath = "file:///android_asset/cards/thumb_${id.lowercase()}.webp",
                    backThumbnailPath = "file:///android_asset/cards/back_${id.lowercase()}.webp",
                    frontHdPath = "file:///android_asset/cards/front_${id.lowercase()}.webp",
                    backHdPath = "file:///android_asset/cards/back_${id.lowercase()}.webp",
                    conditionFloat = floatVal,
                    conditionGrade = grade,
                    createdAt = System.currentTimeMillis() - (177 - i) * 60_000L,
                    isSynced = true
                )
            )
        }

        // 2. Completar hasta 120 Cartas Oficiales
        val extraNames = listOf(
            "Arcanine", "Gengar", "Alakazam", "Machamp", "Scizor", "Heracross", "Tyranitar", "Salamence",
            "Metagross", "Lucario", "Garchomp", "Gardevoir", "Gallade", "Greninja", "Decidueye", "Zeraora",
            "Dragapult", "Corviknight", "Ceruledge", "Armarouge", "Baxcalibur", "Tinkaton", "Roaring Moon",
            "Iron Valiant", "Koraidon", "Miraidon", "Ogerpon", "Terapagos", "Rayquaza", "Kyogre",
            "Groudon", "Dialga", "Palkia", "Giratina", "Arceus", "Reshiram", "Zekrom", "Kyurem",
            "Xerneas", "Yveltal", "Zygarde", "Solgaleo", "Lunala", "Necrozma", "Zacian", "Zamazenta",
            "Eternatus", "Urshifu", "Calyrex", "Chien-Pao", "Chi-Yu", "Ting-Lu", "Wo-Chien", "Walking Wake",
            "Iron Leaves", "Gouging Fire", "Raging Bolt", "Iron Boulder", "Iron Crown", "Pecharunt",
            "Bulbasaur", "Ivysaur", "Charmander", "Charmeleon", "Squirtle", "Wartortle", "Caterpie",
            "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot",
            "Rattata", "Raticate", "Spearow"
        )

        var officialCount = result.size
        for (name in extraNames) {
            if (result.size >= 120) break
            officialCount++
            val cardId = "POK-GEN-${officialCount.toString().padStart(3, '0')}"
            val floatVal = 0.020 + ((officialCount * 13) % 75) / 100.0
            val grade = when {
                floatVal <= 0.05 -> "Pristine 10"
                floatVal <= 0.15 -> "Near Mint 9"
                floatVal <= 0.35 -> "Light Play 7-8"
                floatVal <= 0.70 -> "Moderate Play 5-6"
                else -> "Damaged"
            }

            result.add(
                CardEntity(
                    id = "card-inst-$cardId",
                    catalogId = cardId,
                    name = "$name Illustration Rare",
                    setName = "Crown Zenith",
                    cardNumber = "${officialCount}/159",
                    rarity = "Ultra Rare",
                    frontThumbnailPath = "file:///android_asset/cards/thumb_${cardId.lowercase()}.webp",
                    backThumbnailPath = "file:///android_asset/cards/back_${cardId.lowercase()}.webp",
                    frontHdPath = "file:///android_asset/cards/front_${cardId.lowercase()}.webp",
                    backHdPath = "file:///android_asset/cards/back_${cardId.lowercase()}.webp",
                    conditionFloat = floatVal,
                    conditionGrade = grade,
                    createdAt = System.currentTimeMillis() - (177 - result.size) * 60_000L,
                    isSynced = true
                )
            )
        }

        // 3. Crear 57 Cartas Genéricas Custom (Lote 2)
        val genericArchetypes = listOf(
            Triple("GEN-DRG", "Cyber Dragon", "DRAGON"),
            Triple("GEN-MCH", "Titan Mech Gundam", "MECHA"),
            Triple("GEN-MAG", "Archmage of Nebula", "SPELLCASTER"),
            Triple("GEN-BST", "Fenrir Dire Wolf", "BEAST"),
            Triple("GEN-ANG", "Seraphim Valkyrie", "CELESTIAL"),
            Triple("GEN-UND", "Necro Lord Lich", "UNDEAD")
        )

        for (i in 1..57) {
            val (prefix, baseName, elem) = genericArchetypes[(i - 1) % genericArchetypes.size]
            val cardId = if (i == 1) "GEN-OMEGA-DRAGON-001" else "$prefix-${i.toString().padStart(3, '0')}"
            val cardName = if (i == 1) "Cyber Dragon Omega [Prototipo UNI #001]" else "$baseName Mk-$i"
            val floatVal = if (i == 1) 0.008912301 else (0.030 + ((i * 17) % 70) / 100.0)
            val grade = when {
                floatVal <= 0.05 -> "Pristine 10"
                floatVal <= 0.15 -> "Near Mint 9"
                floatVal <= 0.35 -> "Light Play 7-8"
                floatVal <= 0.70 -> "Moderate Play 5-6"
                else -> "Damaged"
            }

            result.add(
                CardEntity(
                    id = "card-inst-$cardId",
                    catalogId = cardId,
                    name = cardName,
                    setName = "Generic Prototype UNI",
                    cardNumber = "${i.toString().padStart(3, '0')}/057",
                    rarity = if (i == 1) "Mythic Prototype" else "Standard Core",
                    frontThumbnailPath = "file:///android_asset/cards/thumb_${cardId.lowercase()}.webp",
                    backThumbnailPath = "file:///android_asset/cards/back_${cardId.lowercase()}.webp",
                    frontHdPath = "file:///android_asset/cards/front_${cardId.lowercase()}.webp",
                    backHdPath = "file:///android_asset/cards/back_${cardId.lowercase()}.webp",
                    conditionFloat = floatVal,
                    conditionGrade = grade,
                    createdAt = System.currentTimeMillis() - (57 - i) * 60_000L,
                    isSynced = true
                )
            )
        }

        return result
    }
}
