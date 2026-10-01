package com.cardex.app.presentation.p2p

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.content.ContextCompat

// Utilidad para la verificación y solicitud dinámica de permisos Wi-Fi Direct y Notificaciones.
// Compatible desde Android 8.0 (API 26) hasta Android 16 (API 36).
object P2PPermissionHelper {

    fun getRequiredP2PPermissions(): Array<String> {
        val permissions = mutableListOf<String>()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) { // API 33+ (Android 13, 14, 15, 16)
            permissions.add(Manifest.permission.NEARBY_WIFI_DEVICES)
            permissions.add(Manifest.permission.POST_NOTIFICATIONS)
        } else { // Android 12 y anteriores (API 26-32)
            permissions.add(Manifest.permission.ACCESS_FINE_LOCATION)
        }

        return permissions.toTypedArray()
    }

    fun hasP2PPermissions(context: Context): Boolean {
        return getRequiredP2PPermissions().all { permission ->
            ContextCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED
        }
    }
}
