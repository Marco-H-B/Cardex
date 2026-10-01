package com.cardex.app.presentation.p2p

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cardex.app.data.local.entity.CardEntity
import com.cardex.app.data.network.p2p.CardexP2PSocketManager
import com.cardex.app.data.network.p2p.CardexSyncService
import com.cardex.app.domain.network.p2p.TradeState
import com.cardex.app.domain.repository.CardRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.util.UUID

// ViewModel para gestionar el ciclo de vida del intercambio P2P local (CC311).
class P2PTradeViewModel(
    private val cardRepository: CardRepository,
    customSocketManager: CardexP2PSocketManager? = null
) : ViewModel() {

    private val socketManager: CardexP2PSocketManager = customSocketManager ?: CardexP2PSocketManager(viewModelScope)

    private val _uiState = MutableStateFlow(P2PTradeUiState())
    val uiState: StateFlow<P2PTradeUiState> = _uiState.asStateFlow()

    init {
        // Cargar cartas del inventario local de Marco para ofrecer
        cardRepository.getAllCards()
            .onEach { cards ->
                _uiState.update { it.copy(localCards = cards) }
            }
            .launchIn(viewModelScope)

        // Observar transiciones de la máquina de estados del socket
        this.socketManager.tradeState
            .onEach { state ->
                _uiState.update { it.copy(tradeState = state) }
            }
            .launchIn(viewModelScope)
    }

    fun setHostMode(isHost: Boolean) {
        _uiState.update { it.copy(isHost = isHost) }
    }

    fun setPeerIp(ip: String) {
        _uiState.update { it.copy(peerIpInput = ip) }
    }

    fun selectCardToOffer(card: CardEntity) {
        _uiState.update { it.copy(selectedLocalCard = card) }
    }

    fun startTradeSession(context: Context? = null) {
        context?.let { CardexSyncService.start(it, totalCards = 1) }

        if (_uiState.value.isHost) {
            socketManager.startServer()
        } else {
            socketManager.connectToHost(_uiState.value.peerIpInput)
        }
    }

    fun sendSelectedCardOffer() {
        val card = _uiState.value.selectedLocalCard ?: return
        val cardUuid = try {
            UUID.fromString(card.id)
        } catch (_: Exception) {
            UUID.nameUUIDFromBytes(card.id.toByteArray())
        }

        viewModelScope.launch {
            socketManager.sendOffer(cardUuid)
        }
    }

    fun acceptOffer() {
        viewModelScope.launch {
            socketManager.acceptOffer()
        }
    }

    fun commitTrade(context: Context? = null) {
        viewModelScope.launch {
            socketManager.commitTrade()
            // Notificar éxito y actualizar servicio en primer plano
            context?.let { CardexSyncService.stop(it) }
        }
    }

    fun cancelTrade(context: Context? = null) {
        socketManager.abort("Intercambio cancelado por el usuario")
        context?.let { CardexSyncService.stop(it) }
    }

    override fun onCleared() {
        super.onCleared()
        socketManager.stop()
    }
}
