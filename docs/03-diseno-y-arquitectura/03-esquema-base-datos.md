# Esquema de Base de Datos

**Motor:** PostgreSQL (relacional)
**Script DDL:** ver `/database/schema.sql`

## Diagrama Entidad-Relación

```mermaid
erDiagram
    ROLES ||--o{ USUARIOS : tiene
    USUARIOS ||--o{ ACTIVOS : "asignado a"
    UBICACIONES ||--o{ ACTIVOS : ubicado_en
    CATEGORIAS_ACTIVO ||--o{ ACTIVOS : clasifica
    ACTIVOS ||--o{ HISTORIAL_ACTIVOS : registra
    USUARIOS ||--o{ HISTORIAL_ACTIVOS : realiza

    USUARIOS ||--o{ TICKETS : solicita
    USUARIOS ||--o{ TICKETS : atiende
    ESTADOS_TICKET ||--o{ TICKETS : tiene
    PRIORIDADES ||--o{ TICKETS : tiene
    ACTIVOS ||--o{ TICKETS : "relacionado a (opcional)"
    TICKETS ||--o{ COMENTARIOS_TICKET : tiene
    USUARIOS ||--o{ COMENTARIOS_TICKET : escribe

    ACTIVOS ||--o| DISPOSITIVOS_MONITOREADOS : "puede ser"
    DISPOSITIVOS_MONITOREADOS ||--o{ REGISTROS_MONITOREO : genera

    ROLES {
        int id PK
        string nombre
    }
    USUARIOS {
        int id PK
        string nombre
        string email
        string password_hash
        int rol_id FK
        boolean activo
        datetime created_at
    }
    UBICACIONES {
        int id PK
        string nombre
        string descripcion
    }
    CATEGORIAS_ACTIVO {
        int id PK
        string nombre
    }
    ACTIVOS {
        int id PK
        string nombre
        int categoria_id FK
        string numero_serie
        int ubicacion_id FK
        int usuario_asignado_id FK
        string estado
        date fecha_alta
    }
    HISTORIAL_ACTIVOS {
        int id PK
        int activo_id FK
        int usuario_id FK
        string accion
        string detalle
        datetime fecha
    }
    ESTADOS_TICKET {
        int id PK
        string nombre
    }
    PRIORIDADES {
        int id PK
        string nombre
    }
    TICKETS {
        int id PK
        string titulo
        string descripcion
        int usuario_solicitante_id FK
        int tecnico_asignado_id FK
        int activo_relacionado_id FK
        int estado_id FK
        int prioridad_id FK
        datetime fecha_creacion
        datetime fecha_actualizacion
        datetime fecha_cierre
    }
    COMENTARIOS_TICKET {
        int id PK
        int ticket_id FK
        int usuario_id FK
        string comentario
        datetime fecha
    }
    DISPOSITIVOS_MONITOREADOS {
        int id PK
        int activo_id FK
        string ip
        string tipo
        int intervalo_chequeo_seg
    }
    REGISTROS_MONITOREO {
        int id PK
        int dispositivo_id FK
        datetime timestamp
        string estado
        int latencia_ms
    }
```

## Notas de diseño

- **Claves primarias:** todas las tablas usan `id` autoincremental (`SERIAL`/`BIGSERIAL`) como PK.
- **Claves foráneas:** `usuarios.rol_id → roles.id`, `activos.categoria_id → categorias_activo.id`, `activos.ubicacion_id → ubicaciones.id`, `activos.usuario_asignado_id → usuarios.id`, `tickets.usuario_solicitante_id / tecnico_asignado_id → usuarios.id`, `tickets.activo_relacionado_id → activos.id` (nullable), `tickets.estado_id → estados_ticket.id`, `tickets.prioridad_id → prioridades.id`, `dispositivos_monitoreados.activo_id → activos.id`, `registros_monitoreo.dispositivo_id → dispositivos_monitoreados.id`.
- **Índices principales:** sobre las FK más consultadas (`tickets.estado_id`, `tickets.usuario_solicitante_id`, `registros_monitoreo.dispositivo_id`, `registros_monitoreo.timestamp`) para optimizar los listados y el dashboard.
- **Tablas catálogo** (`roles`, `estados_ticket`, `prioridades`, `categorias_activo`) se modelan como tablas propias (no ENUM) para poder agregar valores sin migrar el esquema.
- **`activo_relacionado_id`** en `tickets` es nullable: un ticket no siempre está asociado a un activo puntual.
- **`dispositivos_monitoreados`** referencia opcionalmente un `activo_id`: permite monitorear infraestructura ya cargada en el inventario sin duplicar datos.
