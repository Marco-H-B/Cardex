package com.cardex.app.domain.structures

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

// Pruebas unitarias TDD para CardTrieSearch.
// Valida inserción, normalización, autocompletado por prefijo en O(L) y limpieza de memoria.
class CardTrieSearchTest {

    private lateinit var trie: CardTrieSearch

    @Before
    fun setUp() {
        trie = CardTrieSearch()
    }

    @Test
    fun `trie recien creado debe estar vacio y con tamanio cero`() {
        assertTrue(trie.isEmpty())
        assertEquals(0, trie.size())
        assertTrue(trie.searchPrefix("pika").isEmpty())
        assertFalse(trie.containsExact("pika"))
    }

    @Test
    fun `insert con palabra valida debe incrementar contador de palabras e indexar id`() {
        trie.insert("Pikachu", "card_025")

        assertFalse(trie.isEmpty())
        assertEquals(1, trie.size())
        assertTrue(trie.containsExact("Pikachu"))
        assertTrue(trie.containsExact("pikachu"))
    }

    @Test
    fun `insert debe ser insensible a mayusculas minusculas y espacios en blanco`() {
        trie.insert("  Charizard  ", "card_006")

        assertEquals(1, trie.size())
        assertTrue(trie.containsExact("charizard"))
        assertTrue(trie.containsExact("CHARIZARD"))
        assertTrue(trie.containsExact("Charizard"))

        val results = trie.searchPrefix("CHAR")
        assertEquals(1, results.size)
        assertEquals("card_006", results[0])
    }

    @Test
    fun `containsExact con prefijo parcial que no es fin de palabra debe retornar false`() {
        trie.insert("Pikachu", "card_025")

        // "Pika" es un prefijo, pero NO una palabra completa registrada
        assertFalse(trie.containsExact("Pika"))
        assertFalse(trie.containsExact("Pikach"))
        assertTrue(trie.containsExact("Pikachu"))
    }

    @Test
    fun `insert con el mismo nombre y diferente catalogId debe acumular los identificadores`() {
        // Mismo Pokémon en distintos sets (Base Set y Jungle)
        trie.insert("Pikachu", "base_set_025")
        trie.insert("Pikachu", "jungle_025")

        assertEquals(1, trie.size()) // La palabra única es una sola
        val results = trie.searchPrefix("pikachu")
        assertEquals(2, results.size)
        assertTrue(results.contains("base_set_025"))
        assertTrue(results.contains("jungle_025"))
    }

    @Test
    fun `searchPrefix debe retornar todos los ids de cartas que comienzan con el prefijo dado`() {
        trie.insert("Charmander", "card_004")
        trie.insert("Charmeleon", "card_005")
        trie.insert("Charizard", "card_006")
        trie.insert("Bulbasaur", "card_001")

        assertEquals(4, trie.size())

        val charResults = trie.searchPrefix("Char")
        assertEquals(3, charResults.size)
        assertTrue(charResults.contains("card_004"))
        assertTrue(charResults.contains("card_005"))
        assertTrue(charResults.contains("card_006"))
        assertFalse(charResults.contains("card_001"))

        val bulbResults = trie.searchPrefix("bulb")
        assertEquals(1, bulbResults.size)
        assertEquals("card_001", bulbResults[0])
    }

    @Test
    fun `searchPrefix con prefijo inexistente debe retornar lista vacia de forma segura`() {
        trie.insert("Pikachu", "card_025")
        trie.insert("Raichu", "card_026")

        val results = trie.searchPrefix("mew")
        assertTrue(results.isEmpty())
    }

    @Test
    fun `searchPrefix con cadena vacia debe retornar todos los ids indexados en el catalogo`() {
        trie.insert("Gengar", "card_094")
        trie.insert("Alakazam", "card_065")
        trie.insert("Machamp", "card_068")

        val allResults = trie.searchPrefix("")
        assertEquals(3, allResults.size)
        assertTrue(allResults.contains("card_094"))
        assertTrue(allResults.contains("card_065"))
        assertTrue(allResults.contains("card_068"))
    }

    @Test
    fun `searchPrefix debe devolver la palabra exacta y sus extensiones compuestas`() {
        trie.insert("Pikachu", "card_025")
        trie.insert("Pikachu VMAX", "card_025_vmax")

        assertEquals(2, trie.size())

        val results = trie.searchPrefix("pikachu")
        assertEquals(2, results.size)
        assertTrue(results.contains("card_025"))
        assertTrue(results.contains("card_025_vmax"))
    }

    @Test
    fun `insert con cadena vacia o espacios en blanco no debe modificar el arbol`() {
        trie.insert("", "empty_id")
        trie.insert("   ", "spaces_id")

        assertEquals(0, trie.size())
        assertTrue(trie.isEmpty())
    }

    @Test
    fun `clear debe vaciar completamente el arbol y reiniciar el tamanio a cero`() {
        trie.insert("Mewtwo", "card_150")
        trie.insert("Mew", "card_151")

        assertEquals(2, trie.size())

        trie.clear()

        assertEquals(0, trie.size())
        assertTrue(trie.isEmpty())
        assertTrue(trie.searchPrefix("mew").isEmpty())
        assertFalse(trie.containsExact("mew"))
    }

    @Test
    fun `soporte para caracteres especiales y guiones en nombres de cartas`() {
        trie.insert("Porygon-Z", "card_474")
        trie.insert("Ho-Oh", "card_250")

        assertTrue(trie.containsExact("porygon-z"))
        assertTrue(trie.containsExact("ho-oh"))

        val results = trie.searchPrefix("porygon-")
        assertEquals(1, results.size)
        assertEquals("card_474", results[0])
    }
}
