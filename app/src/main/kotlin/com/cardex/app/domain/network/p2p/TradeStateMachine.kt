package com.cardex.app.domain.network.p2p

import java.util.UUID

// Máquina de estados determinista para el protocolo de intercambio presencial (CC311).
// Garantiza que ninguna carta cambie de estado ni dueño sin cumplir la secuencia estricta de OpCodes.
class TradeStateMachine {

    var currentState: TradeState = TradeState.Idle
        private set

    // Transición tras establecer la conexión TCP y validar OP_HELLO.
    fun onConnected(peerAddress: String) {
        check(currentState is TradeState.Idle) {
            "No se puede conectar desde el estado $currentState"
        }
        currentState = TradeState.Connected(peerAddress)
    }

    // Transición cuando el usuario local emite una oferta con su carta.
    fun onSendOffer(cardUuid: UUID) {
        val state = currentState
        check(state is TradeState.Connected) {
            "No se puede enviar oferta desde el estado $currentState"
        }
        currentState = TradeState.OfferSent(state.peerAddress, cardUuid)
    }

    // Transición cuando se recibe una oferta del par remoto por el socket TCP.
    fun onReceiveOffer(cardUuid: UUID) {
        val state = currentState
        check(state is TradeState.Connected) {
            "No se puede recibir oferta desde el estado $currentState"
        }
        currentState = TradeState.OfferReceived(state.peerAddress, cardUuid)
    }

    // Transición cuando ambas partes aceptan la oferta (OP_ACCEPT).
    fun onAccept() {
        currentState = when (val state = currentState) {
            is TradeState.OfferSent -> TradeState.Accepted(
                peerAddress = state.peerAddress,
                offeredCardUuid = state.offeredCardUuid,
                receivedCardUuid = null
            )
            is TradeState.OfferReceived -> TradeState.Accepted(
                peerAddress = state.peerAddress,
                offeredCardUuid = null,
                receivedCardUuid = state.receivedCardUuid
            )
            else -> error("No se puede aceptar el intercambio desde el estado $currentState")
        }
    }

    // Transición al iniciar el compromiso de transferencia atómica (OP_COMMIT tras escanear el QR presencial).
    fun onCommit() {
        val state = currentState
        check(state is TradeState.Accepted) {
            "No se puede iniciar commit desde el estado $currentState"
        }
        currentState = TradeState.Committing(
            peerAddress = state.peerAddress,
            offeredCardUuid = state.offeredCardUuid,
            receivedCardUuid = state.receivedCardUuid
        )
    }

    // Transición final cuando se recibe el acuse de recibo de persistencia exitosa (OP_ACK).
    fun onAcknowledge() {
        val state = currentState
        check(state is TradeState.Committing) {
            "No se puede confirmar intercambio desde el estado $currentState"
        }
        currentState = TradeState.Completed(
            peerAddress = state.peerAddress,
            offeredCardUuid = state.offeredCardUuid,
            receivedCardUuid = state.receivedCardUuid
        )
    }

    // Cancela la sesión inmediatamente y revierte cualquier bloqueo local.
    fun onAbort(reason: String) {
        currentState = TradeState.Aborted(reason)
    }

    // Reinicia la máquina a su estado inicial inactivo.
    fun reset() {
        currentState = TradeState.Idle
    }
}
