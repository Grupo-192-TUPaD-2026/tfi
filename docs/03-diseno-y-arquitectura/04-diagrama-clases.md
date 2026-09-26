# Diagrama de Clases (Modelo de Dominio)

Este diagrama representa las entidades del dominio de la aplicación, sus atributos, comportamiento principal y relaciones. Es el modelo orientado a objetos que luego se traduce a modelos de datos (SQLAlchemy) y al esquema relacional (ver `03-esquema-base-datos.md`).

```mermaid
classDiagram
    class Usuario {
        +int id
        +string nombre
        +string email
        -string passwordHash
        +bool activo
        +datetime createdAt
        +autenticar(password) bool
        +tieneRol(rol) bool
    }

    class Rol {
        +int id
        +string nombre
    }

    class Activo {
        +int id
        +string nombre
        +string numeroSerie
        +string estado
        +date fechaAlta
        +asignarA(usuario)
        +cambiarEstado(nuevoEstado)
        +registrarMovimiento(accion, detalle)
    }

    class CategoriaActivo {
        +int id
        +string nombre
    }

    class Ubicacion {
        +int id
        +string nombre
        +string descripcion
    }

    class HistorialActivo {
        +int id
        +string accion
        +string detalle
        +datetime fecha
    }

    class Ticket {
        +int id
        +string titulo
        +string descripcion
        +datetime fechaCreacion
        +datetime fechaActualizacion
        +datetime fechaCierre
        +cambiarEstado(nuevoEstado)
        +asignarTecnico(tecnico)
        +agregarComentario(texto, usuario)
        +vincularActivo(activo)
        +cerrar()
    }

    class EstadoTicket {
        +int id
        +string nombre
    }

    class Prioridad {
        +int id
        +string nombre
    }

    class ComentarioTicket {
        +int id
        +string texto
        +datetime fecha
    }

    class DispositivoMonitoreado {
        +int id
        +string ip
        +string tipo
        +int intervaloChequeoSeg
        +chequearEstado() RegistroMonitoreo
    }

    class RegistroMonitoreo {
        +int id
        +datetime timestamp
        +string estado
        +int latenciaMs
    }

    Usuario "N" --> "1" Rol : tiene
    Activo "N" --> "1" CategoriaActivo : clasificado por
    Activo "N" --> "0..1" Ubicacion : ubicado en
    Activo "N" --> "0..1" Usuario : asignado a
    Activo "1" --> "N" HistorialActivo : registra
    Usuario "1" --> "N" HistorialActivo : realiza

    Ticket "N" --> "1" Usuario : solicitado por
    Ticket "N" --> "0..1" Usuario : atendido por
    Ticket "N" --> "1" EstadoTicket : tiene
    Ticket "N" --> "1" Prioridad : tiene
    Ticket "N" --> "0..1" Activo : relacionado a
    Ticket "1" --> "N" ComentarioTicket : tiene
    Usuario "1" --> "N" ComentarioTicket : escribe

    DispositivoMonitoreado "0..1" --> "1" Activo : corresponde a
    DispositivoMonitoreado "1" --> "N" RegistroMonitoreo : genera
```

## Notas

- Los métodos listados representan el comportamiento de negocio esperado, no necesariamente firmas finales de código.
- Las clases catálogo (`Rol`, `CategoriaActivo`, `EstadoTicket`, `Prioridad`) son simples porque su función es solo tipificar a otras entidades.
- Este modelo de dominio es la base para las clases/modelos que se implementarán en el backend (SQLAlchemy + Pydantic sobre FastAPI); el mapeo a tablas relacionales está en `03-esquema-base-datos.md`.
