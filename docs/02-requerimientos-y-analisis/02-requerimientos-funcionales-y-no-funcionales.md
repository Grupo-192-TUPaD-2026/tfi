# Etapa 2: Especificación de Requerimientos Funcionales y No Funcionales

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI

---

## 1. Requerimientos Funcionales (RF)

### 1.1 Módulo de Inventario Dinámico y Trazabilidad de Componentes
| Código | Requerimiento Funcional | Prioridad |
| :--- | :--- | :---: |
| **RF-01** | **Identificación Unívoca de Activos:** El sistema debe asignar un ID único interno a cada equipo y permitir registrar de forma opcional el N° de Serie de fábrica y la Etiqueta de Patrimonio ministerial. | 🔴 Alta |
| **RF-02** | **Trazabilidad de Componentes y Origen:** El sistema debe permitir registrar las modificaciones de hardware (RAM, Disco, Fuente, etc.) actualizando los componentes del equipo o depósito de origen. | 🔴 Alta |
| **RF-03** | **Gestión de Ubicación Física:** El sistema debe permitir actualizar la ubicación física de cada equipo (Oficinas, Aulas, Sectores). | 🔴 Alta |
| **RF-04** | **Vista de Inventario para Administración:** El sistema debe ofrecer una vista exclusiva de consulta y filtrado de activos en tiempo real accesible para el Área Administrativa. | 🟡 Media |

---

### 1.2 Módulo de Tareas y Tickets (Tablero Kanban)
| Código | Requerimiento Funcional | Prioridad |
| :--- | :--- | :---: |
| **RF-05** | **Clasificación por Prioridad Institucional:** El sistema debe permitir asignar a cada ticket o tarea una prioridad entre: `Crítico`, `Estratégico`, `Operativo` u `Opcional`. | 🔴 Alta |
| **RF-06** | **Tablero Kanban de Estados:** El sistema debe mostrar un tablero visual colaborativo con las columnas: `Pendiente`, `En Proceso`, `En Espera`, `Pausado`, `Cancelado` y `Terminado`. | 🔴 Alta |
| **RF-07** | **Pausa con Registro de Avance:** Al cambiar un ticket a estado `Pausado`, el sistema debe exigir ingresar una nota breve describiendo el avance realizado antes de la suspensión. | 🔴 Alta |
| **RF-08** | **Auto-organización del Equipo TI:** Cualquier integrante del equipo TI debe poder visualizar, tomar y reanudar una tarea en pausa del tablero común. | 🟡 Media |

---

### 1.3 Módulo de Monitoreo Preventivo de Red y Alertas
| Código | Requerimiento Funcional | Prioridad |
| :--- | :--- | :---: |
| **RF-09** | **Monitoreo por Ping de Infraestructura:** El backend debe realizar pings periódicos a dispositivos de red (routers, APs, switches) y servidores para verificar su estado online/offline. | 🟡 Media |
| **RF-10** | **Recepción de Latidos de PCs:** El sistema debe proveer un endpoint API para recibir latidos (*heartbeats*) periódicos desde los agentes instalados en las PCs de los usuarios. | 🟡 Media |
| **RF-11** | **Generación de Alertas Preventivas:** El sistema debe emitir alertas configurables en el panel de TI cuando un dispositivo de red cae o una PC permanece inactiva por más de X días. | 🟡 Media |

---

### 1.4 Módulo de Base de Conocimiento (KB)
| Código | Requerimiento Funcional | Prioridad |
| :--- | :--- | :---: |
| **RF-12** | **Categorización de Procedimientos:** El sistema debe permitir publicar guías y procedimientos técnicos agrupados en categorías organizadas para su rápida búsqueda. | 🟢 Baja |
| **RF-13** | **Vinculación Ticket-KB:** El técnico debe poder asociar un artículo de la KB al resolver un ticket o crear un procedimiento a partir de una solución dada. | 🟢 Baja |

---

## 2. Requerimientos No Funcionales (RNF)

### 2.1 Rendimiento y Escalabilidad
* **RNF-01 (Velocidad de Respuesta):** Los endpoints de la API en FastAPI deben responder en menos de 200ms para consultas de grilla e inventario.
* **RNF-02 (Carga de Agentes):** El procesamiento de latidos de red desde las PCs de los usuarios debe realizarse de forma asíncrona en el backend sin bloquear la base de datos.

### 2.2 Seguridad y Autenticación
* **RNF-03 (Autenticación JWT):** Inicio de sesión seguro mediante tokens JWT y encriptación de contraseñas con bcrypt.
* **RNF-04 (Control de Acceso Basado en Roles - RBAC):** Restricción de permisos según el perfil (`TI / Administración / Usuario Interno`).

### 2.3 Usabilidad e Interfaz
* **RNF-05 (Interfaz SPA Reactiva):** Desarrollo en **Nuxt 4** que permita mover tarjetas en el Tablero Kanban y filtrar inventario sin recargar la página.
* **RNF-06 (Diseño Responsive):** Adaptación gráfica a pantallas de escritorio, notebooks y tablets utilizadas por los técnicos en relevamientos de campo.

### 2.4 Mantenibilidad y Despliegue
* **RNF-07 (Contenedorización):** Despliegue empaquetado mediante Docker Compose (FastAPI + Nuxt 4 + PostgreSQL).
