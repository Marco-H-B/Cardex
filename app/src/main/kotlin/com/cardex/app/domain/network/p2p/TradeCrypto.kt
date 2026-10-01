package com.cardex.app.domain.network.p2p

import java.security.MessageDigest
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec

// Utilidades criptográficas para asegurar la integridad de tramas binarias P2P (CC311).
// Protege contra la adulteración en tránsito y ataques de tiempo (Timing Attacks).
object TradeCrypto {

    private const val ALGORITHM = "HmacSHA256"

    // Clave secreta efímera por defecto para sesiones P2P de prueba si no se negocia por QR
    val DEFAULT_TEST_KEY = "cardex-cc311-p2p-secret-key-2026".toByteArray(Charsets.UTF_8)

    // Calcula el HMAC-SHA256 sobre un bloque de bytes utilizando una clave secreta simétrica.
    fun calculateHmac(data: ByteArray, secretKey: ByteArray = DEFAULT_TEST_KEY): ByteArray {
        val mac = Mac.getInstance(ALGORITHM)
        val keySpec = SecretKeySpec(secretKey, ALGORITHM)
        mac.init(keySpec)
        return mac.doFinal(data)
    }

    // Compara dos hashes HMAC en tiempo constante (MessageDigest.isEqual) para evitar ataques de canal lateral.
    fun verifyHmac(expectedHmac: ByteArray, actualHmac: ByteArray): Boolean {
        if (expectedHmac.size != actualHmac.size) return false
        return MessageDigest.isEqual(expectedHmac, actualHmac)
    }
}
