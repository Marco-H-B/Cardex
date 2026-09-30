# Reglas Proguard para optimización y ofuscación en Cardex
-keepclassmembers class * {
    @androidx.room.Dao *;
    @androidx.room.Entity *;
}
