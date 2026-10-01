package com.cardex.app.domain.network.p2p

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.util.UUID

class CardexP2PProtocolTest {

    private val testKey = "uni-cc311-secret-test-key-2026!".toByteArray(Charsets.UTF_8)
    private val sampleUuid = UUID.fromString("12345678-1234-1234-1234-123456789abc")

    @Test
    fun `TradeHeader serializa y deserializa con precision de 60 bytes`() {
        val dummyHmac = ByteArray(32) { it.toByte() }
        val header = TradeHeader(
            magicByte = TradeHeader.MAGIC_BYTE,
            opCode = TradeOpCode.OFFER,
            payloadLength = 10,
            cardUuid = sampleUuid,
            timestampMillis = 1774000000000L,
            hmacSignature = dummyHmac
        )

        val bytes = header.toBytes()
        assertEquals(60, bytes.size)
        assertEquals(0xCA.toByte(), bytes[0])
        assertEquals(TradeOpCode.OFFER.code, bytes[1])

        val deserialized = TradeHeader.fromBytes(bytes)
        assertEquals(header, deserialized)
        assertEquals(sampleUuid, deserialized.cardUuid)
        assertEquals(10, deserialized.payloadLength)
        assertEquals(1774000000000L, deserialized.timestampMillis)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `TradeHeader rechaza magic byte corrupto`() {
        val corruptedBytes = ByteArray(60) { 0x00 }
        TradeHeader.fromBytes(corruptedBytes)
    }

    @Test
    fun `TradeFrame calcula firma HMAC valida y pasa verificacion`() {
        val payload = "Carta Pikachu Ilustradora".toByteArray(Charsets.UTF_8)
        val frame = TradeFrame.create(
            opCode = TradeOpCode.OFFER,
            cardUuid = sampleUuid,
            payload = payload,
            secretKey = testKey,
            timestampMillis = 1000L
        )

        assertEquals(TradeOpCode.OFFER, frame.header.opCode)
        assertEquals(payload.size, frame.header.payloadLength)
        assertTrue(frame.verifyIntegrity(testKey))
    }

    @Test
    fun `TradeFrame detecta alteracion de payload en transito`() {
        val originalPayload = "Oferta Original".toByteArray(Charsets.UTF_8)
        val frame = TradeFrame.create(
            opCode = TradeOpCode.OFFER,
            cardUuid = sampleUuid,
            payload = originalPayload,
            secretKey = testKey
        )

        // Simular alteración por atacante (Hombre en el medio / MITM)
        val tamperedPayload = "Oferta Adulterada".toByteArray(Charsets.UTF_8)
        val tamperedFrame = frame.copy(
            header = frame.header.copy(payloadLength = tamperedPayload.size),
            payload = tamperedPayload
        )

        assertFalse(tamperedFrame.verifyIntegrity(testKey))
    }

    @Test
    fun `TradeFrame escribe y lee flujo de socket correctamente`() {
        val payload = "Metadatos JSON de la Carta".toByteArray(Charsets.UTF_8)
        val originalFrame = TradeFrame.create(
            opCode = TradeOpCode.COMMIT,
            cardUuid = sampleUuid,
            payload = payload,
            secretKey = testKey
        )

        val outputStream = ByteArrayOutputStream()
        originalFrame.writeTo(outputStream)

        val bytesWritten = outputStream.toByteArray()
        assertEquals(60 + payload.size, bytesWritten.size)

        val inputStream = ByteArrayInputStream(bytesWritten)
        val readFrame = TradeFrame.readFrom(inputStream)

        assertEquals(originalFrame.header, readFrame.header)
        assertArrayEquals(originalFrame.payload, readFrame.payload)
        assertTrue(readFrame.verifyIntegrity(testKey))
    }

    @Test
    fun `TradeStateMachine transiciona ordenadamente hasta completado`() {
        val fsm = TradeStateMachine()
        assertTrue(fsm.currentState is TradeState.Idle)

        fsm.onConnected("192.168.49.1")
        val connected = fsm.currentState as TradeState.Connected
        assertEquals("192.168.49.1", connected.peerAddress)

        fsm.onSendOffer(sampleUuid)
        val offerSent = fsm.currentState as TradeState.OfferSent
        assertEquals(sampleUuid, offerSent.offeredCardUuid)

        fsm.onAccept()
        val accepted = fsm.currentState as TradeState.Accepted
        assertEquals(sampleUuid, accepted.offeredCardUuid)

        fsm.onCommit()
        assertTrue(fsm.currentState is TradeState.Committing)

        fsm.onAcknowledge()
        val completed = fsm.currentState as TradeState.Completed
        assertEquals(sampleUuid, completed.offeredCardUuid)
    }

    @Test
    fun `TradeStateMachine aborta y reinicia limpiamente`() {
        val fsm = TradeStateMachine()
        fsm.onConnected("10.0.0.2")
        fsm.onAbort("Timeout de socket TCP superó los 30 segundos")

        val aborted = fsm.currentState as TradeState.Aborted
        assertEquals("Timeout de socket TCP superó los 30 segundos", aborted.reason)

        fsm.reset()
        assertTrue(fsm.currentState is TradeState.Idle)
    }
}
