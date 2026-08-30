# Etapa 1: Plan de Trabajo, Cronograma y Gestión de Riesgos

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI  
> **Duración:** 8 Semanas (2 Meses) / 4 Sprints Quincenales  
> **Stack:** FastAPI + Nuxt 4 + PostgreSQL + Docker  
> **Basado en:** Guía `U1-A3-Lectura.pdf` 

---

## 1. Objetivos del Proyecto

### 1.1 Objetivo General
Desarrollar e implementar un sistema web de **Gestión Integral de TI** para una dependencia del Ministerio de Educación de Tucumán que erradique el trabajo ad-hoc, elimine los relevamientos físicos repetitivos mediante trazabilidad de componentes/ubicaciones, incorpore monitoreo preventivo de red con alertas y estandarice procesos en una Base de Conocimiento en un plazo de **8 semanas**.

### 1.2 Objetivos Específicos (SMART)
1. **Modelado y Análisis (Semanas 1-2):** Definir requerimientos funcionales y los roles del Ministerio.
2. **Diseño de Arquitectura y Base de Datos (Semanas 2-3):** Modelar las tablas de PostgreSQL (Activos, Componentes, Knowledge Base por Categorías, Tickets y Proyectos).
3. **Desarrollo del Backend & Agente (Semanas 3-5):** Implementar la API en FastAPI con tareas de ping en segundo plano y el script/agente de presencia para PCs.
4. **Desarrollo del Frontend (Semanas 5-6):** Construir en Nuxt 4 la interfaz reactiva con la cola de tareas auto-organizada para TI y el panel de consulta para Administración.
5. **Testing, QA y Despliegue (Semanas 7-8):** Validar flujos con Docker Compose, redactar manuales y realizar la presentación final.

---

## 2. Alcance del MVP (In Scope vs Out of Scope)

### 2.1 Incluido en el MVP (In Scope)
- [x] **Gestión de Identificación y Activos:** Asignación de ID Interno de inventario, N° de serie de fábrica y etiqueta patrimonial.
- [x] **Cambios de Componentes y Ubicación:** Registro de sustitución de partes y actualización de ubicación física.
- [x] **Monitoreo Preventivo de Red:** Pings periódicos a infraestructura (switches, APs, servidores) y recepción de latidos de agentes en PCs.
- [x] **Módulo de Alertas Configurables:** Notificación automática por inactividad de equipos o caída de servicios de red.
- [x] **Base de Conocimiento (KB) Categorizada:** Repositorio de procedimientos estandarizados por categorías.
- [x] **Gestión de Solicitudes y Proyectos TI:** Cola de tareas para el equipo técnico y solicitudes de usuarios.
- [x] **Vistas por Rol:** Perfil Técnico/Admin TI (acceso total), Área Administrativa (consulta de inventario/estado) y Usuario Interno (solicitud de asistencia).

### 2.2 Excluido del MVP (Out of Scope - Versiones Futuras)
- [ ] Telemetría avanzada del agente (análisis profundo de temperatura o discos SMART).
- [ ] Integración con servidores LDAP de la institución.

---

## 3. Planificación por Sprints (Cronograma de 8 Semanas)

| Sprint | Duración | Etapa SDLC | Entregables Principales | Estado |
| :--- | :--- | :--- | :--- | :---: |
| **Sprint 1** | Semanas 1 y 2 | Planificación y Requerimientos | Etapa 1 completada con datos del Ministerio de Educación de Tucumán, RF/RNF, Historias de Usuario y Flujos AS-IS/TO-BE. | 🟢 Completado |
| **Sprint 2** | Semanas 3 y 4 | Diseño y Backend API | Modelos de BD PostgreSQL (Trazabilidad, Agentes, KB), API en FastAPI con autenticación y motor de Pings en segundo plano. | ⚪ Pendiente |
| **Sprint 3** | Semanas 5 y 6 | Agente PC y Frontend Nuxt 4 | Agente de presencia en red para PCs, Vistas de Nuxt 4 (Cola de TI auto-organizada, Panel de Administración, KB y Tickets). | ⚪ Pendiente |
| **Sprint 4** | Semanas 7 y 8 | Testing, Docker y Cierre | Pruebas de integración, empaquetado con Docker Compose, Manuales de Usuario e Instalación y entrega final del TFI. | ⚪ Pendiente |

---

## 4. Matriz de Riesgos e Identificación de Mitigaciones

| Riesgo Identificado | Tipo | Impacto (1-5) | Probabilidad (1-5) | Estrategia de Mitigación / Acción Preventiva |
| :--- | :--- | :---: | :---: | :--- |
| **Tareas pausadas que no se retoman** | Operativo | 4 | 3 | Implementar vista o filtro rápido de *"Tareas Pausadas"* en la cola del equipo TI. |
| **Falsos positivos en monitoreo de red por PCs apagadas** | Funcional | 3 | 3 | Configurar umbrales de días de inactividad antes de generar alerta automática. |
| **Omisión de la actualización de información en el sistema al cambiar un componente** | Operativo | 4 | 2 | Hacer obligatorio marcar un casillero "Sin cambios" al editar los componentes de una PC. |

---

## 5. Criterios de Éxito del MVP

1. **Continuidad de Tareas:** Una tarea extensa (mantenimiento de sala) interrumpida por una emergencia puede pausarse y ser retomada posteriormente por cualquier técnico sin perder el avance.
2. **Eliminación del Relevamiento Físico Repetitivo:** Consulta instantánea del inventario por la administración.
3. **Monitoreo Preventivo:** El sistema alerta automáticamente cuando un equipo en red está inactivo por un período configurable.