package com.cardex.app.domain.structures

// Double-Ended Queue genérica basada en un arreglo circular dinámico.
// Diseñada para el motor de sincronización asíncrona de Cardex.
// Invariantes de Memoria:
// - 0 <= size <= capacity
// - Inserciones y extracciones en O(1) tiempo constante amortizado.
// - Toda referencia descartada debe ser seteada a null para evitar fugas de memoria (memory leaks).
class SyncDeque<T>(initialCapacity: Int = DEFAULT_CAPACITY) {

    companion object {
        const val DEFAULT_CAPACITY = 32
    }

    private var capacity: Int = if (initialCapacity > 0) initialCapacity else DEFAULT_CAPACITY
    private var elements: Array<Any?> = arrayOfNulls(capacity)
    private var front: Int = 0
    private var rear: Int = 0
    private var size: Int = 0

    // Inserta un elemento en el extremo frontal del arreglo circular.
    fun addFirst(element: T) {
        if (size + 1 > capacity) {
            resize()
        }

        front = (front - 1 + capacity) % capacity
        elements[front] = element

        size++
    }

    // Inserta un elemento en el extremo trasero del arreglo circular.
    fun addLast(element: T) {
        if (size + 1 > capacity) {
            resize()
        }

        elements[rear] = element
        rear = (rear + 1) % capacity

        size++
    }


    // Extrae y devuelve el elemento ubicado en el frente de la cola circular.
    @Suppress("UNCHECKED_CAST")
    fun removeFirst(): T {
        if (isEmpty()) {
            throw NoSuchElementException("SyncDeque está vacía")
        }

        val old = elements[front]
        elements[front] = null
        front = (front + 1) % capacity

        size--
        return old as T
    }

    // Extrae y devuelve el elemento ubicado en el fondo de la cola circular.
    @Suppress("UNCHECKED_CAST")
    fun removeLast(): T {
        if (isEmpty()) {
            throw NoSuchElementException("SyncDeque está vacía")
        }

        rear = (rear - 1 + capacity) % capacity
        val old = elements[rear]
        elements[rear] = null

        size--
        return old as T
    }

    // Consulta el elemento frontal sin extraerlo. Retorna null si la cola está vacía.
    @Suppress("UNCHECKED_CAST")
    fun peekFirst(): T? {
        if (isEmpty()) {
            return null
        }

        return elements[front] as T
    }

    // Consulta el elemento del fondo sin extraerlo. Retorna null si la cola está vacía.
    @Suppress("UNCHECKED_CAST")
    fun peekLast(): T? {
        if (isEmpty()) {
            return null
        }

        val lastIndex = (rear - 1 + capacity) % capacity

        return elements[lastIndex] as T
    }

    // Retorna true si la estructura no contiene elementos.
    fun isEmpty(): Boolean {
        return size == 0
    }

    // Retorna la cantidad actual de elementos encolados.
    fun size(): Int {
        return size
    }

    // Retorna la capacidad total asignada actualmente en el arreglo interno.
    fun capacity(): Int {
        return capacity
    }

    // Vacía completamente la cola circular, seteando todas las casillas a null y reiniciando punteros para evitar retención de memoria.
    fun clear() {
        elements.fill(null)

        front = 0
        rear = 0
        size = 0
    }

    // Duplica la capacidad del arreglo y desenrolla los elementos en orden continuo desde el índice 0.
    private fun resize() {
        val newCapacity = capacity * 2
        val newElements = arrayOfNulls<Any>(newCapacity)

        for (i in 0 until size) {
            newElements[i] = elements[(front + i) % capacity]
        }

        elements = newElements
        front = 0
        rear = size
        capacity = newCapacity
    }
}
