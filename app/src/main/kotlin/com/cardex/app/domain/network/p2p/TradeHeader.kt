package com.cardex.app.domain.network.p2p

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

// Encabezado inmutable de la trama binaria del protocolo Cardex P2P (CC311).
// Longitud exacta: 60 bytes en formato Big-Endian (Network Byte Order).
data class TradeHeader(
    val magicByte: Byte = MAGIC_BYTE,
    val opCode: TradeOpCode,
    val payloadLength: Int,
    val cardUuid: UUID,
    val timestampMillis: Long,
    val hmacSignature: ByteArray
) {
    init {
        require(magicByte == MAGIC_BYTE) {
            "Delimitador de trama no válido: 0x%02X (esperado 0x%02X)".format(magicByte, MAGIC_BYTE)
        }
        require(payloadLength in 0..65535) {
            "Longitud del payload fuera de rango UInt16: $payloadLength"
        }
        require(hmacSignature.size == HMAC_LENGTH) {
            "Longitud de firma HMAC-SHA256 no válida: ${hmacSignature.size} bytes (esperado $HMAC_LENGTH)"
        }
    }

    // Serializa el encabezado a un arreglo exacto de 60 bytes.
    fun toBytes(): ByteArray {
        val buffer = ByteBuffer.allocate(HEADER_SIZE).order(ByteOrder.BIG_ENDIAN)
        buffer.put(magicByte)
        buffer.put(opCode.code)
        buffer.putShort(payloadLength.toShort())
        buffer.putLong(cardUuid.mostSignificantBits)
        buffer.putLong(cardUuid.leastSignificantBits)
        buffer.putLong(timestampMillis)
        buffer.put(hmacSignature)
        return buffer.array()
    }

    // Retorna los 28 bytes que componen la porción autenticada del encabezado (sin la firma previa).
    fun getSignableHeaderBytes(): ByteArray {
        val buffer = ByteBuffer.allocate(SIGNABLE_HEADER_SIZE).order(ByteOrder.BIG_ENDIAN)
        buffer.put(magicByte)
        buffer.put(opCode.code)
        buffer.putShort(payloadLength.toShort())
        buffer.putLong(cardUuid.mostSignificantBits)
        buffer.putLong(cardUuid.leastSignificantBits)
        buffer.putLong(timestampMillis)
        return buffer.array()
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as TradeHeader
        if (magicByte != other.magicByte) return false
        if (opCode != other.opCode) return false
        if (payloadLength != other.payloadLength) return false
        if (cardUuid != other.cardUuid) return false
        if (timestampMillis != other.timestampMillis) return false
        if (!hmacSignature.contentEquals(other.hmacSignature)) return false

        return true
    }

    override fun hashCode(): Int {
        var result = magicByte.toInt()
        result = 31 * result + opCode.hashCode()
        result = 31 * result + payloadLength
        result = 31 * result + cardUuid.hashCode()
        result = 31 * result + timestampMillis.hashCode()
        result = 31 * result + hmacSignature.contentHashCode()
        return result
    }

    companion object {
        const val MAGIC_BYTE: Byte = 0xCA.toByte()
        const val HEADER_SIZE = 60
        const val SIGNABLE_HEADER_SIZE = 28 // 1 + 1 + 2 + 16 + 8
        const val HMAC_LENGTH = 32

        // Deserializa 60 bytes en un objeto TradeHeader.
        fun fromBytes(bytes: ByteArray, offset: Int = 0): TradeHeader {
            require(bytes.size - offset >= HEADER_SIZE) {
                "Se requieren al menos $HEADER_SIZE bytes para deserializar el encabezado (disponibles: ${bytes.size - offset})"
            }

            val buffer = ByteBuffer.wrap(bytes, offset, HEADER_SIZE).order(ByteOrder.BIG_ENDIAN)
            val magic = buffer.get()
            val opCodeByte = buffer.get()
            val payloadLen = buffer.short.toInt() and 0xFFFF
            val mostSigBits = buffer.long
            val leastSigBits = buffer.long
            val timestamp = buffer.long
            val hmac = ByteArray(HMAC_LENGTH)
            buffer.get(hmac)

            return TradeHeader(
                magicByte = magic,
                opCode = TradeOpCode.fromByte(opCodeByte),
                payloadLength = payloadLen,
                cardUuid = UUID(mostSigBits, leastSigBits),
                timestampMillis = timestamp,
                hmacSignature = hmac
            )
        }
    }
}
