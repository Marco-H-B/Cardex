package com.cardex.app.data.repository

import com.cardex.app.data.local.dao.CardDao
import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.repository.CardRepository
import kotlinx.coroutines.flow.Flow

// Implementación del repositorio de cartas en la capa de Datos (Clean Architecture).
// Coordina el acceso a la base de datos Room SQLite.
class CardRepositoryImpl(
    private val cardDao: CardDao
) : CardRepository {

    override fun getAllCards(): Flow<List<CardEntity>> {
        return cardDao.getAllCards()
    }

    override fun getCardById(id: String): Flow<CardEntity?> {
        return cardDao.getCardById(id)
    }

    override suspend fun saveCard(card: CardEntity) {
        cardDao.insertCard(card)
    }

    override suspend fun deleteCard(id: String) {
        cardDao.deleteCardById(id)
    }

    override suspend fun getPendingSyncCards(): List<CardEntity> {
        return cardDao.getPendingSyncCards()
    }
}
