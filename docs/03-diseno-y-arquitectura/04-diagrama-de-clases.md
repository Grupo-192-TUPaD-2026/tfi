# Etapa 3: Diagrama de Clases (Modelo de Dominio Orientado a Objetos)

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI  
> **Entrega:** Segunda Entrega (Instancia 2 - Análisis y Diseño)

---

## 1. Presentación del Modelo de Clases

Este diagrama representa el **Modelo de Dominio Orientado a Objetos (OOD)** del sistema. Define las entidades conceptuales, sus atributos (con visibilidad pública/privada), métodos principales de negocio y las asociaciones entre clases.

Sirve de puente conceptual entre los Requerimientos Funcionales (`docs/02-requerimientos-y-analisis/02-requerimientos-funcionales-y-no-funcionales.md`), los modelos ORM que se implementarán en FastAPI (SQLAlchemy / Pydantic) y el esquema relacional PostgreSQL (`/database/schema.sql`).

---

## 2. Diagrama de Clases en Mermaid

```mermaid
classDiagram
    class Rol {
        +int id
        +string nombre
        +string descripcion
    }

    class Usuario {
        +int id
        +string nombre
        +string apellido
        +string email
        -string passwordHash
        +bool activo
        +datetime creadoEn
        +autenticar(password) bool
        +esAdministradorTI() bool
        +esAdministrativo() bool
    }

    class Ubicacion {
        +int id
        +string nombre
        +tipo_ubicacion_enum tipoUbicacion
        +string rutaJerarquica
        +string descripcion
        +obtenerRutaCompleta() string
        +obtenerSubUbicaciones() List~Ubicacion~
    }

    class TipoEquipo {
        +int id
        +string nombre
        +string icono
        +jsonb esquemaEspecificaciones
    }

    class Equipo {
        +int id
        +string codigoInventario
        +string numeroSerie
        +string etiquetaPatrimonial
        +string marca
        +string modelo
        +jsonb especificaciones
        +estado_equipo_enum estado
        +string posicionDetalle
        +date fechaAlta
        +asignarUsuario(usuario)
        +trasladarUbicacion(ubicacion, posicion)
        +cambiarEstado(nuevoEstado)
        +actualizarEspecificaciones(jsonSpecs)
        +configurarRed(ip, mac, intervaloPing)
    }

    class MonitoreoRed {
        +int id
        +string hostnameRed
        +string direccionIp
        +string macAddress
        +int intervaloPingSeg
        +datetime ultimoPing
        +bool estadoOnline
        +int umbralDiasOffline
        +ejecutarPing() bool
        +marcarOffline()
    }

    class EstadoAgente {
        +int id
        +string hostnameReportado
        +string ipLocalReportada
        +string usuarioLogueado
        +string versionAgente
        +float discoLibreGb
        +jsonb metricasExtra
        +datetime ultimoLatido
        +int umbralDiasInactivo
        +registrarLatido(datosTelemetria)
        +estaOnline() bool
    }

    class TipoComponente {
        +int id
        +string nombre
        +jsonb esquemaEspecificaciones
    }

    class Componente {
        +int id
        +string codigoComponente
        +string marcaModelo
        +jsonb especificaciones
        +estado_componente_enum estado
        +string origen
        +date fechaInstalacion
        +instalarEnEquipo(equipo)
        +trasladarADeposito(ubicacion)
        +marcarDefectuoso(ubicacionDestino)
        +obtenerUbicacionEfectiva() Ubicacion
    }

    class HistorialComponente {
        +int id
        +string motivoMovimiento
        +datetime fechaMovimiento
    }

    class Ticket {
        +int id
        +string codigoTicket
        +string titulo
        +string descripcion
        +prioridad_ticket_enum prioridad
        +estado_ticket_enum estado
        +datetime fechaCreacion
        +datetime fechaActualizacion
        +datetime fechaCierre
        +cambiarEstado(nuevoEstado, notaAvance)
        +asignarTecnico(tecnico)
        +vincularProcedimientoKB(articulo)
        +vincularEquipo(equipo)
    }

    class HistorialTicket {
        +int id
        +string estadoAnterior
        +string estadoNuevo
        +string notaAvance
        +datetime fechaCambio
    }

    class CategoriaKB {
        +int id
        +string nombre
        +string descripcion
        +string icono
    }

    class ArticuloKB {
        +int id
        +string titulo
        +string slug
        +string contenidoMarkdown
        +string tags
        +actualizarContenido(nuevoMarkdown)
    }

    class AlertasSistema {
        +int id
        +string tipoAlerta
        +nivel_alerta_enum nivel
        +string mensaje
        +bool atendida
        +datetime fechaAlerta
        +datetime fechaAtencion
        +atender(usuario)
    }

    %% Relaciones de Dominio
    Usuario "N" --> "1" Rol : posee
    Usuario "N" --> "0..1" Ubicacion : trabaja_en

    Ubicacion "0..1" <-- "N" Ubicacion : contenida_en
    TipoEquipo "1" <-- "N" Equipo : clasificado_por
    Equipo "N" --> "1" Ubicacion : albergado_en
    Equipo "N" --> "0..1" Usuario : asignado_a
    Equipo "1" *-- "0..1" MonitoreoRed : monitoreo_activo (Ping)
    Equipo "1" *-- "0..1" EstadoAgente : telemetria_pasiva (Agente)

    TipoComponente "1" <-- "N" Componente : clasificado_por
    Componente "N" --> "0..1" Equipo : instalado_en (XOR)
    Componente "N" --> "0..1" Ubicacion : almacenado_en (XOR)
    Componente "1" --> "N" HistorialComponente : traza
    HistorialComponente "N" --> "0..1" Equipo : equipo_origen
    HistorialComponente "N" --> "0..1" Equipo : equipo_destino
    HistorialComponente "N" --> "0..1" Ubicacion : ubicacion_origen
    HistorialComponente "N" --> "0..1" Ubicacion : ubicacion_destino
    HistorialComponente "N" --> "1" Usuario : realizado_por

    Ticket "N" --> "1" Usuario : solicitado_por
    Ticket "N" --> "0..1" Usuario : atendido_por
    Ticket "N" --> "0..1" Equipo : asociado_a
    Ticket "N" --> "0..1" ArticuloKB : resuelto_con
    Ticket "1" --> "N" HistorialTicket : audita
    HistorialTicket "N" --> "1" Usuario : registrado_por

    ArticuloKB "N" --> "1" CategoriaKB : pertenece_a
    ArticuloKB "N" --> "1" Usuario : redactado_por

    AlertasSistema "N" --> "1" Equipo : origen_equipo
    AlertasSistema "N" --> "0..1" Usuario : atendida_por
```

---

## 3. Descripción de Clases Principales y Responsabilidades

### 3.1 Módulo de Seguridad y Usuarios (`Usuario`, `Rol`)
* **`Usuario`**: Modela a las personas registradas en el sistema. Métodos para autenticar contraseña y validar rol asignado. Se relaciona opcionalmente a una `Ubicacion` de trabajo física.
* **`Rol`**: Modela los perfiles de acceso (`Administrador TI`, `Área Administrativa`, `Usuario Interno`).

### 3.2 Módulo de Ubicaciones y Granularidad Jerárquica (`Ubicacion`)
* **`Ubicacion`**: Implementa el patrón jerárquico de árbol (auto-referencial `contenida_en`). Utiliza el enum `tipo_ubicacion_enum` (`SEDE`, `EDIFICIO`, `PISO`, `OFICINA`, `DEPOSITO`, `ARMARIO`, `RACK`).
* **Métodos**: `+obtenerRutaCompleta()` concatena los nombres según el Materialized Path `rutaJerarquica` (ej: `Sede Central / Piso 1 / Sala de Servidores / Rack Principal`), y `+obtenerSubUbicaciones()` retorna las ubicaciones hijas contenidas.

### 3.3 Módulo de Catálogos y Formularios Dinámicos (`TipoEquipo`, `TipoComponente`)
* **`TipoEquipo`**: Catálogo de clasificadores de hardware (`PC`, `IMPRESORA`, `SWITCH`, `PROYECTOR`, `UPS`, `SERVIDOR`). Contiene `esquemaEspecificaciones` en **JSONB** para generar dinámicamente los formularios del Frontend.
* **`TipoComponente`**: Catálogo de repuestos (`RAM`, `ALMACENAMIENTO`, `CPU`, `FUENTE`, `PLACA_RED`). Almacena los esquemas de especificaciones técnicas.

### 3.4 Módulo de Inventario Dinámico y Trazabilidad de Hardware (`Equipo`, `Componente`, `HistorialComponente`)
* **`Equipo`**: Representa cualquier equipo físico clasificado por `TipoEquipo`. Atributo `estado` de tipo `estado_equipo_enum` (`OPERATIVO`, `EN_REPARACION`, `EN_DEPOSITO`, `BAJA`).
* **`Componente`**: Representa repuestos internos. Atributo `estado` de tipo `estado_componente_enum` (`DISPONIBLE`, `INSTALADO`, `DEFECTUOSO`, `BAJA`). Implementa relación XOR entre `Equipo` y `Ubicacion` de stock.
* **`HistorialComponente`**: Clase de auditoría que registra los movimientos de partes entre equipos y/o ubicaciones físicas.

### 3.5 Módulo de Monitoreo Preventivo y Telemetría (`MonitoreoRed`, `EstadoAgente`, `AlertasSistema`)
* **`MonitoreoRed`**: Composición 1 a 0..1 del `Equipo` para supervisión activa ICMP Ping.
* **`EstadoAgente`**: Composición 1 a 0..1 del `Equipo` que mantiene el estado actual de telemetría pasiva reportado por el agente cliente en cada estación de trabajo.
* **`AlertasSistema`**: Alertas preventivas emitidas automáticamente utilizando el enum `nivel_alerta_enum` (`INFO`, `ADVERTENCIA`, `CRÍTICO`).

### 3.6 Módulo de Tareas y Soporte (`Ticket`, `HistorialTicket`)
* **`Ticket`**: Representa las solicitudes de soporte del Tablero Kanban. Utiliza los enums `prioridad_ticket_enum` (`OPCIONAL`, `OPERATIVO`, `ESTRATÉGICO`, `CRÍTICO`) y `estado_ticket_enum` (`PENDIENTE`, `EN_PROGRESO`, `EN_ESPERA`, `PAUSADO`, `CANCELADO`, `RESUELTO`).
* **`HistorialTicket`**: Registra la bitácora cronológica de transiciones de estado de cada ticket.

### 3.7 Módulo de Base de Conocimiento (`ArticuloKB`, `CategoriaKB`)
* **`ArticuloKB`**: Modela procedimientos y soluciones técnicas en Markdown asociables a tickets resueltos.
