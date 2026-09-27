package com.cardex.app.domain.structures

import com.cardex.app.domain.model.CardSide
import com.cardex.app.domain.model.CapturedSide
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

// Pruebas unitarias TDD para CaptureStack.
class CaptureStackTest {

    private lateinit var stack: CaptureStack

    @Before
    fun setUp() {
        stack = CaptureStack()
    }

    @Test
    fun `pila recien creada debe estar vacia y con tamanio cero`() {
        assertTrue(stack.isEmpty())
        assertFalse(stack.isFull())
        assertEquals(0, stack.size())
    }

    @Test
    fun `push debe insertar anverso y luego reverso incrementando tamanio`() {
        val frontSide = CapturedSide(CardSide.FRONT, "/tmp/front.webp", 1000L, 85.5f)
        val backSide = CapturedSide(CardSide.BACK, "/tmp/back.webp", 1050L, 89.0f)

        stack.push(frontSide)
        assertEquals(1, stack.size())
        assertFalse(stack.isEmpty())
        assertFalse(stack.isFull())

        stack.push(backSide)
        assertEquals(2, stack.size())
        assertTrue(stack.isFull())
    }

    @Test(expected = IllegalStateException::class)
    fun `push en pila llena debe lanzar IllegalStateException por desbordamiento`() {
        val frontSide = CapturedSide(CardSide.FRONT, "/tmp/front.webp", 1000L, 85.5f)
        val backSide = CapturedSide(CardSide.BACK, "/tmp/back.webp", 1050L, 89.0f)
        val extraSide = CapturedSide(CardSide.FRONT, "/tmp/extra.webp", 1100L, 90.0f)

        stack.push(frontSide)
        stack.push(backSide)
        stack.push(extraSide) // Debe fallar
    }

    @Test
    fun `pop debe extraer elementos en orden LIFO y decrementar tamanio`() {
        val frontSide = CapturedSide(CardSide.FRONT, "/tmp/front.webp", 1000L, 85.5f)
        val backSide = CapturedSide(CardSide.BACK, "/tmp/back.webp", 1050L, 89.0f)

        stack.push(frontSide)
        stack.push(backSide)

        val poppedBack = stack.pop()
        assertEquals(CardSide.BACK, poppedBack.side)
        assertEquals(1, stack.size())

        val poppedFront = stack.pop()
        assertEquals(CardSide.FRONT, poppedFront.side)
        assertEquals(0, stack.size())
        assertTrue(stack.isEmpty())
    }

    @Test(expected = NoSuchElementException::class)
    fun `pop en pila vacia debe lanzar NoSuchElementException por subdesbordamiento`() {
        stack.pop() // Debe fallar
    }

    @Test
    fun `peek debe retornar el elemento superior sin extraerlo`() {
        val frontSide = CapturedSide(CardSide.FRONT, "/tmp/front.webp", 1000L, 85.5f)
        stack.push(frontSide)

        val peeked = stack.peek()
        assertEquals(CardSide.FRONT, peeked.side)
        assertEquals(1, stack.size()) // El tamaño no cambia
    }

    @Test
    fun `clear debe vaciar la pila completamente y dejar tamanio en cero`() {
        val frontSide = CapturedSide(CardSide.FRONT, "/tmp/front.webp", 1000L, 85.5f)
        stack.push(frontSide)

        stack.clear()
        assertTrue(stack.isEmpty())
        assertEquals(0, stack.size())
    }
}
