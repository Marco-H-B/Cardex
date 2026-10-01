package com.cardex.app.data.repository

import com.cardex.app.domain.model.MarketFilter
import com.cardex.app.domain.model.MarketListing
import com.cardex.app.domain.model.MarketListingStatus
import com.cardex.app.domain.model.ReservationResult
import com.cardex.app.domain.repository.MarketplaceRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import java.util.UUID

// Implementación del repositorio de Marketplace con control de concurrencia pesimista (CC202 / Neon RPC).
class MarketplaceRepositoryImpl(
    initialListings: List<MarketListing> = defaultMarketplaceListings()
) : MarketplaceRepository {

    private val mutex = Mutex()
    private val listingsFlow = MutableStateFlow(initialListings)

    override fun getListings(filter: MarketFilter): Flow<List<MarketListing>> {
        return listingsFlow.asStateFlow().map { list ->
            val now = System.currentTimeMillis()
            list.map { listing ->
                // Expiración automática del candado temporal de 5 minutos si no se pagó
                if (listing.status == MarketListingStatus.RESERVED &&
                    listing.reservedUntilEpochMillis != null &&
                    listing.reservedUntilEpochMillis < now
                ) {
                    listing.copy(
                        status = MarketListingStatus.AVAILABLE,
                        reservedBy = null,
                        reservedUntilEpochMillis = null
                    )
                } else {
                    listing
                }
            }.filter { item ->
                val matchesTier = filter.selectedWearTier == null ||
                        item.wearTier.equals(filter.selectedWearTier, ignoreCase = true)
                val matchesType = filter.cardType == null ||
                        item.cardType.equals(filter.cardType, ignoreCase = true)
                val matchesMinPrice = filter.minPrice == null || item.pricePen >= filter.minPrice
                val matchesMaxPrice = filter.maxPrice == null || item.pricePen <= filter.maxPrice
                val matchesQuery = filter.query.isBlank() ||
                        item.cardName.contains(filter.query, ignoreCase = true) ||
                        (item.setName?.contains(filter.query, ignoreCase = true) == true) ||
                        (item.cardNumber?.contains(filter.query, ignoreCase = true) == true)

                matchesTier && matchesType && matchesMinPrice && matchesMaxPrice && matchesQuery
            }
        }
    }

    override fun getListingById(listingId: String): Flow<MarketListing?> {
        return listingsFlow.asStateFlow().map { list ->
            list.firstOrNull { it.id == listingId }
        }
    }

    override suspend fun reserveCard(listingId: String, buyerId: String): ReservationResult {
        // Bloqueo pesimista concurrente análogo a 'SELECT ... FOR UPDATE' en PostgreSQL
        return mutex.withLock {
            val now = System.currentTimeMillis()
            val currentList = listingsFlow.value
            val target = currentList.firstOrNull { it.id == listingId }
                ?: return@withLock ReservationResult(
                    success = false,
                    message = "El anuncio no existe en el catálogo del mercado."
                )

            // 1. Validar que el vendedor no se compre a sí mismo
            if (target.sellerId == buyerId) {
                return@withLock ReservationResult(
                    success = false,
                    message = "No puedes comprar tu propia carta."
                )
            }

            // 2. Comprobar si el candado previo expiró
            val isLockExpired = target.reservedUntilEpochMillis != null && target.reservedUntilEpochMillis < now
            val isAvailable = target.status == MarketListingStatus.AVAILABLE || isLockExpired

            if (!isAvailable) {
                return@withLock ReservationResult(
                    success = false,
                    message = "Esta carta ya ha sido reservada o vendida por otro coleccionista."
                )
            }

            // 3. Adquirir candado temporal por 5 minutos (300 segundos)
            val lockDurationMillis = 5 * 60 * 1000L
            val reservedUntil = now + lockDurationMillis

            val updatedTarget = target.copy(
                status = MarketListingStatus.RESERVED,
                reservedBy = buyerId,
                reservedUntilEpochMillis = reservedUntil
            )

            listingsFlow.value = currentList.map {
                if (it.id == listingId) updatedTarget else it
            }

            ReservationResult(
                success = true,
                message = "Carta reservada con éxito por 5 minutos.",
                listingId = listingId,
                pricePen = target.pricePen,
                reservedUntilEpochMillis = reservedUntil
            )
        }
    }

    override suspend fun cancelReservation(listingId: String, buyerId: String): Boolean {
        return mutex.withLock {
            val currentList = listingsFlow.value
            val target = currentList.firstOrNull { it.id == listingId } ?: return@withLock false

            if (target.status != MarketListingStatus.RESERVED || target.reservedBy != buyerId) {
                return@withLock false
            }

            val released = target.copy(
                status = MarketListingStatus.AVAILABLE,
                reservedBy = null,
                reservedUntilEpochMillis = null
            )

            listingsFlow.value = currentList.map {
                if (it.id == listingId) released else it
            }
            true
        }
    }

    override suspend fun confirmPurchase(
        listingId: String,
        buyerId: String,
        paymentId: String
    ): Boolean {
        return mutex.withLock {
            val currentList = listingsFlow.value
            val target = currentList.firstOrNull { it.id == listingId } ?: return@withLock false

            if (target.status != MarketListingStatus.RESERVED || target.reservedBy != buyerId) {
                return@withLock false
            }

            val sold = target.copy(
                status = MarketListingStatus.SOLD,
                reservedBy = null,
                reservedUntilEpochMillis = null
            )

            listingsFlow.value = currentList.map {
                if (it.id == listingId) sold else it
            }
            true
        }
    }

    companion object {
        fun defaultMarketplaceListings(): List<MarketListing> {
            return listOf(
                MarketListing(
                    id = "listing-001",
                    cardInstanceId = UUID.randomUUID().toString(),
                    cardName = "Charizard ex Holográfico",
                    cardType = "OFFICIAL",
                    setName = "151 Scarlet & Violet",
                    cardNumber = "#199/165",
                    rarity = "Special Illustration Rare",
                    conditionFloat = 0.008412903,
                    wearTier = "Mítico",
                    sellerId = "seller-prof-lara",
                    sellerName = "Prof. Lara Ávila",
                    pricePen = 480.00,
                    thumbnailUrl = ""
                ),
                MarketListing(
                    id = "listing-002",
                    cardInstanceId = UUID.randomUUID().toString(),
                    cardName = "Pikachu Illustrator (Réplica Oficial)",
                    cardType = "OFFICIAL",
                    setName = "CoroCoro Comics Promo",
                    cardNumber = "#000/Promo",
                    rarity = "Santo Grial",
                    conditionFloat = 0.012500000,
                    wearTier = "Mítico",
                    sellerId = "seller-antonio-hb",
                    sellerName = "Antonio Huamani",
                    pricePen = 1250.00,
                    thumbnailUrl = ""
                ),
                MarketListing(
                    id = "listing-003",
                    cardInstanceId = UUID.randomUUID().toString(),
                    cardName = "Dragón Titán Quimera",
                    cardType = "GENERIC",
                    setName = "Colección Personal Marco",
                    cardNumber = "#GEN-007",
                    rarity = "Ultra",
                    conditionFloat = 0.158204910,
                    wearTier = "Épico",
                    sellerId = "seller-marco-hb",
                    sellerName = "Marco H.B.",
                    pricePen = 65.00,
                    thumbnailUrl = ""
                ),
                MarketListing(
                    id = "listing-004",
                    cardInstanceId = UUID.randomUUID().toString(),
                    cardName = "Gengar Holo",
                    cardType = "OFFICIAL",
                    setName = "Fossil",
                    cardNumber = "#020/062",
                    rarity = "Rare Holo",
                    conditionFloat = 0.421800100,
                    wearTier = "Raro",
                    sellerId = "seller-ronald-martinez",
                    sellerName = "Prof. Ronald Martínez",
                    pricePen = 95.00,
                    thumbnailUrl = ""
                ),
                MarketListing(
                    id = "listing-005",
                    cardInstanceId = UUID.randomUUID().toString(),
                    cardName = "Guerrero Espectral Cibernético",
                    cardType = "GENERIC",
                    setName = "Cartas Genéricas Ate",
                    cardNumber = "#GEN-042",
                    rarity = "Común",
                    conditionFloat = 0.684000120,
                    wearTier = "Común",
                    sellerId = "seller-jenry-hb",
                    sellerName = "Tío Jenry H.B.",
                    pricePen = 18.50,
                    thumbnailUrl = ""
                ),
                MarketListing(
                    id = "listing-006",
                    cardInstanceId = UUID.randomUUID().toString(),
                    cardName = "Mewtwo Antiguo",
                    cardType = "OFFICIAL",
                    setName = "Base Set 2",
                    cardNumber = "#010/130",
                    rarity = "Holo Rare",
                    conditionFloat = 0.892019482,
                    wearTier = "Dañado",
                    sellerId = "seller-cesar-lara",
                    sellerName = "César L.",
                    pricePen = 35.00,
                    thumbnailUrl = ""
                )
            )
        }
    }
}
