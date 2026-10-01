package com.cardex.app.data.network.p2p

import com.cardex.app.domain.network.p2p.TradeCrypto
import com.cardex.app.domain.network.p2p.TradeFrame
import com.cardex.app.domain.network.p2p.TradeOpCode
import com.cardex.app.domain.network.p2p.TradeState
import com.cardex.app.domain.network.p2p.TradeStateMachine
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.IOException
import java.net.ServerSocket
import java.net.Socket
import java.net.SocketTimeoutException
import java.util.UUID

// Administrador del canal TCP en el puerto 8888 para intercambio local sin internet (CC311).
// Gestiona el servidor de escucha (Group Owner) o el cliente de conexión según el rol Wi-Fi Direct.
class CardexP2PSocketManager(
    private val scope: CoroutineScope,
    private val secretKey: ByteArray = TradeCrypto.DEFAULT_TEST_KEY
) {

    private val fsm = TradeStateMachine()
    private val _tradeState = MutableStateFlow<TradeState>(TradeState.Idle)
    val tradeState: StateFlow<TradeState> = _tradeState.asStateFlow()

    private var serverSocket: ServerSocket? = null
    private var activeSocket: Socket? = null
    private var workerJob: Job? = null

    // Inicia el servidor TCP local en el puerto 8888 (Modo Anfitrión / Group Owner).
    fun startServer(port: Int = PORT) {
        stop()
        workerJob = scope.launch(Dispatchers.IO) {
            try {
                serverSocket = ServerSocket(port).apply {
                    soTimeout = SOCKET_TIMEOUT_MS
                }
                val socket = serverSocket!!.accept().apply {
                    soTimeout = SOCKET_TIMEOUT_MS
                }
                activeSocket = socket
                val peerAddress = socket.inetAddress.hostAddress ?: "peer-unknown"

                // Intercambio de saludo inicial (OP_HELLO)
                TradeFrame.create(TradeOpCode.HELLO, secretKey = secretKey).writeTo(socket.getOutputStream())
                val helloFrame = TradeFrame.readFrom(socket.getInputStream())

                if (helloFrame.header.opCode == TradeOpCode.HELLO && helloFrame.verifyIntegrity(secretKey)) {
                    fsm.onConnected(peerAddress)
                    _tradeState.value = fsm.currentState
                    listenIncomingFrames(socket)
                } else {
                    abort("Saludo inicial no válido o firma rechazada")
                }
            } catch (e: SocketTimeoutException) {
                abort("Tiempo de espera agotado (30s) sin conexión entrante")
            } catch (e: IOException) {
                if (isActive) abort("Error de I/O en servidor TCP: ${e.message}")
            }
        }
    }

    // Conecta como cliente hacia la IP del anfitrión (puerto 8888).
    fun connectToHost(host: String, port: Int = PORT) {
        stop()
        workerJob = scope.launch(Dispatchers.IO) {
            try {
                val socket = Socket(host, port).apply {
                    soTimeout = SOCKET_TIMEOUT_MS
                }
                activeSocket = socket

                // Esperar HELLO del servidor y responder HELLO
                val helloFrame = TradeFrame.readFrom(socket.getInputStream())
                if (helloFrame.header.opCode == TradeOpCode.HELLO && helloFrame.verifyIntegrity(secretKey)) {
                    TradeFrame.create(TradeOpCode.HELLO, secretKey = secretKey).writeTo(socket.getOutputStream())
                    fsm.onConnected(host)
                    _tradeState.value = fsm.currentState
                    listenIncomingFrames(socket)
                } else {
                    abort("Fallo al verificar saludo del anfitrión")
                }
            } catch (e: SocketTimeoutException) {
                abort("Tiempo de espera agotado al conectar con el par P2P")
            } catch (e: IOException) {
                if (isActive) abort("No se pudo conectar al anfitrión: ${e.message}")
            }
        }
    }

    // Envía una oferta formal con el UUID de la carta a intercambiar.
    suspend fun sendOffer(cardUuid: UUID) = withContext(Dispatchers.IO) {
        val socket = activeSocket ?: return@withContext
        try {
            val frame = TradeFrame.create(TradeOpCode.OFFER, cardUuid = cardUuid, secretKey = secretKey)
            frame.writeTo(socket.getOutputStream())
            fsm.onSendOffer(cardUuid)
            _tradeState.value = fsm.currentState
        } catch (e: Exception) {
            abort("Fallo al enviar oferta: ${e.message}")
        }
    }

    // Acepta los términos de la oferta recibida (OP_ACCEPT).
    suspend fun acceptOffer() = withContext(Dispatchers.IO) {
        val socket = activeSocket ?: return@withContext
        try {
            val frame = TradeFrame.create(TradeOpCode.ACCEPT, secretKey = secretKey)
            frame.writeTo(socket.getOutputStream())
            fsm.onAccept()
            _tradeState.value = fsm.currentState
        } catch (e: Exception) {
            abort("Fallo al enviar aceptación: ${e.message}")
        }
    }

    // Ejecuta el compromiso final de intercambio (OP_COMMIT).
    suspend fun commitTrade() = withContext(Dispatchers.IO) {
        val socket = activeSocket ?: return@withContext
        try {
            val frame = TradeFrame.create(TradeOpCode.COMMIT, secretKey = secretKey)
            frame.writeTo(socket.getOutputStream())
            fsm.onCommit()
            _tradeState.value = fsm.currentState
        } catch (e: Exception) {
            abort("Fallo al enviar compromiso: ${e.message}")
        }
    }

    // Envía acuse de recibo de persistencia exitosa (OP_ACK).
    suspend fun acknowledgeTrade() = withContext(Dispatchers.IO) {
        val socket = activeSocket ?: return@withContext
        try {
            val frame = TradeFrame.create(TradeOpCode.ACK, secretKey = secretKey)
            frame.writeTo(socket.getOutputStream())
            fsm.onAcknowledge()
            _tradeState.value = fsm.currentState
        } catch (e: Exception) {
            abort("Fallo al enviar ACK: ${e.message}")
        }
    }

    // Aborta la sesión y notifica al par remoto con OP_ABORT.
    fun abort(reason: String) {
        try {
            val socket = activeSocket
            if (socket != null && !socket.isClosed) {
                TradeFrame.create(TradeOpCode.ABORT, secretKey = secretKey).writeTo(socket.getOutputStream())
            }
        } catch (_: Exception) {}

        fsm.onAbort(reason)
        _tradeState.value = fsm.currentState
        stop()
    }

    // Cierra todos los sockets y libera recursos.
    fun stop() {
        workerJob?.cancel()
        workerJob = null
        try { activeSocket?.close() } catch (_: Exception) {}
        try { serverSocket?.close() } catch (_: Exception) {}
        activeSocket = null
        serverSocket = null
    }

    // Bucle continuo de lectura de tramas entrantes por el socket TCP.
    private suspend fun listenIncomingFrames(socket: Socket) = withContext(Dispatchers.IO) {
        try {
            val inputStream = socket.getInputStream()
            while (isActive && !socket.isClosed) {
                val frame = TradeFrame.readFrom(inputStream)

                if (!frame.verifyIntegrity(secretKey)) {
                    abort("Trama corrupta recibida: Fallo de verificación HMAC-SHA256")
                    break
                }

                when (frame.header.opCode) {
                    TradeOpCode.OFFER -> {
                        fsm.onReceiveOffer(frame.header.cardUuid)
                        _tradeState.value = fsm.currentState
                    }
                    TradeOpCode.ACCEPT -> {
                        fsm.onAccept()
                        _tradeState.value = fsm.currentState
                    }
                    TradeOpCode.COMMIT -> {
                        fsm.onCommit()
                        _tradeState.value = fsm.currentState
                    }
                    TradeOpCode.ACK -> {
                        fsm.onAcknowledge()
                        _tradeState.value = fsm.currentState
                    }
                    TradeOpCode.ABORT -> {
                        fsm.onAbort("El par remoto canceló el intercambio")
                        _tradeState.value = fsm.currentState
                        break
                    }
                    else -> {}
                }
            }
        } catch (e: SocketTimeoutException) {
            abort("Timeout por inactividad de 30s en socket TCP")
        } catch (e: IOException) {
            if (isActive) abort("Conexión TCP interrumpida: ${e.message}")
        }
    }

    companion object {
        const val PORT = 8888
        const val SOCKET_TIMEOUT_MS = 30000 // 30 segundos según especificación CC311
    }
}
