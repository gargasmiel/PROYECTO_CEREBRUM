CREATE DATABASE cerebrum
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE cerebrum;

CREATE TABLE estudiantes (
    id_estudiante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50) NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    tipo_documento VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    creditos_disponibles INT NOT NULL DEFAULT 0,
    perls_disponibles INT NOT NULL DEFAULT 0,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ultimo_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    racha INT NOT NULL DEFAULT 0,
    cuenta_verificada BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE=InnoDB;

CREATE TABLE suscripcion (
    id_suscripcion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tipo_suscripcion VARCHAR(50) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_suscripcion_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante)
) ENGINE=InnoDB;

CREATE TABLE plan (
    id_plan INT NOT NULL AUTO_INCREMENT,
    id_suscripcion INT NOT NULL,
    nombre_plan VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    duracion DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_plan PRIMARY KEY (id_plan),
    CONSTRAINT fk_plan_suscripcion FOREIGN KEY (id_suscripcion)
        REFERENCES suscripcion(id_suscripcion)
) ENGINE=InnoDB;

CREATE TABLE matricula (
    id_matricula INT NOT NULL AUTO_INCREMENT,
    fecha_matricula DATE NOT NULL,
    id_estudiante INT NOT NULL,
    CONSTRAINT pk_matricula PRIMARY KEY (id_matricula),
    CONSTRAINT fk_matricula_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante)
) ENGINE=InnoDB;

CREATE TABLE profesor (
    id_profesor INT NOT NULL AUTO_INCREMENT,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50) NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT pk_profesor PRIMARY KEY (id_profesor),
    CONSTRAINT uq_profesor_documento UNIQUE (numero_documento, tipo_documento)
) ENGINE=InnoDB;

CREATE TABLE materia (
    id_materia INT NOT NULL AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    CONSTRAINT pk_materia PRIMARY KEY (id_materia),
    CONSTRAINT fk_materia_profesor FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor)
) ENGINE=InnoDB;

CREATE TABLE matricula_materia (
    id_matricula INT NOT NULL,
    id_materia INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL DEFAULT 0,
    avance DECIMAL(5,2) NOT NULL DEFAULT 0,
    CONSTRAINT pk_matricula_materia PRIMARY KEY (id_matricula, id_materia),
    CONSTRAINT fk_matricula_materia_matricula FOREIGN KEY (id_matricula)
        REFERENCES matricula(id_matricula),
    CONSTRAINT fk_matricula_materia_materia FOREIGN KEY (id_materia)
        REFERENCES materia(id_materia)
) ENGINE=InnoDB;

CREATE TABLE login (
    id_login INT NOT NULL AUTO_INCREMENT,
    correo VARCHAR(100) NOT NULL,
    contrasena CHAR(64) NOT NULL,
    salt CHAR(32) NOT NULL,
    id_estudiante INT NULL,
    id_profesor INT NULL,
    CONSTRAINT pk_login PRIMARY KEY (id_login),
    CONSTRAINT uq_login_correo UNIQUE (correo),
    CONSTRAINT fk_login_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_login_profesor FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor)
) ENGINE=InnoDB;

CREATE TABLE admin_academia (
    id_admin INT NOT NULL AUTO_INCREMENT,
    id_estudiante INT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nombre_academia VARCHAR(100) NOT NULL,
    direccion_academia VARCHAR(200) NOT NULL,
    CONSTRAINT pk_admin_academia PRIMARY KEY (id_admin),
    CONSTRAINT fk_admin_academia_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante)
) ENGINE=InnoDB;

CREATE TABLE tema (
    id_tema INT NOT NULL AUTO_INCREMENT,
    id_materia INT NOT NULL,
    nombre_tema VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    CONSTRAINT pk_tema PRIMARY KEY (id_tema),
    CONSTRAINT fk_tema_materia FOREIGN KEY (id_materia)
        REFERENCES materia(id_materia)
) ENGINE=InnoDB;

CREATE TABLE subtema (
    id_subtema INT NOT NULL AUTO_INCREMENT,
    id_tema INT NOT NULL,
    nombre_subtema VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    CONSTRAINT pk_subtema PRIMARY KEY (id_subtema),
    CONSTRAINT fk_subtema_tema FOREIGN KEY (id_tema)
        REFERENCES tema(id_tema)
) ENGINE=InnoDB;

CREATE TABLE preguntas (
    id_pregunta INT NOT NULL AUTO_INCREMENT,
    enunciado TEXT NOT NULL,
    dificultad VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pregunta PRIMARY KEY (id_pregunta)
) ENGINE=InnoDB;

CREATE TABLE preguntas_subtema (
    id_pregunta INT NOT NULL,
    id_subtema INT NOT NULL,
    CONSTRAINT pk_preguntas_subtema PRIMARY KEY (id_pregunta, id_subtema),
    CONSTRAINT fk_preguntas_subtema_pregunta FOREIGN KEY (id_pregunta)
        REFERENCES preguntas(id_pregunta),
    CONSTRAINT fk_preguntas_subtema_subtema FOREIGN KEY (id_subtema)
        REFERENCES subtema(id_subtema)
) ENGINE=InnoDB;

CREATE TABLE opciones (
    id_opcion INT NOT NULL AUTO_INCREMENT,
    id_pregunta INT NOT NULL,
    texto_opcion TEXT NOT NULL,
    es_correcta BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_opcion PRIMARY KEY (id_opcion),
    CONSTRAINT fk_opcion_pregunta FOREIGN KEY (id_pregunta)
        REFERENCES preguntas(id_pregunta)
) ENGINE=InnoDB;

CREATE TABLE tipo_pregunta (
    id_tipo INT NOT NULL AUTO_INCREMENT,
    id_pregunta INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    CONSTRAINT pk_tipo PRIMARY KEY (id_tipo),
    CONSTRAINT fk_tipo_pregunta FOREIGN KEY (id_pregunta)
        REFERENCES preguntas(id_pregunta)
) ENGINE=InnoDB;

CREATE TABLE evaluacion (
    id_evaluacion INT NOT NULL AUTO_INCREMENT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    perls_obtenidas SMALLINT NOT NULL DEFAULT 0,
    CONSTRAINT pk_evaluacion PRIMARY KEY (id_evaluacion)
) ENGINE=InnoDB;

CREATE TABLE preguntas_evaluacion (
    id_pregunta INT NOT NULL,
    id_evaluacion INT NOT NULL,
    id_opcion INT NULL,
    calificacion DECIMAL(5,2) NOT NULL DEFAULT 0,
    CONSTRAINT pk_preguntas_evaluacion PRIMARY KEY (id_pregunta, id_evaluacion),
    CONSTRAINT fk_preguntas_evaluacion_pregunta FOREIGN KEY (id_pregunta)
        REFERENCES preguntas(id_pregunta),
    CONSTRAINT fk_preguntas_evaluacion_evaluacion FOREIGN KEY (id_evaluacion)
        REFERENCES evaluacion(id_evaluacion),
    CONSTRAINT fk_preguntas_evaluacion_opcion FOREIGN KEY (id_opcion)
        REFERENCES opciones(id_opcion)
) ENGINE=InnoDB;

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    id_estudiante INT NULL,
    id_profesor INT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50) NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contrasena CHAR(64) NOT NULL,
    salt CHAR(32) NOT NULL,
    rol VARCHAR(20) NOT NULL DEFAULT 'estudiante',
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    intentos_fallidos INT NOT NULL DEFAULT 0,
    bloqueado BOOLEAN NOT NULL DEFAULT FALSE,
    ultimo_acceso DATETIME NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuario_correo UNIQUE (correo),
    CONSTRAINT fk_usuario_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante) ON DELETE SET NULL,
    CONSTRAINT fk_usuario_profesor FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor) ON DELETE SET NULL,
    CONSTRAINT ck_usuario_rol CHECK (rol IN ('estudiante', 'profesor', 'admin'))
) ENGINE=InnoDB;

CREATE TABLE contenido (
    id_contenido INT NOT NULL AUTO_INCREMENT,
    id_subtema INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    tipo_contenido VARCHAR(50) NOT NULL,
    CONSTRAINT pk_contenido PRIMARY KEY (id_contenido),
    CONSTRAINT fk_contenido_subtema FOREIGN KEY (id_subtema)
        REFERENCES subtema(id_subtema)
) ENGINE=InnoDB;

CREATE TABLE token (
    id_token INT NOT NULL AUTO_INCREMENT,
    codigo_token CHAR(64) NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_login INT NOT NULL,
    CONSTRAINT pk_token PRIMARY KEY (id_token),
    CONSTRAINT fk_token_login FOREIGN KEY (id_login)
        REFERENCES login(id_login)
) ENGINE=InnoDB;
