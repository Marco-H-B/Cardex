package com.cardex.app.presentation.marketplace

import com.cardex.app.domain.model.MarketFilter
import com.cardex.app.domain.model.MarketListing

// Estado inmutable de la interfaz de usuario del Marketplace.
data class MarketplaceUiState(
    val listings: List<MarketListing> = emptyList(),
    val isLoading: Boolean = false,
    val filter: MarketFilter = MarketFilter(),
    val reservedListing: MarketListing? = null,
    val reservationRemainingSeconds: Int = 0,
    val reservationMessage: String? = null,
    val isCheckingOut: Boolean = false,
    val checkoutSuccess: Boolean = false,
    val errorMessage: String? = null
)
