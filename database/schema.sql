-- =========================================================
-- Sistema de Gestión Integral de TI - Esquema de Base de Datos
-- Motor: PostgreSQL
-- =========================================================

-- Tablas catálogo
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ubicaciones (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE categorias_activo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE estados_ticket (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE prioridades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    rol_id INTEGER NOT NULL REFERENCES roles(id),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Inventario
CREATE TABLE activos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    categoria_id INTEGER NOT NULL REFERENCES categorias_activo(id),
    numero_serie VARCHAR(100),
    ubicacion_id INTEGER REFERENCES ubicaciones(id),
    usuario_asignado_id INTEGER REFERENCES usuarios(id),
    estado VARCHAR(30) NOT NULL DEFAULT 'activo',
    fecha_alta DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE historial_activos (
    id SERIAL PRIMARY KEY,
    activo_id INTEGER NOT NULL REFERENCES activos(id) ON DELETE CASCADE,
    usuario_id INTEGER REFERENCES usuarios(id),
    accion VARCHAR(100) NOT NULL,
    detalle VARCHAR(255),
    fecha TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Tickets
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT,
    usuario_solicitante_id INTEGER NOT NULL REFERENCES usuarios(id),
    tecnico_asignado_id INTEGER REFERENCES usuarios(id),
    activo_relacionado_id INTEGER REFERENCES activos(id),
    estado_id INTEGER NOT NULL REFERENCES estados_ticket(id),
    prioridad_id INTEGER NOT NULL REFERENCES prioridades(id),
    fecha_creacion TIMESTAMP NOT NULL DEFAULT NOW(),
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT NOW(),
    fecha_cierre TIMESTAMP
);

CREATE TABLE comentarios_ticket (
    id SERIAL PRIMARY KEY,
    ticket_id INTEGER NOT NULL REFERENCES tickets(id) ON DELETE CASCADE,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
    comentario TEXT NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Monitoreo de red
CREATE TABLE dispositivos_monitoreados (
    id SERIAL PRIMARY KEY,
    activo_id INTEGER REFERENCES activos(id),
    ip VARCHAR(45) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    intervalo_chequeo_seg INTEGER NOT NULL DEFAULT 60
);

CREATE TABLE registros_monitoreo (
    id BIGSERIAL PRIMARY KEY,
    dispositivo_id INTEGER NOT NULL REFERENCES dispositivos_monitoreados(id) ON DELETE CASCADE,
    timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    estado VARCHAR(20) NOT NULL, -- 'online' | 'offline'
    latencia_ms INTEGER
);

-- Índices principales
CREATE INDEX idx_tickets_estado ON tickets(estado_id);
CREATE INDEX idx_tickets_solicitante ON tickets(usuario_solicitante_id);
CREATE INDEX idx_tickets_tecnico ON tickets(tecnico_asignado_id);
CREATE INDEX idx_registros_dispositivo ON registros_monitoreo(dispositivo_id);
CREATE INDEX idx_registros_timestamp ON registros_monitoreo(timestamp);
CREATE INDEX idx_activos_categoria ON activos(categoria_id);
CREATE INDEX idx_activos_ubicacion ON activos(ubicacion_id);

-- Datos iniciales (catálogos)
INSERT INTO roles (nombre) VALUES ('Administrador'), ('Tecnico'), ('Usuario');

INSERT INTO estados_ticket (nombre) VALUES
    ('Pendiente'), ('En Proceso'), ('En Espera'), ('Pausado'), ('Cancelado'), ('Terminado');

INSERT INTO prioridades (nombre) VALUES ('Baja'), ('Media'), ('Alta'), ('Urgente');

INSERT INTO categorias_activo (nombre) VALUES
    ('PC'), ('Notebook'), ('Impresora'), ('Switch'), ('Router'), ('Access Point'), ('Servidor');
