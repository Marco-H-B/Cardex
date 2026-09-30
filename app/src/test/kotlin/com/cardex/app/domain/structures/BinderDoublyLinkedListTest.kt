package com.cardex.app.domain.structures

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

// Pruebas unitarias TDD para BinderDoublyLinkedList.
// Valida invariantes de capacidad, paginación dinámica, navegación bidireccional y memoria limpia.
class BinderDoublyLinkedListTest {

    private lateinit var binder: BinderDoublyLinkedList<String>

    @Before
    fun setUp() {
        binder = BinderDoublyLinkedList()
    }

    @Test
    fun `archivador recien creado debe estar vacio con metricas en cero y punteros nulos`() {
        assertTrue(binder.isEmpty())
        assertEquals(0, binder.totalCards())
        assertEquals(0, binder.totalPages())
        assertNull(binder.getCurrentPage())
        assertNull(binder.getHead())
        assertNull(binder.getTail())
    }

    @Test
    fun `appendCard en archivador vacio debe crear la primera pagina y colocar carta en bolsillo 0`() {
        binder.appendCard("Pikachu_BaseSet_001")

        assertFalse(binder.isEmpty())
        assertEquals(1, binder.totalCards())
        assertEquals(1, binder.totalPages())

        val head = binder.getHead()
        assertNotNull(head)
        assertSame(head, binder.getTail())
        assertSame(head, binder.getCurrentPage())

        assertEquals(0, head!!.pageIndex)
        assertEquals(1, head.cardCount)
        assertFalse(head.isFull())
        assertFalse(head.isEmpty())
        assertEquals("Pikachu_BaseSet_001", head.getCard(0))
        assertNull(head.getCard(1))
        assertNull(head.prev)
        assertNull(head.next)
    }

    @Test
    fun `appendCard hasta 9 cartas debe llenar la primera pagina sin instanciar una segunda`() {
        for (i in 0 until 9) {
            binder.appendCard("Card_$i")
        }

        assertEquals(9, binder.totalCards())
        assertEquals(1, binder.totalPages())

        val head = binder.getHead()!!
        assertTrue(head.isFull())
        assertEquals(9, head.cardCount)
        assertEquals("Card_0", head.getCard(0))
        assertEquals("Card_8", head.getCard(8))
        assertNull(head.next)
    }

    @Test
    fun `appendCard con la carta 10 debe crear dinamicamente la segunda pagina y enlazarla bidireccionalmente`() {
        for (i in 0 until 9) {
            binder.appendCard("Card_$i")
        }
        // Carta número 10 (desborda a la página 1)
        binder.appendCard("Card_9")

        assertEquals(10, binder.totalCards())
        assertEquals(2, binder.totalPages())

        val page0 = binder.getHead()!!
        val page1 = binder.getTail()!!

        assertEquals(0, page0.pageIndex)
        assertEquals(1, page1.pageIndex)

        // Verificación de enlaces bidireccionales
        assertSame(page1, page0.next)
        assertSame(page0, page1.prev)
        assertNull(page0.prev)
        assertNull(page1.next)

        // Contenidos de las páginas
        assertTrue(page0.isFull())
        assertEquals(9, page0.cardCount)
        assertEquals(1, page1.cardCount)
        assertFalse(page1.isFull())
        assertEquals("Card_9", page1.getCard(0))
    }

    @Test
    fun `appendCard con 18 cartas debe completar exactamente 2 paginas llenas`() {
        for (i in 0 until 18) {
            binder.appendCard("Card_$i")
        }

        assertEquals(18, binder.totalCards())
        assertEquals(2, binder.totalPages())

        val page0 = binder.getHead()!!
        val page1 = binder.getTail()!!

        assertTrue(page0.isFull())
        assertTrue(page1.isFull())
        assertEquals("Card_17", page1.getCard(8))
    }

    @Test
    fun `appendCard con 177 cartas reales debe distribuir en 20 paginas exactas con 6 cartas en la ultima`() {
        // Tu inventario físico real: 177 cartas = 19 páginas x 9 cartas (171) + 1 página x 6 cartas
        for (i in 1..177) {
            binder.appendCard("RealCard_$i")
        }

        assertEquals(177, binder.totalCards())
        assertEquals(20, binder.totalPages())

        val lastPage = binder.getTail()!!
        assertEquals(19, lastPage.pageIndex)
        assertEquals(6, lastPage.cardCount)
        assertFalse(lastPage.isFull())
        assertEquals("RealCard_177", lastPage.getCard(5))
        assertNull(lastPage.getCard(6))
    }

    @Test
    fun `nextPage debe avanzar de pagina en pagina y retornar true hasta llegar a tail`() {
        for (i in 0 until 27) { // 3 páginas (índices 0, 1, 2)
            binder.appendCard("Card_$i")
        }

        assertEquals(0, binder.getCurrentPage()!!.pageIndex)

        // Avanzar a página 1
        assertTrue(binder.nextPage())
        assertEquals(1, binder.getCurrentPage()!!.pageIndex)

        // Avanzar a página 2 (tail)
        assertTrue(binder.nextPage())
        assertEquals(2, binder.getCurrentPage()!!.pageIndex)
        assertSame(binder.getTail(), binder.getCurrentPage())

        // Intentar avanzar más allá de tail
        assertFalse(binder.nextPage())
        assertEquals(2, binder.getCurrentPage()!!.pageIndex)
    }

    @Test
    fun `nextPage en lista vacia debe retornar false de forma segura`() {
        assertFalse(binder.nextPage())
        assertNull(binder.getCurrentPage())
    }

    @Test
    fun `previousPage debe retroceder de pagina en pagina y retornar true hasta llegar a head`() {
        for (i in 0 until 27) { // 3 páginas
            binder.appendCard("Card_$i")
        }

        // Navegamos hasta la última página
        binder.nextPage()
        binder.nextPage()
        assertEquals(2, binder.getCurrentPage()!!.pageIndex)

        // Retroceder a página 1
        assertTrue(binder.previousPage())
        assertEquals(1, binder.getCurrentPage()!!.pageIndex)

        // Retroceder a página 0 (head)
        assertTrue(binder.previousPage())
        assertEquals(0, binder.getCurrentPage()!!.pageIndex)
        assertSame(binder.getHead(), binder.getCurrentPage())

        // Intentar retroceder antes de head
        assertFalse(binder.previousPage())
        assertEquals(0, binder.getCurrentPage()!!.pageIndex)
    }

    @Test
    fun `previousPage en lista vacia debe retornar false de forma segura`() {
        assertFalse(binder.previousPage())
        assertNull(binder.getCurrentPage())
    }

    @Test
    fun `getPage debe retornar el nodo correcto optimizando busqueda desde head o tail`() {
        for (i in 0 until 45) { // 5 páginas (índices 0, 1, 2, 3, 4)
            binder.appendCard("Card_$i")
        }

        // Primera mitad (búsqueda desde head)
        val p0 = binder.getPage(0)
        assertEquals(0, p0.pageIndex)
        assertSame(binder.getHead(), p0)

        val p1 = binder.getPage(1)
        assertEquals(1, p1.pageIndex)

        // Segunda mitad (búsqueda desde tail)
        val p3 = binder.getPage(3)
        assertEquals(3, p3.pageIndex)

        val p4 = binder.getPage(4)
        assertEquals(4, p4.pageIndex)
        assertSame(binder.getTail(), p4)
    }

    @Test(expected = IndexOutOfBoundsException::class)
    fun `getPage con indice negativo debe lanzar IndexOutOfBoundsException`() {
        binder.appendCard("Card_1")
        binder.getPage(-1)
    }

    @Test(expected = IndexOutOfBoundsException::class)
    fun `getPage con indice igual o mayor a totalPages debe lanzar IndexOutOfBoundsException`() {
        binder.appendCard("Card_1") // totalPages = 1
        binder.getPage(1)
    }

    @Test
    fun `clear debe desconectar todos los nodos anular referencias y reiniciar contadores`() {
        for (i in 0 until 20) {
            binder.appendCard("Card_$i")
        }

        val headNode = binder.getHead()!!

        binder.clear()

        assertTrue(binder.isEmpty())
        assertEquals(0, binder.totalCards())
        assertEquals(0, binder.totalPages())
        assertNull(binder.getCurrentPage())
        assertNull(binder.getHead())
        assertNull(binder.getTail())

        // Verificar que el nodo interno quedó limpio sin retención de memoria
        assertTrue(headNode.isEmpty())
        assertNull(headNode.prev)
        assertNull(headNode.next)
    }

    @Test
    fun `navegacion de ida y vuelta completa debe mantener consistencia de referencias`() {
        for (i in 0 until 36) { // 4 páginas
            binder.appendCard("Card_$i")
        }

        // Ida (head -> tail)
        for (page in 0 until 3) {
            assertEquals(page, binder.getCurrentPage()!!.pageIndex)
            assertTrue(binder.nextPage())
        }
        assertEquals(3, binder.getCurrentPage()!!.pageIndex)

        // Vuelta (tail -> head)
        for (page in 3 downTo 1) {
            assertEquals(page, binder.getCurrentPage()!!.pageIndex)
            assertTrue(binder.previousPage())
        }
        assertEquals(0, binder.getCurrentPage()!!.pageIndex)
    }
}
