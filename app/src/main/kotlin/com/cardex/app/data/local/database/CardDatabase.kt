package com.cardex.app.data.local.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.cardex.app.data.local.dao.CardDao
import com.cardex.app.data.local.entity.CardEntity

// Base de datos SQLite local administrada por Room.
// Garantiza transacciones ACID y verificación estricta de consultas en compilación.
@Database(
    entities = [CardEntity::class],
    version = 1,
    exportSchema = false
)
abstract class CardDatabase : RoomDatabase() {

    abstract fun cardDao(): CardDao

    companion object {
        private const val DATABASE_NAME = "cardex_database.db"

        @Volatile
        private var INSTANCE: CardDatabase? = null

        fun getInstance(context: Context): CardDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    CardDatabase::class.java,
                    DATABASE_NAME
                )
                    .fallbackToDestructiveMigration()
                    .build()
                INSTANCE = instance
                instance
            }
        }
    }
}
