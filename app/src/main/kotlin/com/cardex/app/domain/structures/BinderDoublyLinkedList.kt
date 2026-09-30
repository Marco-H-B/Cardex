package com.cardex.app.domain.structures

// Nodo que representa una hoja o página individual del Archivador Virtual 3x3.
// Cada nodo almacena un arreglo estático de 9 ranuras para cartas.
// Invariante de nodo: 0 <= cardCount <= PAGE_SIZE.
class BinderNode<T>(val pageIndex: Int) {
    companion object {
        const val PAGE_SIZE = 9
    }

    // Arreglo interno de tamaño fijo para las 9 cartas de la cuadrícula 3x3.
    @Suppress("UNCHECKED_CAST")
    private val slots: Array<Any?> = arrayOfNulls(PAGE_SIZE)

    var cardCount: Int = 0
        internal set

    var prev: BinderNode<T>? = null
        internal set

    var next: BinderNode<T>? = null
        internal set

    // Retorna true si la página ya contiene las 9 cartas.
    fun isFull(): Boolean = cardCount == PAGE_SIZE

    // Retorna true si la página no contiene ninguna carta.
    fun isEmpty(): Boolean = cardCount == 0

    // Obtiene la carta ubicada en un bolsillo específico (0 a 8).
    @Suppress("UNCHECKED_CAST")
    fun getCard(slotIndex: Int): T? {
        if (slotIndex !in 0 until PAGE_SIZE) {
            throw IndexOutOfBoundsException("Bolsillo inválido: $slotIndex. Debe estar entre 0 y ${PAGE_SIZE - 1}.")
        }

        return slots[slotIndex] as T?
    }

    // Coloca una carta en una ranura específica e incrementa o decrementa el contador según corresponda.
    internal fun setCard(slotIndex: Int, card: T?) {
        if (slotIndex !in 0 until PAGE_SIZE) {
            throw IndexOutOfBoundsException("Bolsillo inválido: $slotIndex. Debe estar entre 0 y ${PAGE_SIZE - 1}.")
        }

        val previous = slots[slotIndex]

        if (previous == null && card != null) {
            cardCount++
        } else if (previous != null && card == null) {
            cardCount--
        }

        slots[slotIndex] = card
    }

    // Retorna un arreglo con las 9 ranuras para renderizar en Jetpack Compose.
    @Suppress("UNCHECKED_CAST")
    fun getCards(): Array<T?> {
        val result = arrayOfNulls<Any?>(PAGE_SIZE)
        System.arraycopy(slots, 0, result, 0, PAGE_SIZE)

        return result as Array<T?>
    }

    // Limpia todas las referencias del nodo para el Garbage Collector.
    internal fun clear() {
        slots.fill(null)
        cardCount = 0
        prev = null
        next = null
    }
}

// Lista Doblemente Enlazada que gestiona las páginas del Archivador Virtual 3x3.
// Diseñada para evitar caídas de cuadros (jank) y fugas de memoria (memory leaks).
//
// Invariantes de Memoria:
// - totalPages == ceil(totalCards / 9) (0 si totalCards == 0).
// - Si totalPages == 0: head == null, tail == null, currentPage == null.
// - Navegación entre páginas adyacentes (nextPage / previousPage) en O(1) tiempo constante.
// - Liberación estricta de referencias en clear() para evitar retención en el Garbage Collector.
class BinderDoublyLinkedList<T> {

    companion object {
        const val PAGE_SIZE = BinderNode.PAGE_SIZE
    }

    private var head: BinderNode<T>? = null
    private var tail: BinderNode<T>? = null
    private var currentPage: BinderNode<T>? = null
    private var totalCards: Int = 0
    private var totalPages: Int = 0

    // Retorna la cantidad total de cartas almacenadas en todo el archivador.
    fun totalCards(): Int {
        return totalCards
    }

    // Retorna la cantidad total de páginas instanciadas.
    fun totalPages(): Int {
        return totalPages
    }

    // Retorna true si el archivador no contiene ninguna carta.
    fun isEmpty(): Boolean {
        return totalCards == 0
    }

    // Retorna el nodo de la página actualmente visible en la interfaz de usuario.
    fun getCurrentPage(): BinderNode<T>? {
        return currentPage
    }

    // Retorna la primera página del archivador (head).
    fun getHead(): BinderNode<T>? {
        return head
    }

    // Retorna la última página del archivador (tail).
    fun getTail(): BinderNode<T>? {
        return tail
    }

    // Inserta una carta al final de la colección.
    // Si la lista está vacía o la última página está llena, debe crear una nueva página enlazada.
    fun appendCard(card: T) {
        if (head == null) {
            val newNode = BinderNode<T>(0)

            head = newNode
            tail = newNode
            currentPage = newNode

            totalPages++
        } else {
            if (tail!!.isFull()) {
                val newNode = BinderNode<T>(totalPages)

                tail!!.next = newNode
                newNode.prev = tail
                tail = newNode
                totalPages++
            }
        }

        // Inserta la carta en el tail
        tail!!.setCard(tail!!.cardCount, card)
        totalCards++
    }

    // Desplaza la página activa a la siguiente (página i + 1) en O(1).
    // Retorna true si avanzó con éxito, o false si ya se encuentra en la última página (tail) o no hay páginas.
    fun nextPage(): Boolean {
        if (currentPage?.next != null) {
            currentPage = currentPage!!.next
            return true
        } else {
            return false
        }
    }

    // Desplaza la página activa a la anterior (página i - 1) en O(1).
    // Retorna true si retrocedió con éxito, o false si ya se encuentra en la primera página (head) o no hay páginas.
    fun previousPage(): Boolean {
        if (currentPage?.prev != null) {
            currentPage = currentPage!!.prev
            return true
        } else {
            return false
        }
    }

    // Busca y retorna una página dado su índice numérico (0 .. totalPages - 1).
    // Optimización asintótica: Si el índice está en la primera mitad, recorre desde head hacia adelante.
    // Si está en la segunda mitad, recorre desde tail hacia atrás.
    fun getPage(index: Int): BinderNode<T> {
        if (index !in 0 until totalPages) {
            throw IndexOutOfBoundsException ("Índice de página fuera de rango: $index")
        }

        if (index < totalPages / 2) {
            var current = head

            for (i in 0 until index) {
                current = current!!.next
            }

            return current!!
        } else {
            var current = tail
            val steps = (totalPages - 1) - index

            for (i in 0 until steps) {
                current = current!!.prev
            }

            return current!!
        }
    }

    // Vacía completamente el archivador, rompiendo los enlaces entre nodos y seteando referencias a null.
    // Crucial para evitar que el recolector de basura mantenga páginas en memoria viva.
    fun clear() {
        var current = head

        while (current != null) {
            val nextNode = current.next
            current.clear()
            current = nextNode
        }

        head = null
        tail = null
        currentPage = null
        totalCards = 0
        totalPages = 0
    }
}
