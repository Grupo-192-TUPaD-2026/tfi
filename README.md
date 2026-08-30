# Trabajo Final Integrador (TFI) - UTN

> **Tecnicatura Universitaria en Programación a Distancia**  
> **Asignatura:** Trabajo Final  
> **Estudiantes:** Diego Cornejo - Daniel Dantur  
> **Año / Cuatrimestre:** 2026  

---

## 📌 Descripción General del Proyecto

Este repositorio contiene el desarrollo del **Sistema de Gestión Integral de TI**, desarrollado como Trabajo Final Integrador (TFI).

### Problema que resuelve:
En una dependencia del Ministerio de Educación de Tucumán, el trabajo de TI se realiza de manera informal y ad-hoc. Esto provoca que:
- Los relevamientos de inventario fueran repetitivos y quedaran obsoletos rápidamente por la rotación constante de computadoras y componentes sin trazabilidad de su origen (depósito/donantes vs nuevos).
- Las solicitudes de soporte urgentes interrumpan tareas largas programadas (ej.: mantenimiento de la Sala de Computación), quedando posteriormente **olvidadas o inconclusas** por falta de seguimiento.
- El soporte fuera reactivo y tardío al descubrir fallas recién cuando los usuarios intentaban usar los equipos.

La plataforma unifica en un stack moderno (**FastAPI + Nuxt 4 + PostgreSQL + Docker**):
1. **Gestión de Tareas mediante Tickets:** Sistema de seguimiento de tareas con estados configurables (por defecto: *Pendiente*, *En Proceso*, *En espera*, *Pausado*, *Cancelado* y *Terminado*), permitiendo adaptarse a la dinámica de trabajo del equipo y asegurando que ninguna tarea quede sin resolución.
2. **Inventario Dinámico:** ID propio y número de serie, ubicación, estado y componentes internos.
3. **Monitoreo Preventivo de Red y Alertas:** Pings a infraestructura y agentes livianos en PCs de usuarios para detectar fallas antes de que el usuario las reporte.
4. **Base de Conocimiento:** Repositorio de procedimientos para estandarizar tareas y compartir conocimientos.
5. **Gestión Colaborativa y Consulta:** Tablero de consulta en tiempo real para el Área Administrativa.

---

## 📂 Estructura del Repositorio (SDLC)

```text
tfi/
├── README.md                              # Presentación general y mapa del proyecto
├── docs/                                  # Documentación técnica por etapas SDLC
│   ├── 01-planificacion-y-viabilidad/     # Etapa 1: Definición de problema, viabilidad y plan
│   ├── 02-requerimientos-y-analisis/      # Etapa 2: Actores, RF/RNF, Historias de Usuario, Flujos AS-IS/TO-BE
│   ├── 03-diseno-y-arquitectura/          # Etapa 3: Stack tecnológico, Arquitectura, DER, APIs/UI
│   ├── 04-pruebas-y-calidad/              # Etapa 4: Plan de testing y reportes de QA
│   └── 05-despliegue-y-entrega/           # Etapa 5: Guía de ejecución, manuales y entrega
├── src/                                   # Código fuente de la aplicación
│   ├── backend/                           # API REST (FastAPI)
│   └── frontend/                          # Interfaz de Usuario (Nuxt 3 / Vue 3)
├── database/                              # Scripts de BD PostgreSQL, migraciones, seeds
└── docker/                                # Configuraciones Dockerfile y docker-compose.yml
```

---

## 🗺️ Índice de Documentación (`/docs`)

### 1. Planificación y Viabilidad
* 📄 [Problemática y Propuesta de Valor](docs/01-planificacion-y-viabilidad/01-problematicas-y-propuesta-valor.md)
* 📄 [Análisis de Competencia](docs/01-planificacion-y-viabilidad/02-analisis-competencia.md)
* 📄 [Análisis de Viabilidad](docs/01-planificacion-y-viabilidad/03-analisis-viabilidad.md)
* 📄 [Plan de Trabajo y Riesgos](docs/01-planificacion-y-viabilidad/04-plan-de-trabajo-y-riesgos.md)

### 2. Requerimientos y Análisis
* 📄 [Stakeholders y Actores](docs/02-requerimientos-y-analisis/01-stakeholders-y-actores.md)
* 📄 [Requerimientos Funcionales y No Funcionales](docs/02-requerimientos-y-analisis/02-requerimientos-funcionales-y-no-funcionales.md)
* 📄 [Historias de Usuario](docs/02-requerimientos-y-analisis/03-historias-de-usuario.md)
* 📄 [Flujo de Trabajo y Procesos (AS-IS / TO-BE)](docs/02-requerimientos-y-analisis/04-flujo-de-trabajo-y-procesos.md)

### 3. Diseño y Arquitectura
* 📄 [Stack Tecnológico y Justificación](docs/03-diseno-y-arquitectura/01-stack-tecnologico-y-justificacion.md)
* 📄 Arquitectura del Sistema
* 📄 Modelo de Datos
* 📄 Diseño de API y UI

### 4. Pruebas y Calidad
* 📄 Plan de Pruebas
* 📄 Reportes de Cobertura y QA

### 5. Despliegue y Entrega
* 📄 Guía de Instalación y Ejecución
* 📄 Manual de Usuario y Demo
