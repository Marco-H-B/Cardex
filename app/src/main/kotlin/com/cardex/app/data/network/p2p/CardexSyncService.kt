package com.cardex.app.data.network.p2p

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.app.ServiceCompat
import com.cardex.app.presentation.MainActivity

// Servicio en primer plano (Foreground Service) bajo el tipo 'dataSync'.
// Mantiene el enlace P2P y la sincronización continua sin ser liquidado por el sistema operativo.
// Cumple estrictamente con las políticas de Android 14 (API 34), Android 15 (API 35) y Android 16 (API 36).
class CardexSyncService : Service() {

    companion object {
        const val CHANNEL_ID = "cardex_p2p_sync_channel"
        const val NOTIFICATION_ID = 8888

        const val ACTION_START_SYNC = "com.cardex.app.action.START_SYNC"
        const val ACTION_STOP_SYNC = "com.cardex.app.action.STOP_SYNC"
        const val EXTRA_TOTAL_CARDS = "extra_total_cards"

        fun start(context: Context, totalCards: Int = 1) {
            val intent = Intent(context, CardexSyncService::class.java).apply {
                action = ACTION_START_SYNC
                putExtra(EXTRA_TOTAL_CARDS, totalCards)
            }
            androidx.core.content.ContextCompat.startForegroundService(context, intent)
        }

        fun stop(context: Context) {
            val intent = Intent(context, CardexSyncService::class.java).apply {
                action = ACTION_STOP_SYNC
            }
            context.startService(intent)
        }
    }

    private var totalCards = 0
    private var currentProgress = 0

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START_SYNC -> {
                totalCards = intent.getIntExtra(EXTRA_TOTAL_CARDS, 1)
                currentProgress = 0
                val initialNotification = buildProgressNotification(
                    current = 0,
                    total = totalCards,
                    statusText = "Enlace P2P Wi-Fi Direct activo (puerto 8888)..."
                )

                // Android 14+ requiere especificar FOREGROUND_SERVICE_TYPE_DATA_SYNC
                ServiceCompat.startForeground(
                    this,
                    NOTIFICATION_ID,
                    initialNotification,
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC
                    } else {
                        0
                    }
                )
            }
            ACTION_STOP_SYNC -> {
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
            }
        }
        return START_NOT_STICKY
    }

    // Android 15 (API 35+): Callback obligatorio para cuota acumulativa de 6 horas de dataSync.
    // Detiene el servicio de forma segura para evitar la excepción RemoteServiceException.
    override fun onTimeout(startId: Int, fgsType: Int) {
        super.onTimeout(startId, fgsType)
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf(startId)
    }

    override fun onBind(intent: Intent?): IBinder? = null

    // Actualiza el progreso de la transferencia en la píldora continua y barra del sistema.
    fun updateProgress(current: Int, total: Int, cardName: String) {
        this.currentProgress = current
        this.totalCards = total
        val percentage = if (total > 0) (current * 100) / total else 0
        val notification = buildProgressNotification(
            current = current,
            total = total,
            statusText = "Transfiriendo: $cardName ($percentage%)"
        )
        NotificationManagerCompat.from(this).notify(NOTIFICATION_ID, notification)
    }

    private fun buildProgressNotification(
        current: Int,
        total: Int,
        statusText: String
    ): Notification {
        val percentage = if (total > 0) (current * 100) / total else 0
        val capsuleTitle = "[ 🃏 Cardex ⇄ $current/$total · $percentage% ]"

        val openAppIntent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_SINGLE_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            this,
            0,
            openAppIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.stat_sys_upload)
            .setContentTitle(capsuleTitle)
            .setContentText(statusText)
            .setSubText("$percentage%")
            .setProgress(total, current, false)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setContentIntent(pendingIntent)
            .setCategory(NotificationCompat.CATEGORY_PROGRESS)
            .setForegroundServiceBehavior(NotificationCompat.FOREGROUND_SERVICE_IMMEDIATE)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)

        // Compatibilidad con Android 16 (API 36): Píldora viva / Rich Ongoing Notification
        builder.extras.putBoolean("android.requestPromotedOngoing", true)

        return builder.build()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Transferencia P2P Cardex",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Progreso de intercambio de cartas mediante Wi-Fi Direct y Sockets TCP (CC311)"
                setShowBadge(false)
                enableLights(false)
                enableVibration(false)
            }
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }
}
