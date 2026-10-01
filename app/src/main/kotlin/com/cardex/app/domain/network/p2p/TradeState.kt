package com.cardex.app.domain.network.p2p

import java.util.UUID

// Estados finitos para el ciclo de vida del intercambio presencial P2P (CC311).
sealed class TradeState {
    data object Idle : TradeState()
    data class Connected(val peerAddress: String) : TradeState()
    data class OfferSent(val peerAddress: String, val offeredCardUuid: UUID) : TradeState()
    data class OfferReceived(val peerAddress: String, val receivedCardUuid: UUID) : TradeState()
    data class Accepted(
        val peerAddress: String,
        val offeredCardUuid: UUID?,
        val receivedCardUuid: UUID?
    ) : TradeState()
    data class Committing(
        val peerAddress: String,
        val offeredCardUuid: UUID?,
        val receivedCardUuid: UUID?
    ) : TradeState()
    data class Completed(
        val peerAddress: String,
        val offeredCardUuid: UUID?,
        val receivedCardUuid: UUID?
    ) : TradeState()
    data class Aborted(val reason: String) : TradeState()
}
