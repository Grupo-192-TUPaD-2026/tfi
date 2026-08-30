# Etapa 1: Evaluación de Viabilidad del Proyecto

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI e Inventario de Recursos Tecnológicos  
> **Stack:** FastAPI (Python) + Nuxt 4 (Vue 3) + PostgreSQL  
> **Duración Objetivo:** 8 Semanas (2 Meses)  
> **Basado en:** Guía `U1-A3-Lectura.pdf`

---

## 1. Dimensiones de Viabilidad

---

### 1.1 Viabilidad Técnica
- **Backend (FastAPI - Python):**  
  FastAPI permite construir la API RESTful de la plataforma y, al mismo tiempo, incluir tareas programadas para ejecutar el monitoreo de presencia en red mediante pings a la infraestructura (switches, APs, servidores) y recepción de latidos (*heartbeats*) desde los agentes de las PCs.
  Los desarrolladores contamos con experiencia en Python.
- **Frontend (Nuxt 4 - Vue 3):**  
  Brinda una SPA reactiva y ligera. Permite construir tableros diferenciados: la cola de tareas para el equipo técnico y la vista de consulta rápida para el Área Administrativa.
  Los desarrolladores contamos con experiencia en JavaScript/TypeScript.
- **Base de Datos (PostgreSQL):**  
  Base de datos relacional. Adecuada para almacenar la información de inventario, componentes, ubicaciones, tickets, tareas y base de conocimiento.
  Una base de datos relacional es adecuada para este tipo de proyecto porque las entidades presentan muchas relaciones entre sí. Además PostgreSQL provee de características no-SQL con su soporte para JSONB, lo que permite almacenar información semi-estructurada como la de los componentes de una PC.
- **Agentes de PCs:**  
  Script liviano (Python / Bash / PowerShell) ejecutable en las computadoras de usuarios para reportar periódicamente su presencia a la API de FastAPI.
  Los desarrolladores contamos con experiencia en Python y tenemos capacidad de desarrollar pequeños scripts en Bash o PowerShell. 

---

### 1.2 Viabilidad Operativa
- **Alineación con la Cultura Institucional:**  
  La plataforma responde a la forma real de trabajo del equipo TI (auto-organizada, horizontal), eliminando la carga burocrática e introduciendo valor inmediato.
- **Eliminación del Relevamiento Físico Repetitivo:**  
  El Área Administrativa obtiene consulta autónoma del inventario, resolviendo la principal fuente de fricción operacional.
- **Mantenimiento Preventivo:**  
  Las alertas automáticas permiten al técnico intervenir un equipo fuera de línea antes de que el docente o empleado administrativo reporte la falla.

---

### 1.3 Viabilidad Temporal (Plazo de 8 Semanas)
- **Alcance del MVP Acotado:**  
  Desarrollo completo planificado en 8 semanas (4 Sprints quincenales), priorizando las 5 funciones clave:
  1. ABM de Inventario con componentes y ubicación.
  2. Monitoreo por Ping (infraestructura) + Agente (PCs) con Alertas.
  3. Base de Conocimiento categorizada para estandarizar procesos.
  4. Cola de Solicitudes/Tickets y Proyectos del área de TI.
  5. Vistas por Rol (Técnico/Admin TI, Área Administrativa, Usuario Interno).

---

## 2. Preguntas de Control y Cuestionamiento de Supuestos (`U1-A3`)

- **¿Qué dependencia crítica puede bloquear el desarrollo?**  
  Dificultad para testear el sistema de monitoreo de dispositivos en red y el agente de PCs.
- **¿Qué funcionalidad parece "necesaria" pero podría postergarse si se ajustan los tiempos?**  
  La funcionalidad de monitoreo de dispositivos en red.
- **¿Qué evidencia mínima necesitamos para validar que la solución aporta valor real?**  
  Generación de reportes de inventario rápidos y actualizados, que permitan conocer qué equipos están disponibles en qué ubicación y con qué características. 
