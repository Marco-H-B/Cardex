package com.cardex.app.domain.structures

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

// Pruebas unitarias completas bajo TDD para SyncDeque.
class SyncDequeTest {

    private lateinit var deque: SyncDeque<String>

    @Before
    fun setUp() {
        deque = SyncDeque(initialCapacity = 4)
    }

    @Test
    fun `deque recien creada debe estar vacia y con tamanio cero`() {
        assertTrue(deque.isEmpty())
        assertEquals(0, deque.size())
        assertEquals(4, deque.capacity())
        assertNull(deque.peekFirst())
        assertNull(deque.peekLast())
    }

    @Test
    fun `addFirst y removeFirst deben operar en orden LIFO en el extremo frontal`() {
        deque.addFirst("item_1")
        deque.addFirst("item_2")

        assertEquals(2, deque.size())
        assertFalse(deque.isEmpty())
        assertEquals("item_2", deque.peekFirst())

        assertEquals("item_2", deque.removeFirst())
        assertEquals("item_1", deque.removeFirst())
        assertTrue(deque.isEmpty())
        assertEquals(0, deque.size())
    }

    @Test
    fun `addLast y removeLast deben operar en orden LIFO en el extremo trasero`() {
        deque.addLast("item_A")
        deque.addLast("item_B")

        assertEquals(2, deque.size())
        assertEquals("item_B", deque.peekLast())

        assertEquals("item_B", deque.removeLast())
        assertEquals("item_A", deque.removeLast())
        assertTrue(deque.isEmpty())
    }

    @Test
    fun `addLast y removeFirst deben operar en orden FIFO como cola de despacho estandar`() {
        deque.addLast("foto_hd_1")
        deque.addLast("foto_hd_2")
        deque.addLast("foto_hd_3")

        assertEquals("foto_hd_1", deque.removeFirst())
        assertEquals("foto_hd_2", deque.removeFirst())
        assertEquals("foto_hd_3", deque.removeFirst())
        assertTrue(deque.isEmpty())
    }

    @Test
    fun `addFirst y removeLast deben operar como cola invertida`() {
        deque.addFirst("primero")
        deque.addFirst("segundo")

        assertEquals("primero", deque.removeLast())
        assertEquals("segundo", deque.removeLast())
        assertTrue(deque.isEmpty())
    }

    @Test(expected = NoSuchElementException::class)
    fun `removeFirst en deque vacia debe lanzar NoSuchElementException`() {
        deque.removeFirst()
    }

    @Test(expected = NoSuchElementException::class)
    fun `removeLast en deque vacia debe lanzar NoSuchElementException`() {
        deque.removeLast()
    }

    @Test
    fun `peekFirst y peekLast no deben modificar tamanio ni extraer elementos`() {
        deque.addLast("cabeza")
        deque.addLast("cola")

        assertEquals(2, deque.size())
        assertEquals("cabeza", deque.peekFirst())
        assertEquals("cola", deque.peekLast())
        assertEquals(2, deque.size()) // El tamaño permanece intacto
    }

    @Test
    fun `peekFirst y peekLast en deque vacia deben retornar null de forma segura`() {
        assertNull(deque.peekFirst())
        assertNull(deque.peekLast())
    }

    @Test
    fun `aritmetica circular debe dar la vuelta correctamente cuando front retrocede a traves del borde`() {
        // Con capacidad 4: front retrocede desde 0 a 3, luego a 2
        deque.addFirst("front_1") // Posición esperada: 3
        deque.addFirst("front_2") // Posición esperada: 2
        deque.addFirst("front_3") // Posición esperada: 1

        assertEquals(3, deque.size())
        assertEquals("front_3", deque.peekFirst())
        assertEquals("front_3", deque.removeFirst())
        assertEquals("front_2", deque.removeFirst())
        assertEquals("front_1", deque.removeFirst())
        assertTrue(deque.isEmpty())
    }

    @Test
    fun `aritmetica circular debe dar la vuelta cuando rear avanza y front se desplaza`() {
        val tinyDeque = SyncDeque<Int>(initialCapacity = 3)

        tinyDeque.addLast(10)
        tinyDeque.addLast(20)
        assertEquals(10, tinyDeque.removeFirst()) // front avanza a 1

        tinyDeque.addLast(30)
        tinyDeque.addLast(40) // rear debe dar la vuelta circularmente a 0

        assertEquals(3, tinyDeque.size())
        assertEquals(20, tinyDeque.removeFirst())
        assertEquals(30, tinyDeque.removeFirst())
        assertEquals(40, tinyDeque.removeFirst())
        assertTrue(tinyDeque.isEmpty())
    }

    @Test
    fun `resize debe duplicar capacidad y desenrollar elementos fragmentados preservando el orden exacto`() {
        val smallDeque = SyncDeque<String>(initialCapacity = 4)

        // Forzar rotación en el buffer: insertamos dos y removemos uno
        smallDeque.addLast("A")
        smallDeque.addLast("B")
        assertEquals("A", smallDeque.removeFirst()) // front ahora está en 1

        // Insertar más elementos para forzar que los datos rodeen el final del arreglo
        smallDeque.addLast("C")
        smallDeque.addLast("D")
        smallDeque.addLast("E") // Aquí la cola se llena con 4 elementos: B, C, D, E

        assertEquals(4, smallDeque.size())
        assertEquals(4, smallDeque.capacity())

        // Este elemento adicional debe disparar resize() automáticamente
        smallDeque.addLast("F")

        assertEquals(5, smallDeque.size())
        assertEquals(8, smallDeque.capacity()) // Capacidad duplicada a 8

        // Verificar que el orden desenrollado de salida sea exactamente FIFO
        assertEquals("B", smallDeque.removeFirst())
        assertEquals("C", smallDeque.removeFirst())
        assertEquals("D", smallDeque.removeFirst())
        assertEquals("E", smallDeque.removeFirst())
        assertEquals("F", smallDeque.removeFirst())
        assertTrue(smallDeque.isEmpty())
    }

    @Test
    fun `operaciones mixtas de alta carga deben mantener la consistencia total de datos`() {
        val mixedDeque = SyncDeque<Int>(initialCapacity = 4)

        // Simulación: Miniaturas al frente y Fotos pesadas al fondo
        mixedDeque.addFirst(100) // Miniatura urgente
        mixedDeque.addLast(1)    // Foto HD 1
        mixedDeque.addFirst(200) // Miniatura urgente 2
        mixedDeque.addLast(2)    // Foto HD 2

        assertEquals(4, mixedDeque.size())

        // Salida esperada en orden de prioridad: 200, 100, 1, 2
        assertEquals(200, mixedDeque.removeFirst())
        assertEquals(100, mixedDeque.removeFirst())
        assertEquals(1, mixedDeque.removeFirst())
        assertEquals(2, mixedDeque.removeFirst())

        assertTrue(mixedDeque.isEmpty())
    }

    @Test
    fun `clear debe vaciar la cola reiniciar indices y dejar tamanio en cero`() {
        deque.addLast("uno")
        deque.addLast("dos")
        deque.addLast("tres")

        deque.clear()

        assertTrue(deque.isEmpty())
        assertEquals(0, deque.size())
        assertNull(deque.peekFirst())
        assertNull(deque.peekLast())
    }
}
