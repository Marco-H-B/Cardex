package com.cardex.app.presentation.p2p

import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.domain.network.p2p.TradeState

// Estado de la interfaz para el intercambio presencial P2P (CC311).
data class P2PTradeUiState(
    val isHost: Boolean = true,
    val peerIpInput: String = "192.168.49.1",
    val tradeState: TradeState = TradeState.Idle,
    val localCards: List<CardEntity> = emptyList(),
    val selectedLocalCard: CardEntity? = null,
    val remoteCardName: String? = null,
    val isTransferring: Boolean = false,
    val progressMessage: String? = null
)
