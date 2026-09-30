package com.cardex.app.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

// Entidad Room que modela una carta coleccionable almacenada en SQLite local.
// Optimizada para consultas instantáneas en el Archivador 3x3 y sincronización en segundo plano.
@Entity(
    tableName = "cards",
    indices = [
        Index(value = ["catalogId"]),
        Index(value = ["createdAt"]),
        Index(value = ["isSynced"])
    ]
)
data class CardEntity(
    @PrimaryKey
    val id: String,
    val catalogId: String? = null,
    val name: String,
    val setName: String? = null,
    val cardNumber: String? = null,
    val rarity: String? = null,
    val frontThumbnailPath: String,
    val backThumbnailPath: String,
    val frontHdPath: String,
    val backHdPath: String,
    val conditionFloat: Double? = null,
    val conditionGrade: String? = null,
    val createdAt: Long = System.currentTimeMillis(),
    val isSynced: Boolean = false
)
