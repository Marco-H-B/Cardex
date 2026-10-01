# 📋 Registro de Tareas Activas (TODO) — Cardex

> **Proyecto:** Cardex (Native Android TCG Scanner & Marketplace)
> **Última Actualización:** 2026-10-01 (Fase 5 Completada)

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

- [x] **Fase 5: Backend Supabase, Edge Functions y Cuotas Lemon Squeezy**
  - [x] Migración SQL completa (`20261001000000_phase5_schema.sql`): `profiles`, `cards_catalog`, `card_instances`, `market_listings`, `price_history`.
  - [x] Políticas de Row Level Security (RLS) y función RPC `check_and_consume_daily_scan` (FREE: 5 / PRO: 10 cartas/día).
  - [x] Función RPC `reserve_card_for_purchase` con bloqueo pesimista (`FOR UPDATE`).
  - [x] Edge Function `calculate-float` en Deno/TypeScript:
    - [x] Cálculo ponderado de desgaste óptico sobre 4 ejes.
    - [x] Slab Bypass para losas PSA/BGS/CGC con OCR.
    - [x] Detección y tasación histórica de cartas 'Santo Grial'.
    - [x] Firma criptográfica HMAC-SHA256 inmutable.
  - [x] Edge Function `lemonsqueezy-webhook` para activación automática de suscripciones PRO.
  - [x] Ingesta masiva de las 177 cartas físicas (120 Oficiales + 57 Genéricas) en `seed.sql` y `PhysicalCardSeeder.kt`.

---

## 🟡 Próxima Fase: Fase 6 (Marketplace, Bloqueo Concurrente y Red P2P CC311)

- [ ] **Hito 6.1:** Pantalla del Mercado con filtros por Grado y Tipo de Carta.
- [ ] **Hito 6.2:** Integración RPC `reserve_card_for_purchase` con el flujo de compra.
- [ ] **Hito 6.3:** Integración del SDK de Mercado Pago para compras C2C en Perú/LATAM.
- [ ] **Hito 6.4:** Protocolo P2P Wi-Fi Direct y Sockets TCP en puerto 8888 para intercambio local sin internet.
- [ ] **Hito 6.5:** Servicio en primer plano `CardexSyncService` con píldora dinámica continua.
