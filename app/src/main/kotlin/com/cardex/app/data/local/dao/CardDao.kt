package com.cardex.app.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.cardex.app.data.local.entity.CardEntity
import kotlinx.coroutines.flow.Flow

// Data Access Object (DAO) reactivo para operaciones CRUD sobre la tabla SQLite 'cards'.
@Dao
interface CardDao {

    // Retorna un flujo observable continuo (Flow) con todas las cartas ordenadas de más reciente a más antigua.
    @Query("SELECT * FROM cards ORDER BY createdAt DESC")
    fun getAllCards(): Flow<List<CardEntity>>

    // Retorna una carta por su UUID inmutable como flujo observable.
    @Query("SELECT * FROM cards WHERE id = :id LIMIT 1")
    fun getCardById(id: String): Flow<CardEntity?>

    // Inserta o actualiza una carta en la base de datos.
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCard(card: CardEntity)

    // Inserta una lista de cartas en una sola transacción atómica.
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCards(cards: List<CardEntity>)

    // Actualiza los datos de una carta existente.
    @Update
    suspend fun updateCard(card: CardEntity)

    // Elimina una carta física del registro local.
    @Delete
    suspend fun deleteCard(card: CardEntity)

    // Elimina una carta directamente por su identificador UUID.
    @Query("DELETE FROM cards WHERE id = :id")
    suspend fun deleteCardById(id: String)

    // Retorna la lista de cartas pendientes de sincronizar con Supabase (para alimentar el SyncDeque).
    @Query("SELECT * FROM cards WHERE isSynced = 0 ORDER BY createdAt ASC")
    suspend fun getPendingSyncCards(): List<CardEntity>

    // Retorna el conteo total de cartas escaneadas.
    @Query("SELECT COUNT(*) FROM cards")
    fun getCardCount(): Flow<Int>
}
