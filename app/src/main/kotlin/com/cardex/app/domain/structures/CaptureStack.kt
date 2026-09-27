package com.cardex.app.domain.structures

import com.cardex.app.domain.model.CapturedSide

// Pila de Captura de tamaño fijo para el flujo de escaneo de dos caras.
// Invariante: 0 <= size <= CAPACITY (CAPACITY = 2)
class CaptureStack {

    private val capacity = 2
    private val elements = arrayOfNulls<CapturedSide>(capacity)
    private var size = 0

    // Inserta una cara en el tope de la pila.
    fun push(item: CapturedSide) {
        if (isFull()) {
            throw IllegalStateException("CaptureStack está llena. Capacidad máxima: $capacity")
        }

        elements[size] = item
        size++
    }

    // Extrae y devuelve la cara en el tope de la pila.
    fun pop(): CapturedSide {
        if (isEmpty()) {
            throw NoSuchElementException("CaptureStack está vacía.")
        }

        size--
        val old = elements[size]!!
        elements[size] = null

        return old
    }

    // Devuelve la cara en el tope de la pila SIN retirarla.
    fun peek(): CapturedSide {
        if (isEmpty()) {
            throw NoSuchElementException("CaptureStack está vacía.")
        }

        return elements[size - 1]!!
    }

    // Retorna true si la pila no tiene elementos almacenados.
    fun isEmpty(): Boolean {
        return size == 0
    }

    // Retorna true si la pila alcanzó su capacidad máxima de 2 elementos.
    fun isFull(): Boolean {
        return size == capacity
    }

    // Retorna el número actual de elementos almacenados (0, 1 o 2).
    fun size(): Int {
        return size
    }

    // Vacía completamente la pila liberando todas las referencias a null.
    fun clear() {
        elements.fill(null)
        size = 0
    }
}
