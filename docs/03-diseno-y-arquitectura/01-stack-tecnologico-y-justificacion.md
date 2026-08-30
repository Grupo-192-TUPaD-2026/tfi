# Etapa 3: Definición y Justificación del Stack Tecnológico

> **Proyecto:** Sistema de Gestión Integral de TI  
> **Basado estrictamente en:** Guía `U1-A2-Lectura.pdf`

---

## 1. Resumen del Stack Tecnológico Seleccionado

| Componente de la Arquitectura | Tecnología Elegida | Versión | Rol / Responsabilidad |
| :--- | :--- | :--- | :--- |
| **Frontend (Cliente)** | **Nuxt 4** (Vue 3 + TypeScript) | v4.x | Interfaz gráfica reactiva (SPA), componentes de usuario y navegación. |
| **Backend (Servidor)** | **FastAPI** (Python 3.12+) | v0.140+ | API RESTful, lógica de negocio, validaciones Pydantic y autenticación JWT. |
| **Base de Datos** | **PostgreSQL** | v18+ | Almacenamiento relacional persistente, relaciones estricta e integridad ACID. |
| **Entorno / Despliegue** | **Docker & Docker Compose** | v25+ | Contenedorización, aislación de entornos Dev/Prod y orquestación de servicios. |

---

## 2. Justificación Técnica Honesta (Preguntas Clave `U1-A2`)

Una decisión tecnológica sólida responde abiertamente a las siguientes preguntas según los lineamientos de la materia:

### 2.1 ¿Por qué este lenguaje y framework para el Frontend (Nuxt 4)?
* **Justificación:**  
  El equipo posee experiencia previa consolidada en Vue 3 y Nuxt. Nuxt 4 proporciona un enrutamiento basado en archivos sumamente intuitivo, renderizado ágil, integración nativa con TypeScript y un ecosistema de componentes ligero que acelera el desarrollo de interfaces SPA modernas y reactivas para los técnicos y usuarios.

### 2.2 ¿Por qué este lenguaje y framework para el Backend (FastAPI)? ¿Qué problema resuelve mejor que las alternativas?
* **Justificación:**  
  Python es el lenguaje con el cual el equipo se siente más familiarizado. FastAPI es uno de los frameworks web más rápidos y modernos en Python. Resuelve el problema de la documentación de API automáticamente (generando Swagger/OpenAPI al instante) y ofrece serialización y validación de datos en tiempo de ejecución de alto rendimiento con modelo asíncrono.

### 2.3 ¿Por qué este gestor de base de datos (PostgreSQL)? ¿Es SQL o NoSQL?
* **Justificación:**  
  Se seleccionó **PostgreSQL (BD Relacional)** porque las entidades del dominio de TI poseen una estructura rígida con relaciones complejas e indispensables entre tablas (un Ticket pertenece a un Activo de Inventario, un Activo se asigna a un Usuario, y un Procedimiento KB resuelve un conjunto de Tickets). Se requiere integridad transaccional (ACID) y claves foráneas estrictas.

### 2.4 ¿Por qué esta plataforma de despliegue (Docker)? ¿Qué restricciones técnicas o económicas influyeron?
* **Justificación:**  
  La dependencia ya trabaja con software de contenedores y virtualización, por lo que están familiarizados con la tecnología. Docker y Docker Compose permiten abstraer las diferencias entre los sistemas operativos de desarrollo y producción. Con un solo comando (`docker-compose up`) se levantan de forma aislada los contenedores de FastAPI, 4 y PostgreSQL, eliminando el problema clásico de *"en mi máquina funciona"*.

### 2.5 ¿El equipo (o el estudiante) tiene experiencia previa con estas tecnologías?
* **Justificación:**  
  **Sí.** El equipo cuenta con experiencia previa directa en Python, Javascript/Typescript y SQL. Esta elección evita incurrir en el costo temporal de aprender tecnologías desde cero durante las 8 semanas de desarrollo del MVP, permitiendo enfocar el 100% del esfuerzo en la calidad del software y la solución de la problemática de negocio.

---

## 3. Evaluación de Criterios de Selección (`U1-A2`)

- **Naturaleza del problema:** Ajuste perfecto entre la alta velocidad de respuesta de FastAPI y la interfaz reactiva de Nuxt 4 para la gestión operativa en tiempo real.
- **Escala esperada:** Escala media para departamentos de TI u organizaciones con cientos de activos y cientos de tickets, evitando la sobreingeniería innecesaria de microservicios.
- **Madurez de la tecnología:** Tecnologías altamente consolidadas en la industria con ecosistemas estables, mantenimiento activo y excelente documentación.
