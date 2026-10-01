package com.cardex.app.domain.network.p2p

import java.io.InputStream
import java.io.OutputStream
import java.util.UUID

// Trama binaria completa del protocolo Cardex P2P (Encabezado de 60 Bytes + Payload de N Bytes).
data class TradeFrame(
    val header: TradeHeader,
    val payload: ByteArray = ByteArray(0)
) {
    init {
        require(header.payloadLength == payload.size) {
            "Longitud del payload (${payload.size}) no coincide con el encabezado (${header.payloadLength})"
        }
    }

    // Verifica que la firma HMAC-SHA256 del encabezado coincida exactamente con los datos recibidos.
    fun verifyIntegrity(secretKey: ByteArray = TradeCrypto.DEFAULT_TEST_KEY): Boolean {
        val signableData = getSignableData()
        val computedHmac = TradeCrypto.calculateHmac(signableData, secretKey)
        return TradeCrypto.verifyHmac(header.hmacSignature, computedHmac)
    }

    // Serializa la trama completa a bytes listos para transmisión por el socket TCP.
    fun toByteArray(): ByteArray {
        val headerBytes = header.toBytes()
        if (payload.isEmpty()) return headerBytes
        val full = ByteArray(headerBytes.size + payload.size)
        System.arraycopy(headerBytes, 0, full, 0, headerBytes.size)
        System.arraycopy(payload, 0, full, headerBytes.size, payload.size)
        return full
    }

    // Escribe la trama completa en un flujo de salida (Socket OutputStream).
    fun writeTo(outputStream: OutputStream) {
        outputStream.write(toByteArray())
        outputStream.flush()
    }

    private fun getSignableData(): ByteArray {
        val signableHeader = header.getSignableHeaderBytes()
        if (payload.isEmpty()) return signableHeader
        val combined = ByteArray(signableHeader.size + payload.size)
        System.arraycopy(signableHeader, 0, combined, 0, signableHeader.size)
        System.arraycopy(payload, 0, combined, signableHeader.size, payload.size)
        return combined
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as TradeFrame
        if (header != other.header) return false
        if (!payload.contentEquals(other.payload)) return false

        return true
    }

    override fun hashCode(): Int {
        var result = header.hashCode()
        result = 31 * result + payload.contentHashCode()
        return result
    }

    companion object {
        // Fábrica para construir y firmar criptográficamente una trama saliente en un solo paso.
        fun create(
            opCode: TradeOpCode,
            cardUuid: UUID = UUID(0L, 0L),
            payload: ByteArray = ByteArray(0),
            secretKey: ByteArray = TradeCrypto.DEFAULT_TEST_KEY,
            timestampMillis: Long = System.currentTimeMillis()
        ): TradeFrame {
            // 1. Construir los 28 bytes autenticados del encabezado provisional
            val dummyHmac = ByteArray(TradeHeader.HMAC_LENGTH)
            val draftHeader = TradeHeader(
                opCode = opCode,
                payloadLength = payload.size,
                cardUuid = cardUuid,
                timestampMillis = timestampMillis,
                hmacSignature = dummyHmac
            )

            // 2. Concatenar encabezado firmable y payload para calcular HMAC-SHA256
            val signableHeader = draftHeader.getSignableHeaderBytes()
            val signableData = if (payload.isEmpty()) {
                signableHeader
            } else {
                val combined = ByteArray(signableHeader.size + payload.size)
                System.arraycopy(signableHeader, 0, combined, 0, signableHeader.size)
                System.arraycopy(payload, 0, combined, signableHeader.size, payload.size)
                combined
            }

            val signature = TradeCrypto.calculateHmac(signableData, secretKey)

            // 3. Crear el encabezado final firmado
            val finalHeader = draftHeader.copy(hmacSignature = signature)
            return TradeFrame(finalHeader, payload)
        }

        // Lee y deserializa una trama desde un flujo de entrada (Socket InputStream) bloqueante con timeout.
        fun readFrom(inputStream: InputStream): TradeFrame {
            val headerBuffer = ByteArray(TradeHeader.HEADER_SIZE)
            var bytesRead = 0
            while (bytesRead < TradeHeader.HEADER_SIZE) {
                val read = inputStream.read(headerBuffer, bytesRead, TradeHeader.HEADER_SIZE - bytesRead)
                if (read == -1) {
                    throw IllegalStateException("Conexión P2P cerrada prematuramente al leer el encabezado")
                }
                bytesRead += read
            }

            val header = TradeHeader.fromBytes(headerBuffer)

            val payloadBuffer = if (header.payloadLength > 0) {
                val buffer = ByteArray(header.payloadLength)
                var payloadRead = 0
                while (payloadRead < header.payloadLength) {
                    val read = inputStream.read(buffer, payloadRead, header.payloadLength - payloadRead)
                    if (read == -1) {
                        throw IllegalStateException("Conexión P2P cerrada al leer el payload de datos")
                    }
                    payloadRead += read
                }
                buffer
            } else {
                ByteArray(0)
            }

            return TradeFrame(header, payloadBuffer)
        }
    }
}
