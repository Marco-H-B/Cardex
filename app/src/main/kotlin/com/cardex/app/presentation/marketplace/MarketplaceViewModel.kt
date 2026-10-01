package com.cardex.app.presentation.marketplace

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cardex.app.domain.model.MarketFilter
import com.cardex.app.domain.model.MarketListing
import com.cardex.app.domain.repository.MarketplaceRepository
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

// ViewModel del Marketplace con gestión de filtros reactivos y temporizador de candado pesimista.
class MarketplaceViewModel(
    private val marketplaceRepository: MarketplaceRepository,
    private val currentUserId: String = "marco-hb-active-buyer"
) : ViewModel() {

    private val _uiState = MutableStateFlow(MarketplaceUiState(isLoading = true))
    val uiState: StateFlow<MarketplaceUiState> = _uiState.asStateFlow()

    private var listingsJob: Job? = null
    private var timerJob: Job? = null

    init {
        loadListings()
    }

    fun onSearchQueryChanged(newQuery: String) {
        val updatedFilter = _uiState.value.filter.copy(query = newQuery)
        _uiState.update { it.copy(filter = updatedFilter) }
        loadListings()
    }

    fun onWearTierSelected(tier: String?) {
        val updatedFilter = _uiState.value.filter.copy(selectedWearTier = tier)
        _uiState.update { it.copy(filter = updatedFilter) }
        loadListings()
    }

    fun onCardTypeSelected(type: String?) {
        val updatedFilter = _uiState.value.filter.copy(cardType = type)
        _uiState.update { it.copy(filter = updatedFilter) }
        loadListings()
    }

    fun reserveListing(listing: MarketListing) {
        viewModelScope.launch {
            _uiState.update { it.copy(isCheckingOut = true, errorMessage = null) }
            val result = marketplaceRepository.reserveCard(listing.id, currentUserId)
            if (result.success) {
                _uiState.update {
                    it.copy(
                        reservedListing = listing,
                        reservationRemainingSeconds = 300, // 5 minutos exactos
                        reservationMessage = result.message,
                        isCheckingOut = false
                    )
                }
                startReservationCountdown()
            } else {
                _uiState.update {
                    it.copy(
                        isCheckingOut = false,
                        errorMessage = result.message
                    )
                }
            }
        }
    }

    fun cancelReservation() {
        val reserved = _uiState.value.reservedListing ?: return
        viewModelScope.launch {
            timerJob?.cancel()
            marketplaceRepository.cancelReservation(reserved.id, currentUserId)
            _uiState.update {
                it.copy(
                    reservedListing = null,
                    reservationRemainingSeconds = 0,
                    reservationMessage = null
                )
            }
        }
    }

    fun payWithMercadoPago() {
        val reserved = _uiState.value.reservedListing ?: return
        viewModelScope.launch {
            _uiState.update { it.copy(isCheckingOut = true) }
            // Simulación de respuesta de checkout tokenizado de Mercado Pago
            delay(1000)
            val confirmed = marketplaceRepository.confirmPurchase(
                listingId = reserved.id,
                buyerId = currentUserId,
                paymentId = "MP-PAY-${System.currentTimeMillis()}"
            )
            timerJob?.cancel()
            if (confirmed) {
                _uiState.update {
                    it.copy(
                        isCheckingOut = false,
                        checkoutSuccess = true,
                        reservedListing = null,
                        reservationRemainingSeconds = 0
                    )
                }
            } else {
                _uiState.update {
                    it.copy(
                        isCheckingOut = false,
                        errorMessage = "No se pudo confirmar el pago con Mercado Pago."
                    )
                }
            }
        }
    }

    fun dismissSuccessMessage() {
        _uiState.update { it.copy(checkoutSuccess = false) }
    }

    fun dismissErrorMessage() {
        _uiState.update { it.copy(errorMessage = null) }
    }

    private fun startReservationCountdown() {
        timerJob?.cancel()
        timerJob = viewModelScope.launch {
            while (_uiState.value.reservationRemainingSeconds > 0) {
                delay(1000)
                _uiState.update {
                    it.copy(reservationRemainingSeconds = it.reservationRemainingSeconds - 1)
                }
            }
            // Si el tiempo llegó a 0 sin pagar, liberar la carta automáticamente
            val expired = _uiState.value.reservedListing
            if (expired != null) {
                marketplaceRepository.cancelReservation(expired.id, currentUserId)
                _uiState.update {
                    it.copy(
                        reservedListing = null,
                        errorMessage = "El tiempo de reserva de 5 minutos ha expirado. La carta está disponible nuevamente."
                    )
                }
            }
        }
    }

    private fun loadListings() {
        listingsJob?.cancel()
        val currentFilter = _uiState.value.filter
        listingsJob = marketplaceRepository.getListings(currentFilter)
            .onEach { items ->
                _uiState.update { it.copy(listings = items, isLoading = false) }
            }
            .launchIn(viewModelScope)
    }

    override fun onCleared() {
        super.onCleared()
        timerJob?.cancel()
        listingsJob?.cancel()
    }
}
