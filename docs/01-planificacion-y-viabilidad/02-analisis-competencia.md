# Etapa 1: Análisis de Competencia y Diferenciación

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI  
> **Basado en:** Guía `U1-A3-Lectura.pdf`

---

## 1. Contexto de Mercado e Institucional

En el ámbito del sector público provincial (Ministerio de Educación de Tucumán), la adquisición de licencias comerciales de software corporativo (como Jira, ServiceNow o SolarWinds) resulta inviable por costos presupuestarios y rigidez administrativa. Por otro lado, las alternativas open-source tradicionales (como GLPI) son percibidas como complejas y difíciles de adaptar a la dinámica de trabajo del equipo de TI.

Las alternativas informales (notas verbales, planillas) se suelen confeccionar con fines específicos y la información recolectada no vuelve a ser utilizada de manera sistemática.

Nuestra propuesta resuelve estas falencias integrando la gestión de tareas mediante tickets junto al inventario dinámico y monitoreo de red.

---

## 2. Matriz Comparativa de Soluciones

| Criterio de Comparación | GLPI / OCS Inventory | Relevamiento Manual / Verbal (Solución Actual) | **Nuestra Propuesta** |
| :--- | :--- | :--- | :--- |
| **Gestión de Tareas y Tickets** | Rígido por flujos complejos de soporte | Inexistente | **Tablero Kanban con estados extensibles** |
| **Seguimiento de Tareas Largas** | Configuración avanzada/compleja. No apto para equipos pequeños | Las tareas largas quedan inconclusas/abandonadas al surgir urgencias | **Asignación de estado Pausado/En Curso, contador de días y nota de avance** |
| **Identificación de Equipos** | Carga compleja | Listado plano manual solo con datos según requerimiento específico | **ID Interno automático + serial de fábrica + atributos a medida + listado de componentes + ubicación física** |
| **Monitoreo de Computadoras en la Red** | Requiere plugins de pago | Inexistente (se descubre la falla cuando el usuario avisa) | **Agente liviano para PCs + Alertas** |
| **Organización del Equipo TI** | Rígida por jerarquía | Asignación ad-hoc verbal | **Cola de tareas plana con filtros por prioridad y estado** |
| **Consulta Administrativa** | Requiere permisos de agente TI | Esperar a un nuevo relevamiento físico completo | **Tablero de lectura rápida para el Área Administrativa** |

---

## 3. Identificación de Competidores y Alternativas

### 3.1 Competidores Directos / Alternativas Open Source
* **GLPI + OCS Inventory:** Es la referencia en el mundo open source para inventario de TI. Sin embargo, su interfaz de usuario es poco amigable, requiere amplia curva de configuración. El equipo TI intentó usar GLPI en el pasado, pero lo abandonó debido a la complejidad y falta de adaptabilidad a sus necesidades.

### 3.2 Solución Actual (Competidor Indirecto)
* **Relevamientos Físicos Periódicos (Excel / Papel):** Proceso manual donde el equipo TI debe recorrer periódicamente oficinas y aulas para contar computadoras. Es el principal problema a erradicar, ya que consume recursos humanos de manera repetitiva sin mantener datos actualizados y provoca el abandono de tareas de mantenimiento por interrupciones ad-hoc.

---

## 4. Factores Diferenciadores (Propuesta Única de Valor)

1. **Gestión de Tareas en Kanban con Pausa y Reanudación Controlada:**  
   Garantiza que ante una solicitud urgente que interrumpa un mantenimiento extenso (ej: Sala de Computación), la tarea quede en estado `Pausado` registrando el avance exacto alcanzado, permitiendo que cualquier técnico del equipo la retome sin perder el trabajo realizado.
2. **Clasificación por Prioridades Institucionales:**  
   Asignación clara de niveles: `Crítico` (de atención prioritaria), `Estratégico` (proyectos y mantenimientos de salas), `Operativo` (soporte a usuarios/reseteos) u `Opcional` (mejoras menores).
3. **Monitoreo Preventivo y Alertas Automatizadas:**  
   Pings a la infraestructura de red e información de agentes en PCs para adelantarse a las fallas.
4. **Flujo Auto-organizado para Equipos de TI y Consulta Administrativa:**  
   Visibilidad compartida para el equipo técnico y vista de lectura rápida para la Administración sin requerir relevamientos físicos.

---

## 5. Simulación de Escenarios Competitivos (`U1-A3`)

- **¿Qué características son las mínimas indispensables para el MVP?**  
  1. ABM de Activos con ID Interno y trazabilidad de componentes/ubicación.  
  2. Tablero Kanban de Tickets con prioridades (`Crítico`, `Estratégico`, `Operativo`, `Opcional`) y estado `Pausado`.  
  3. Monitoreo por Ping de infraestructura + reporte de agentes para PCs.  
  4. Módulo de Alertas configurables.  
  5. Repositorio de Procesos (Base de Conocimiento) por categorías.  
  6. Perfil de visualización para el Área Administrativa.
