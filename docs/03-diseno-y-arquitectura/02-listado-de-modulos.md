# Listado de Módulos Funcionales

**Proyecto:** Sistema de Gestión Integral de TI
**Estudiantes:** Diego Cornejo - Daniel Dantur

Este listado define el alcance funcional comprometido para la entrega final. Se priorizó un núcleo de módulos viable para el tiempo disponible, dejando explícitamente fuera de alcance (ver sección "Extensiones futuras") funcionalidades que excederían el marco de un TFI.

## 1. Autenticación y Gestión de Usuarios
**Prioridad: Alta**
Registro e inicio de sesión de usuarios del sistema, con roles diferenciados (Administrador, Técnico, Usuario/Solicitante). Permite gestionar altas, bajas y modificaciones de cuentas, y restringe el acceso a funcionalidades según el rol.

## 2. Inventario de Activos IT
**Prioridad: Alta**
ABM de dispositivos (PCs, notebooks, impresoras, switches, routers, access points, etc.), con categoría, número de serie, ubicación/sector, usuario asignado y estado (activo, en reparación, de baja). Incluye historial de movimientos y cambios de cada activo.

## 3. Gestión de Tickets (Mesa de Ayuda)
**Prioridad: Alta**
Creación y seguimiento de solicitudes de soporte. Cada ticket tiene estado (Pendiente, En Proceso, En Espera, Pausado, Cancelado, Terminado), prioridad, técnico asignado, comentarios de seguimiento, y puede vincularse opcionalmente a un activo del inventario.

## 4. Monitoreo de Red
**Prioridad: Alta**
Chequeo periódico (ping/SNMP) sobre dispositivos de infraestructura registrados (servidores, switches, access points), con registro de disponibilidad (online/offline) e historial de caídas. El monitoreo se limita a infraestructura de red; no incluye agentes instalados en estaciones de usuario (ver Extensiones futuras).

## 5. Panel de Consulta / Dashboard
**Prioridad: Media**
Vista consolidada con indicadores generales: cantidad de tickets abiertos por estado/prioridad, estado del inventario, disponibilidad de la infraestructura monitoreada. Actualización mediante refresco periódico (no requiere WebSockets ni tiempo real estricto).

## 6. Documentación de Procedimientos
**Prioridad: Baja**
Campo de notas/procedimientos asociado a tickets y activos, para registrar soluciones aplicadas y facilitar la resolución de casos similares a futuro. No se implementa como módulo de base de conocimiento independiente (buscador, versionado, etc.).

---

## Extensiones futuras (fuera del alcance comprometido)

Se identificaron funcionalidades de valor para el producto pero que exceden el alcance razonable de un TFI, y quedan documentadas como líneas de trabajo futuro:

- **Agentes livianos en estaciones de usuario** para monitoreo proactivo (detección de fallas antes del reporte del usuario). Requiere desarrollo de un componente cliente independiente, protocolo de comunicación agente-servidor y gestión de despliegue/permisos.
- **Base de conocimiento completa** con buscador, categorización y versionado de artículos.
- **Tablero colaborativo en tiempo real** vía WebSockets para el área administrativa.

Estas quedan mencionadas en la propuesta de valor del producto, pero no forman parte de los módulos a implementar y evaluar en este TFI.
