# Etapa 2: Stakeholders y Análisis de Actores

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI  
> **Basado en:** Guía `U1-A1.pdf` 
---

## 1. Identificación de Actores del Sistema

El sistema sirve a tres grupos de usuarios principales en la institución:

1. **Equipo Técnico de TI:** Equipo horizontal sin jerarquías rígidas que gestiona la plataforma, atiende incidentes, ejecuta mantenimientos y mantiene la base de conocimiento.
2. **Área Administrativa:** Personal del Ministerio que consulta el inventario actualizado y el estado operativo de los equipos sin depender de relevamientos manuales.
3. **Usuarios Internos / Docentes / Personal:** Empleados y docentes de la dependencia que generan solicitudes de soporte y consultan el estado de sus requerimientos.

---

## 2. Matriz de Actores, Necesidades y Expectativas

| Rol / Actor | Tipo de Usuario | Descripción / Responsabilidades | Necesidades Principales | Limitaciones u Obstáculos |
| :--- | :--- | :--- | :--- | :--- |
| **Técnico / Administrador TI** | Interno (Directo / Privilegiado) | Equipo plano auto-organizado. Registro de activos, resolución de tickets, actualización de ubicaciones/partes, monitoreo de red y creación de procedimientos KB. | Tablero Kanban ágil con estados (Pendiente, En Proceso, En Espera, Pausado, Cancelado, Terminado), priorización clara (Crítico, Estratégico, Operativo, Opcional) y trazabilidad de componentes. | Sobrecarga de tareas ad-hoc e interrupción constante de tareas largas sin un registro de estado. |
| **Área Administrativa** | Interno (Directo / Lectura) | Consulta del patrimonio tecnológico e inventario de hardware/software de la dependencia. | Visualizar la lista de computadoras y su estado actual en tiempo real sin requerir relevamientos físicos. | No interactúa con el soporte técnico; requiere reportes limpios y fáciles de interpretar. |
| **Usuario Interno / Docente** | Interno (Directo / Cliente) | Personal administrativo o docente que utiliza las computadoras de la dependencia. | Registrar solicitudes de soporte (fallas de hardware, reseteo de claves) y ver el estado de su atención. | Variabilidad de competencias digitales; requiere formulario de solicitud simple. |

---

## 3. Matriz de Interés e Impacto

```text
               Nivel de Interés
               Alto                         Bajo
           +------------------------------+------------------------------+
    Alto   |  Gestionar de Cerca          |  Mantener Satisfechos        |
Impacto    |  - Equipo TI                 |  - Área Administrativa       |
           +------------------------------+------------------------------+
    Bajo   |  Mantener Informados         |  Monitorear                  |
           |  - Usuarios Internos/Docentes|  - Dirección                 |
           +------------------------------+------------------------------+
```

---

## 4. Estrategia de Adopción y Gestión del Cambio

- **Para el Equipo TI:** El Tablero Kanban visual con la posibilidad de **Pausar** una tarea de prioridad *Estratégica* para atender un ticket *Crítico* (y luego retomarla sin olvidar el avance) genera adhesión inmediata al reducir el estrés por tareas abandonadas.
- **Para el Área Administrativa:** La disponibilidad inmediata de datos erradica la espera de semanas por relevamientos manuales.
