package com.cardex.app.domain.repository

import com.cardex.app.data.local.entity.CardEntity
import kotlinx.coroutines.flow.Flow

// Contrato de repositorio en la capa de Dominio (Clean Architecture).
// Define las operaciones sobre el catálogo de cartas sin acoplarse a detalles de infraestructura.
interface CardRepository {
    fun getAllCards(): Flow<List<CardEntity>>
    fun getCardById(id: String): Flow<CardEntity?>
    suspend fun saveCard(card: CardEntity)
    suspend fun deleteCard(id: String)
    suspend fun getPendingSyncCards(): List<CardEntity>
}
