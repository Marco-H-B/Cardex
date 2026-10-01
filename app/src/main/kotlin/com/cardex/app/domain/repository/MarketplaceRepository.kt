package com.cardex.app.domain.repository

import com.cardex.app.domain.model.MarketFilter
import com.cardex.app.domain.model.MarketListing
import com.cardex.app.domain.model.ReservationResult
import kotlinx.coroutines.flow.Flow

// Interfaz del Repositorio de Marketplace para compras C2C con bloqueo concurrente.
interface MarketplaceRepository {

    // Retorna el flujo continuo de publicaciones activas filtradas.
    fun getListings(filter: MarketFilter = MarketFilter()): Flow<List<MarketListing>>

    // Obtiene una publicación específica por su ID.
    fun getListingById(listingId: String): Flow<MarketListing?>

    // Ejecuta la reserva pesimista con candado de 5 minutos mediante RPC (SELECT ... FOR UPDATE).
    suspend fun reserveCard(listingId: String, buyerId: String): ReservationResult

    // Cancela una reserva activa y libera la carta a estado AVAILABLE.
    suspend fun cancelReservation(listingId: String, buyerId: String): Boolean

    // Confirma la compra tras la aprobación del pago en Mercado Pago y transfiere la carta a estado SOLD.
    suspend fun confirmPurchase(listingId: String, buyerId: String, paymentId: String): Boolean
}
