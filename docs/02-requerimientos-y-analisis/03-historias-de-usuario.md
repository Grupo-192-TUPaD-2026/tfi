# Etapa 2: Historias de Usuario (User Stories)

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI

---

## 1. Inventario de Historias de Usuario (MVP)

---

### HU-01: Pausar y Retomar Tarea en el Tablero Kanban
* **Como** Técnico del equipo de TI,
* **Quiero** pausar una tarea de prioridad *Estratégica* registrando el avance realizado para atender un ticket de prioridad *Crítico*,
* **Para** evitar que la tarea extensa quede olvidada o inconclusa y poder reanudarla más tarde.

#### Criterios de Aceptación (Dado / Cuando / Entonces):
- **Escenario 1 (Pausar Tarea con Nota de Avance):**
  - **Dado** que estoy ejecutando la tarea "Mantenimiento Sala de Computación" en estado *En Proceso*,
  - **Cuando** arrastro la tarjeta a la columna *Pausado* en el Kanban,
  - **Entonces** el sistema despliega un modal exigiendo el campo de nota de avance (ej: "PCs 1 a 5 formateadas; restan 6 a 10") antes de guardar el estado.
- **Escenario 2 (Retomar Tarea Pausada):**
  - **Dado** que un técnico observa una tarea en la columna *Pausado*,
  - **Cuando** presiona el botón "Retomar Tarea",
  - **Entonces** la tarea vuelve al estado *En Proceso*, se asigna al técnico actual y muestra las notas de avance previas.

---

### HU-02: Registro de Componentes y Origen de Repuestos
* **Como** Técnico del equipo de TI,
* **Quiero** registrar el reemplazo de una parte de hardware (RAM, Disco, Fuente) indicando de qué equipo en depósito/donante proviene,
* **Para** mantener información actualizada de los componentes de cada computadora.

#### Criterios de Aceptación:
- **Dado** que accedo a la ficha del equipo `PC-MIN-012`,
- **Cuando** reemplazo el disco duro y selecciono como origen "PC-045 (Depósito / Donante)",
- **Entonces** el sistema actualiza la lista de componentes de `PC-MIN-012` y descuenta/marca el componente en `PC-045`.

---

### HU-03: Consulta Instantánea de Inventario para Administración
* **Como** Personal del Área Administrativa,
* **Quiero** consultar el listado de computadoras por oficina/sector en tiempo real,
* **Para** obtener datos actualizados del patrimonio sin tener que solicitar un relevamiento físico.

#### Criterios de Aceptación:
- **Dado** que accedo con perfil Administrativo al módulo de Inventario,
- **Cuando** filtro por la ubicación "Laboratorio de Química",
- **Entonces** el sistema muestra al instante los equipos asignados, su estado operativo y características sin demoras.

---

### HU-04: Alerta Preventiva por Inactividad en Red
* **Como** Equipo de TI,
* **Quiero** recibir una alerta automática cuando una computadora lleve más de 5 días sin conectarse a la red,
* **Para** revisar preventivamente si sufrió un desperfecto antes de que el usuario lo note.

#### Criterios de Aceptación:
- **Dado** que el backend ejecuta la verificación de presencia periódica,
- **Cuando** una PC con agente no envía latido durante 5 días seguidos,
- **Entonces** se genera una notificación en la columna de Alertas del tablero de TI etiquetada con prioridad *Operativa*.

---

### HU-05: Consulta de Procedimientos Categorizados en la KB
* **Como** Técnico de TI,
* **Quiero** consultar la Base de Conocimiento filtrando por la categoría "Mantenimiento Preventivo",
* **Para** aplicar el procedimiento estandarizado y evitar el trabajo ad-hoc.

#### Criterios de Aceptación:
- **Dado** que estoy en el repositorio de procesos,
- **Cuando** selecciono la categoría "Redes / Routers",
- **Entonces** el sistema lista las guías paso a paso correspondientes con buscador rápido por palabra clave.
