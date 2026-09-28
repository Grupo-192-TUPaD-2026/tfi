# Etapa 3: Definición y Justificación del Stack Tecnológico

> **Organización:** Dependencia del Ministerio de Educación de Tucumán  
> **Proyecto:** Sistema de Gestión Integral de TI  
> **Entrega:** Segunda Entrega (Instancia 2 - Análisis y Diseño)

---

## 1. Resumen del Stack Tecnológico Seleccionado

| Componente de la Arquitectura | Tecnología Elegida | Versión | Rol / Responsabilidad |
| :--- | :--- | :--- | :--- |
| **Frontend (Cliente)** | **Nuxt 4** (Vue 3 + TypeScript) | v4.x | Interfaz gráfica reactiva (SPA), componentes visuales, tablero Kanban interactivo y gestión de estado con Pinia. |
| **Backend (Servidor)** | **FastAPI** (Python 3.12+) | v0.115+ | API RESTful asíncrona, lógica de negocio, procesamiento de latidos, validación con Pydantic y seguridad JWT. |
| **Base de Datos** | **PostgreSQL** | v16+ | Almacenamiento relacional persistente, transacciones ACID, integridad referencial y soporte JSONB si se requiere. |
| **Monitoreo & Agentes** | **Python (Agente) / ICMP Ping** | Native | Agente liviano para envío de latidos (*heartbeats*) desde PCs y servicio background para ping a dispositivos de red. |
| **Entorno / Despliegue** | **Docker & Docker Compose** | v25+ | Contenedorización de servicios (Frontend, Backend, PostgreSQL), orquestación de entornos Dev/Prod. |

---

## 2. Justificación Técnica Honesta (Preguntas Clave `U1-A2`)

### 2.1 ¿Por qué este lenguaje y framework para el Frontend (Nuxt 4)?
* **Justificación:**  
  El equipo posee experiencia previa consolidada en Vue 3 y Nuxt. Nuxt 4 proporciona un enrutamiento basado en archivos sumamente intuitivo, renderizado ágil (SPA/SSR), integración nativa con TypeScript y un ecosistema de componentes ligero. Esto permite construir una interfaz extremadamente fluida para mover tarjetas en el Tablero Kanban y filtrar el inventario sin recargas de página.

### 2.2 ¿Por qué este lenguaje y framework para el Backend (FastAPI)? ¿Qué problema resuelve mejor que las alternativas?
* **Justificación:**  
  Python es el lenguaje con el cual el equipo tiene mayor solvencia técnica. FastAPI destaca por su velocidad de ejecución (basado en Starlette y Pydantic) y su capacidad asíncrona nativa (`async/await`), indispensable para procesar cientos de latidos periódicos de las PCs sin bloquear la API principal. Además, genera automáticamente la documentación interactiva OpenAPI/Swagger (`/docs`), acelerando el contrato entre Frontend y Backend.

### 2.3 ¿Por qué este gestor de base de datos (PostgreSQL)? ¿Es SQL o NoSQL?
* **Justificación:**  
  Se seleccionó **PostgreSQL (BD Relacional)** porque el dominio de TI exige relaciones estrictas y trazabilidad: un ticket pertenece a un activo, un activo se asigna a una ubicación y a un usuario, y posee un historial de componentes movidos entre equipos. Se requiere integridad transaccional (ACID), claves foráneas estrictas y consultas analíticas eficientes para el Área Administrativa.

### 2.4 ¿Por qué esta plataforma de despliegue (Docker)? ¿Qué restricciones técnicas o económicas influyeron?
* **Justificación:**  
  La infraestructura del Ministerio utiliza empaquetado en contenedores para simplificar la administración. Docker Compose permite definir en un solo manifiesto `docker-compose.yml` los tres servicios principales (FastAPI, Nuxt 4, PostgreSQL) con volúmenes persistentes y redes aisladas, garantizando que el sistema sea 100% portable entre computadoras de desarrollo y servidores institucionales.

### 2.5 ¿El equipo tiene experiencia previa con estas tecnologías?
* **Justificación:**  
  **Sí.** El equipo cuenta con experiencia previa en Python, JavaScript/TypeScript y SQL PostgreSQL. Esta decisión elimina la curva de aprendizaje en tecnologías desconocidas durante el cuatrimestre, asegurando la entrega a tiempo de un producto de alta calidad técnica.

---

## 3. Criterios de Calidad y No-Codificación en esta Instancia

> ⚠️ **Nota Importante:** De acuerdo a las consignas de la Instancia 2, este repositorio contiene únicamente el análisis, arquitectura, listado de módulos y diseño de base de datos. Ningún código fuente funcional de aplicación ha sido incluido aún; la codificación comenzará tras la aprobación del tutor.
