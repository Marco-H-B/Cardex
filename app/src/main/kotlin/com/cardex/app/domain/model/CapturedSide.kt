package com.cardex.app.domain.model

// Representa una cara fotografiada temporalmente antes del procesamiento final.

data class CapturedSide(
    val side: CardSide, // anverso o reverso.
    val filePath: String, // Ruta absoluta temporal en el almacenamiento local del dispositivo.
    val timestamp: Long = System.currentTimeMillis(), // Marca de tiempo en milisegundos de la captura.
    val sharpnessScore: Float // \Puntaje de nitidez calculado por varianza del Laplaciano.
)
