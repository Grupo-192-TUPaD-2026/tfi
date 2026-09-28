# Etapa 3: Diseño de API REST e Interfaces de Usuario (UI)

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI  
> **Entrega:** Segunda Entrega (Instancia 2 - Análisis y Diseño)

---

> **NOTA:**  Este documento es **tentativo** y está sujeto a cambios en futuras entregas.

## 1. Especificación de Endpoints (Contrato API RESTful)

Todas las respuestas de la API utilizan formato `JSON` y códigos de respuesta HTTP estándar (`200 OK`, `201 Created`, `400 Bad Request`, `401 Unauthorized`, `403 Forbidden`, `404 Not Found`, `500 Internal Error`).

### 1.1 Autenticación y Perfil (`/api/v1/auth`)

#### `POST /api/v1/auth/login`
* **Descripción:** Autentica usuario y emite Token JWT.
* **Request Body:**
  ```json
  {
    "email": "daniel.dantur@educaciontuc.gob.ar",
    "password": "Password123!"
  }
  ```
* **Response (200 OK):**
  ```json
  {
    "status": "success",
    "data": {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "token_type": "bearer",
      "user": {
        "id": 1,
        "nombre": "Daniel Dantur",
        "email": "daniel.dantur@educaciontuc.gob.ar",
        "rol": "Administrador TI"
      }
    }
  }
  ```

---

### 1.2 Módulo de Inventario y Trazabilidad (`/api/v1/equipos` y `/api/v1/componentes`)

#### `GET /api/v1/equipos`
* **Descripción:** Lista paginada de equipos de hardware con filtros y especificaciones dinámicas.
* **Headers:** `Authorization: Bearer <token>`
* **Query Params:** `estado=OPERATIVO&ubicacion_id=8&page=1&limit=10`
* **Response (200 OK):**
  ```json
  {
    "status": "success",
    "total": 45,
    "page": 1,
    "data": [
      {
        "id": 1,
        "codigo_inventario": "EQ-PC-001",
        "numero_serie": "SN-DELL-99812",
        "etiqueta_patrimonial": "MIN-EDUC-2024-001",
        "tipo_equipo": "PC",
        "marca": "Dell",
        "modelo": "OptiPlex 3080",
        "especificaciones": {
          "procesador": "Intel Core i5-10500",
          "ram_gb": 16,
          "disco": "SSD 512GB",
          "so": "Windows 11 Pro"
        },
        "estado": "OPERATIVO",
        "posicion_detalle": "Puesto 3",
        "ubicacion": "Oficina de Coordinación Educativa",
        "usuario_asignado": "Roberto Pérez"
      }
    ]
  }
  ```

#### `POST /api/v1/componentes/trasladar`
* **Descripción:** Registra el movimiento de un componente entre equipos o depósito.
* **Headers:** `Authorization: Bearer <token>`
* **Request Body:**
  ```json
  {
    "componente_id": 3,
    "equipo_destino_id": 1,
    "motivo_movimiento": "Ampliación de memoria RAM por requerimiento administrativo."
  }
  ```
* **Response (200 OK):**
  ```json
  {
    "status": "success",
    "message": "Componente trasladado exitosamente e historial actualizado."
  }
  ```

---

### 1.3 Módulo de Tareas y Tickets (`/api/v1/tickets`)

#### `GET /api/v1/tickets`
* **Descripción:** Obtiene los tickets organizados para el Tablero Kanban.
* **Headers:** `Authorization: Bearer <token>`
* **Response (200 OK):**
  ```json
  {
    "status": "success",
    "data": [
      {
        "id": 1,
        "codigo_ticket": "TICK-2026-001",
        "titulo": "Falla de encendido en PC Oficina 2",
        "prioridad": "Critico",
        "estado": "En Proceso",
        "solicitante": "Roberto Pérez",
        "tecnico_asignado": "Daniel Dantur",
        "fecha_creacion": "2026-09-26T10:00:00Z"
      }
    ]
  }
  ```

#### `PATCH /api/v1/tickets/{id}/estado`
* **Descripción:** Actualiza el estado de un ticket en el Kanban (requiere nota si pasa a `Pausado`).
* **Headers:** `Authorization: Bearer <token>`
* **Request Body (Transición a Pausado):**
  ```json
  {
    "nuevo_estado": "Pausado",
    "nota_avance": "Se completó la limpieza de componentes. Se suspende temporalmente por atención urgente de falla en servidor principal."
  }
  ```
* **Response (200 OK):**
  ```json
  {
    "status": "success",
    "message": "Estado del ticket actualizado a Pausado con nota de avance registrada."
  }
  ```

---

### 1.4 Monitoreo y Latidos (`/api/v1/monitoreo`)

#### `POST /api/v1/monitoreo/latidos`
* **Descripción:** Endpoint seguro (vía token de agente) para recepción de telemetría pasiva enviada cada 5 minutos por las estaciones de trabajo. El backend ejecuta un `UPSERT` atómico en la tabla `estado_agente`.
* **Request Body:**
  ```json
  {
    "equipo_id": 1,
    "hostname_reportado": "PC-COORDINACION",
    "ip_local_reportada": "192.168.1.45",
    "usuario_so_actual": "rperez",
    "version_agente": "1.0.4",
    "disco_libre_gb": 120.4,
    "metricas_extra": {
      "so": "Windows 11 Pro 64-bit",
      "uptime_hs": 72
    }
  }
  ```
* **Response (200 OK / 201 Created):**
  ```json
  {
    "status": "success",
    "message": "Latido registrado y estado de agente actualizado exitosamente."
  }
  ```

---

## 2. Diseño de Interfaces de Usuario (UX / UI)

### 2.1 Vista: Login (`/login`)
- Formulario accesible con validaciones cliente en tiempo real.
- Selector visual de correo institucional y contraseña.
- Almacenamiento seguro del JWT en cookies `httpOnly` o `localStorage`.

### 2.2 Vista: Tablero Kanban de Tickets (`/tickets`)
- **Columnas de estado:** `Pendiente`, `En Proceso`, `En Espera`, `Pausado`, `Cancelado`, `Terminado`.
- Badges de color por **Prioridad**: Rojo (`Crítico`), Verde (`Estratégico`), Amarillo (`Operativo`), Gris (`Opcional`).
- **Drag & Drop / Modal de Cambio de Estado:** Al arrastrar una tarjeta a la columna `Pausado`, la UI despliega de forma automática un modal emergente que bloquea el guardado hasta que el técnico complete la **nota de avance**.

### 2.3 Vista: Grilla de Inventario Dinámico (`/inventario`)
- Tabla filtrable en tiempo real con búsqueda por Código de Inventario, N° de Serie o Etiqueta Patrimonial.
- Botón de acción rápida: *"Ver Historial de Componentes"* y *"Asignar Repuesto"*.

### 2.4 Vista: Dashboard de Monitoreo Preventivo (`/monitoreo`)
- Tarjetas superiores (*Stats*) con total de equipos Online / Offline.
- Gráfico de disponibilidad de red y alertas no atendidas / pendientes.
