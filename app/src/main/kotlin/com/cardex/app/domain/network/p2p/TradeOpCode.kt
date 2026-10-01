package com.cardex.app.domain.network.p2p

// Códigos de operación (OpCodes) para el protocolo binario P2P sobre TCP (puerto 8888).
// Diseñado para el intercambio local de cartas sin conexión a internet (Proyecto CC311 UNI).
enum class TradeOpCode(val code: Byte) {
    HELLO(0x01),   // Saludo inicial e intercambio de claves o nonces
    OFFER(0x02),   // Envío de la oferta con el UUID inmutable de la carta
    ACCEPT(0x03),  // Aceptación mutua de los términos del intercambio
    COMMIT(0x04),  // Transferencia de propiedad atómica tras escanear el QR presencial
    ACK(0x05),     // Acuse de recibo de éxito en la persistencia local Room DB
    ABORT(0xFF.toByte()); // Cancelación inmediata por timeout, rechazo o fallo de integridad

    companion object {
        fun fromByte(b: Byte): TradeOpCode = entries.firstOrNull { it.code == b }
            ?: throw IllegalArgumentException("OpCode no reconocido en el protocolo Cardex: 0x%02X".format(b))
    }
}
