CREATE DATABASE IF NOT EXISTS tf_bd;
USE tf_bd;

CREATE TABLE DEPARTAMENTO (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE TIPO_ELECCION (
    id_tipo_eleccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE PARTIDO (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion_sede VARCHAR(200),
    presidente VARCHAR(100),
    vicepresidente VARCHAR(100)
);

CREATE TABLE CIUDADANO (
    id_ciudadano INT AUTO_INCREMENT PRIMARY KEY,
    ci VARCHAR(20) NOT NULL UNIQUE,
    credencial_civica VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tiene_credencial BOOLEAN DEFAULT TRUE
);

CREATE TABLE LOCALIDAD (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_localidad VARCHAR(50),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTO(id_departamento)
);

CREATE TABLE ELECCION (
    id_eleccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(50),
    id_tipo_eleccion INT,
    FOREIGN KEY (id_tipo_eleccion) REFERENCES TIPO_ELECCION(id_tipo_eleccion)
);

CREATE TABLE CANDIDATO (
    id_candidato INT AUTO_INCREMENT PRIMARY KEY,
    ci VARCHAR(20) NOT NULL UNIQUE,
    credencial_civica VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    id_partido INT,
    FOREIGN KEY (id_partido) REFERENCES PARTIDO(id_partido)
);

CREATE TABLE ESTABLECIMIENTO (
    id_establecimiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_establecimiento VARCHAR(100),
    direccion VARCHAR(200),
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES LOCALIDAD(id_localidad)
);

CREATE TABLE PAPELETA (
    id_papeleta INT AUTO_INCREMENT PRIMARY KEY,
    tipo_papeleta VARCHAR(50) NOT NULL,
    descripcion TEXT,
    color VARCHAR(30),
    opcion_consulta VARCHAR(100),
    id_eleccion INT,
    FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion)
);

CREATE TABLE CIRCUITO (
    id_circuito INT AUTO_INCREMENT PRIMARY KEY,
    numero_circuito INT NOT NULL,
    barrio_zona VARCHAR(100),
    accesible BOOLEAN DEFAULT FALSE,
    estado VARCHAR(50),
    votos_emitidos INT DEFAULT 0,
    id_establecimiento INT,
    FOREIGN KEY (id_establecimiento) REFERENCES ESTABLECIMIENTO(id_establecimiento)
);

CREATE TABLE PARTICIPACION_ELECTORAL (
    id_participacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    observado BOOLEAN DEFAULT FALSE,
    id_ciudadano INT,
    id_eleccion INT,
    FOREIGN KEY (id_ciudadano) REFERENCES CIUDADANO(id_ciudadano),
    FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion)
);

CREATE TABLE MESA (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    fecha_apertura DATETIME,
    fecha_cierre DATETIME,
    estado VARCHAR(50),
    id_circuito INT,
    id_eleccion INT,
    FOREIGN KEY (id_circuito) REFERENCES CIRCUITO(id_circuito),
    FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion)
);

CREATE TABLE LISTA (
    id_lista INT PRIMARY KEY,
    numero_lista INT NOT NULL,
    id_partido INT,
    id_candidato_principal INT,
    id_organo INT,
    id_departamento INT,
    FOREIGN KEY (id_lista) REFERENCES PAPELETA(id_papeleta),
    FOREIGN KEY (id_partido) REFERENCES PARTIDO(id_partido),
    FOREIGN KEY (id_candidato_principal) REFERENCES CANDIDATO(id_candidato),
    FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTO(id_departamento)
);

CREATE TABLE MIEMBRO_MESA (
    id_miembro_mesa INT AUTO_INCREMENT PRIMARY KEY,
    rol_mesa VARCHAR(50) NOT NULL,
    organismo_estado VARCHAR(100),
    id_ciudadano INT,
    id_mesa INT,
    FOREIGN KEY (id_ciudadano) REFERENCES CIUDADANO(id_ciudadano),
    FOREIGN KEY (id_mesa) REFERENCES MESA(id_mesa)
);

CREATE TABLE VOTO (
    id_voto INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    estado_voto VARCHAR(50) NOT NULL,
    observado BOOLEAN DEFAULT FALSE,
    id_mesa INT,
    FOREIGN KEY (id_mesa) REFERENCES MESA(id_mesa)
);

CREATE TABLE DETALLE_VOTO (
    id_voto INT,
    id_papeleta INT,
    PRIMARY KEY (id_voto, id_papeleta),
    FOREIGN KEY (id_voto) REFERENCES VOTO(id_voto),
    FOREIGN KEY (id_papeleta) REFERENCES PAPELETA(id_papeleta)
);

CREATE TABLE INTEGRACION_LISTA (
    id_lista INT,
    id_candidato INT,
    orden_aparicion INT NOT NULL,
    PRIMARY KEY (id_lista, id_candidato),
    FOREIGN KEY (id_lista) REFERENCES LISTA(id_lista),
    FOREIGN KEY (id_candidato) REFERENCES CANDIDATO(id_candidato)
);