package com.cardex.app.domain.model

// Estado del anuncio de venta en el mercado con bloqueo pesimista.
enum class MarketListingStatus {
    AVAILABLE,
    RESERVED,
    SOLD,
    CANCELLED
}

// Modelo de dominio para un listado de carta en el Marketplace.
data class MarketListing(
    val id: String,
    val cardInstanceId: String,
    val cardName: String,
    val cardType: String, // 'OFFICIAL' o 'GENERIC'
    val setName: String? = null,
    val cardNumber: String? = null,
    val rarity: String? = null,
    val conditionFloat: Double,
    val wearTier: String, // Mítico, Épico, Raro, Común, Dañado
    val sellerId: String,
    val sellerName: String,
    val pricePen: Double,
    val status: MarketListingStatus = MarketListingStatus.AVAILABLE,
    val reservedBy: String? = null,
    val reservedUntilEpochMillis: Long? = null,
    val thumbnailUrl: String,
    val frontHdUrl: String? = null,
    val backHdUrl: String? = null,
    val createdAtEpochMillis: Long = System.currentTimeMillis()
) {
    val isAvailable: Boolean get() = status == MarketListingStatus.AVAILABLE
    val isReserved: Boolean get() = status == MarketListingStatus.RESERVED
    val isSold: Boolean get() = status == MarketListingStatus.SOLD
}

// Filtros para la búsqueda y exploración en el Marketplace.
data class MarketFilter(
    val selectedWearTier: String? = null, // null para todos
    val cardType: String? = null, // 'OFFICIAL', 'GENERIC' o null para todos
    val minPrice: Double? = null,
    val maxPrice: Double? = null,
    val query: String = ""
)

// Resultado de la operación RPC de reserva con candado de 5 minutos.
data class ReservationResult(
    val success: Boolean,
    val message: String,
    val listingId: String? = null,
    val pricePen: Double? = null,
    val reservedUntilEpochMillis: Long? = null
)
