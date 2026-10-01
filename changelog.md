# 📜 Registro Histórico de Cambios (CHANGELOG) — Cardex

Todas las modificaciones notables de este proyecto están documentadas bajo el estándar de [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/) y siguen Conventional Commits en MAYÚSCULAS.

---

## [Unreleased] - Fase 6: Marketplace, Bloqueo Concurrente y Red P2P (CC311)

### FEAT

- **marketplace/presentation**: pantalla del mercado `MarketplaceScreen` con paleta OLED `#000000`, acentos Cardex Green, filtros reactivos por Grado de Desgaste (`MythicGold`, `EpicCrimson`, `RarePurple`, `CommonBlue`, `DamagedGlacier`) y categoría dual (Oficiales TCG vs Genéricas).
- **marketplace/concurrency**: implementación del bloqueo pesimista en memoria y base de datos (`reserveCard`) análogo a `SELECT ... FOR UPDATE` en PostgreSQL, con candado temporal de 5 minutos (300s) y prevención de auto-compra y colisiones simultáneas.
- **marketplace/checkout**: integración del flujo de pago de Mercado Pago en moneda local (PEN), temporizador regresivo dinámico en Compose ModalBottomSheet y confirmación de compra atómica.
- **p2p/protocol**: protocolo de red binario descentralizado sobre TCP en puerto 8888 (CC311 UNI) con encabezado canónico de 60 bytes en orden de red Big-Endian, Magic Byte `0xCA`, OpCodes de control y firma criptográfica HMAC-SHA256 para erradicar adulteraciones en tránsito.
- **p2p/fsm**: máquina de estados determinista `TradeStateMachine` con 8 estados de ciclo de vida (`Idle`, `Connected`, `OfferSent`, `OfferReceived`, `Accepted`, `Committing`, `Completed`, `Aborted`) y tolerancia a fallos con timeout de 30 segundos y rollback local inmediato en Room DB.
- **p2p/service**: servicio en primer plano `CardexSyncService` (`FOREGROUND_SERVICE_DATA_SYNC`), blindado para Android 14/15/16 con `onTimeout` para límite de 6 horas y notificación de progreso continuo enriquecida estilo Dynamic Island / Live Capsule (`[ 🃏 Cardex ⇄ X/Y · Z% ]`).
- **navigation**: barra de herramientas y flujo de navegación completo en `MainActivity` enlazando el Archivador 3x3, Escáner, Mercado C2C e Intercambio P2P.

### TEST

- **p2p**: suite TDD completa `CardexP2PProtocolTest` verificando serialización/deserialización del encabezado de 60 bytes, validación de Magic Byte, firma HMAC y máquina de estados.
- **marketplace**: pruebas unitarias `MarketplaceRepositoryTest` y `MarketplaceViewModelTest` validando filtrado por grado/tipo, exclusión mutua de reserva, temporizador de 300 segundos y confirmación de pago.
- **p2p/viewmodel**: pruebas unitarias `P2PTradeViewModelTest` verificando selección de cartas locales, cambio de roles host/cliente y enlaces de red.

---

## [0.5.0] - Fase 5: Backend Neon Cloud & Neon Functions

### FEAT

- **ui/presentation**: atmósfera unificada OLED tintada y halo ambiental difuso por hardware (`RenderEffect` Gaussian blur de 90dp) en `Card3DViewer`, erradicando totalmente el _color banding_, anillos concéntricos y saltos bruscos para una transición sedosa Apple HIG.
- **ui/presentation**: iluminación reactiva con desplazamiento de paralaje táctil en tiempo real (`parallaxX` y `parallaxY`) al rotar cartas físicas en 3D.
- **core/theme**: función de extensión centralizada `getConditionGradeColor` en `Color.kt` con resolución continua de Float inmutable y textual de Grados oficiales TCG.
- **backend**: migración SQL completa en Neon Lakebase Postgres con tablas `profiles`, `cards_catalog`, `card_instances`, `market_listings` y `price_history`.
- **security**: funciones RPC transaccionales `check_and_consume_daily_scan` (FREE: 5 / PRO: 10 cartas) y `reserve_card_for_purchase` con bloqueo pesimista `FOR UPDATE` en Neon.
- **neon-functions**: motor algorítmico del Float continuo de 9 decimales en Node.js 24 con Slab Bypass, firma HMAC-SHA256, Santos Griales y webhook de Lemon Squeezy con pool de Postgres directo.
- **data**: ingesta del Catálogo Maestro de 177 cartas físicas en Neon y eliminación segura de Supabase.

- **neon**: migración e ingesta completa de las 177 cartas físicas (120 Oficiales + 57 Genéricas) en Lakebase Postgres `cards_catalog` y verificación de perfil PRO inicial de Marco vía MCP.
- **binder/algorithm**: algoritmo de Álbum Disperso `setCardAtPosition` en `BinderDoublyLinkedList` para ubicar cartas físicas en ranuras fijas por número de coleccionista en $O(1)$, instanciando páginas intermedias dinámicamente y limpiando referencias sin fugas de memoria.
- **binder/presentation**: modo dual de visualización en `BinderViewModel` y `BinderScreen`: orden denso / cronológico en la pestaña 'Todas' y Álbum Disperso (#001, #002, ..., #439, #450) en 'Genéricas' y 'Oficiales TCG' con etiquetas `#001` preimpresas en las ranuras vacías.
- **binder/duplicates**: apilamiento visual de cartas duplicadas en un mismo bolsillo con efecto de baraja física (hasta 3 cartas sobrepuestas con rotaciones de -5° y +3.5°) y badge dinámico de conteo en la esquina superior derecha solo cuando count > 1.
- **scanner**: extracción y persistencia automática del número de coleccionista (`#439`) en `CardEntity.cardNumber` al escanear con CameraX.

### STYLE

- **topbar**: eliminación del subtítulo redundante 'ARCHIVADOR 3X3' en la barra superior de la pantalla principal, dejando un encabezado minimalista y limpio con únicamente 'CARDEX' bajo Apple HIG.
- **viewer3d**: simplificación de la píldora superior del visor 3D a `Anverso` y `Reverso`, eliminando texto redundante de `(Cara A)` y `(Cara B)`.
- **theme**: actualización de `CommonBlue` a `#0A84FF` (azul eléctrico zafiro Apple HIG) para garantizar luminancia y contraste sobre pantallas OLED `#000000`.

### TEST

- **theme**: suite unitaria `ConditionGradeColorTest` con cobertura exhaustiva de umbrales numéricos de float, etiquetas oficiales y casos nulos/fallback.
- **edge-function**: suite TDD de 6 pruebas unitarias para el motor de cálculo del Float con cobertura al 100%.
- **webhook**: pruebas unitarias de verificación de firmas HMAC-SHA256 para eventos de Lemon Squeezy.
- **android**: pruebas unitarias para `PhysicalCardSeeder` y operaciones por lotes `saveCards` en `CardRepository`.
