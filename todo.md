# 📋 Registro de Tareas Activas (TODO) — Cardex

> **Proyecto:** Cardex (Native Android TCG Scanner & Marketplace)
> **Última Actualización:** 2026-10-01 (Fase 6 Completada)

---

## 🟢 Fases Culminadas

- [x] **Fase 1: Inicialización y Clean Architecture**
  - [x] Configuración base de Gradle Kotlin DSL con Kotlin 2.0.20 y JDK 21.
  - [x] Árbol modular (`core`, `domain`, `data`, `presentation`).
  - [x] Persistencia SQLite local con Room Database y corrutinas Flow.
  - [x] Paleta visual Negro Puro OLED (`#000000`) y acento Apple HIG Green (`#30D158`).

- [x] **Fase 2: Motor Algorítmico CC232 (TDD con JUnit)**
  - [x] `CaptureStack`: Pila LIFO en memoria para deshacer capturas en $O(1)$.
  - [x] `SyncDeque`: Cola de doble extremo para priorizar miniaturas frente a fotos HD.
  - [x] `BinderDoublyLinkedList`: Lista doblemente enlazada para paginación física 3x3 en $O(1)$.
  - [x] `CardTrieSearch`: Árbol de prefijos Trie para autocompletado en memoria RAM en $O(L)$.

- [x] **Fase 3: Motor Óptico de Escaneo y Compresión WebP**
  - [x] Integración de CameraX con vista previa fluida.
  - [x] Google ML Kit Document Scanner para detección de 4 vértices y corrección de perspectiva.
  - [x] Algoritmo de nitidez por Varianza del Laplaciano.
  - [x] Pipeline WebP dual en segundo plano (Thumbnail 15 KB y Full HD 85 KB).

- [x] **Fase 4: El Archivador Virtual 3x3 y el Visor 3D Interactivo**
  - [x] Archivador $3 \times 3$ con Jetpack Compose y transiciones de hoja a 120 FPS.
  - [x] Barra de búsqueda en vivo conectada al Árbol Trie en tiempo $O(L)$.
  - [x] Visor 3D interactivo con `graphicsLayer` (rotación libre X/Y y umbral Anverso $\leftrightarrow$ Reverso a $90^\circ$).
  - [x] Fondo dinámico adaptativo al Grado de desgaste (Float Tier) con atmósfera OLED unificada, halo difuso por hardware (`RenderEffect` Gaussian blur) e iluminación reactiva por paralaje táctil en tiempo real.
  - [x] Modo Dual de Visualización en el Archivador 3x3:
    - [x] Pestaña 'Todas': Orden denso / cronológico conforme el usuario escanea.
    - [x] Pestañas 'Genéricas' y 'Oficiales TCG': Álbum Disperso con posiciones fijas por número de coleccionista (`#001`, `#002`, ..., `#439`, `#450`) e instanciación de páginas dispersas en $O(1)$ con `setCardAtPosition`.

- [x] **Fase 5: Backend Neon Cloud, Neon Functions y Cuotas Lemon Squeezy**
  - [x] Migración SQL completa en Neon Lakebase Postgres (`neon/migrations/20261001000000_phase5_schema.sql`): `profiles`, `cards_catalog`, `card_instances`, `market_listings`, `price_history`.
  - [x] 6 Índices B-Tree de alto rendimiento creados y verificados en Neon via MCP.
  - [x] Función RPC transaccional `check_and_consume_daily_scan` con bloqueo pesimista `FOR UPDATE` (FREE: 5 / PRO: 10 cartas/día).
  - [x] Función RPC transaccional `reserve_card_for_purchase` con candado temporal de 5 minutos para el Marketplace.
  - [x] Bucket Object Storage `card-images` en Neon con acceso `public_read`.
  - [x] Ingesta masiva del Catálogo Maestro en Neon: 177 cartas físicas (120 Oficiales + 57 Genéricas) y perfil PRO inicial de Marco verificado en vivo.
  - [x] Neon Functions (`calculate-float`, `lemonsqueezy-webhook`, router WinterTC) desplegadas en producción con 18/18 tests unitarios TDD aprobados.
  - [x] Deprecación y eliminación segura de la carpeta `supabase/`.

- [x] **Fase 6: Marketplace, Bloqueo Concurrente y Red P2P (CC311)**
  - [x] **Hito 6.1:** Pantalla del Mercado (`MarketplaceScreen`) con chips interactivos por Grado de Desgaste (Mítico, Épico, Raro, Común, Dañado) y selector de tipo (Oficial vs Genérica).
  - [x] **Hito 6.2:** Integración RPC `reserve_card_for_purchase` con bloqueo pesimista (`SELECT ... FOR UPDATE`), asignación de candado temporal de 5 minutos y prevención de auto-compra y colisiones de concurrencia.
  - [x] **Hito 6.3:** Flujo de checkout con pasarela de **Mercado Pago** en moneda local (PEN), temporizador regresivo de 300 segundos (`04:59`... `00:00`) y confirmación atómica en inventario.
  - [x] **Hito 6.4:** Protocolo binario P2P sobre TCP en puerto 8888 con encabezado fijo de 60 bytes (`TradeHeader`), `Magic Byte 0xCA`, OpCodes (`OP_HELLO`, `OP_OFFER`, `OP_ACCEPT`, `OP_COMMIT`, `OP_ACK`, `OP_ABORT`), verificación HMAC-SHA256, timeout de 30s y máquina de estados finita determinista (`TradeStateMachine`).
  - [x] **Hito 6.5:** Servicio en primer plano `CardexSyncService` bajo `FOREGROUND_SERVICE_DATA_SYNC`, compatible con Android 14/15/16 (`onTimeout` para límite de 6 horas) y notificación continua dinámica estilo Dynamic Island / Live Capsule (`[ 🃏 Cardex ⇄ X/Y · Z% ]`).

---

## 🟡 Próxima Fase: Digitalización de las 177 Cartas & Preparación Pre-Lanzamiento Play Store

- [ ] Digitalización y prueba de fuego con las 177 cartas físicas de Marco.
- [ ] Auditoría de Seguridad AppSec (Checklist de 20 puntos).
- [ ] Generación de Android App Bundle (.aab) Release con optimización R8/ProGuard.
