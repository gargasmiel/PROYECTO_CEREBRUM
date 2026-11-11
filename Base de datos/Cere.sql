create DATABASE cerebrum;
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

use cerebrum;

create table estudiantes(
    id_estudiante int not  NULL auto_increment primary key,
    primer_nombre varchar(50) not null,
    segundo_nombre varchar (50) null,
    primer_apellido varchar (50)not null,
    segundo_apellido varchar (50) null,
    fecha_nacimiento date not null,
    numero_documento varchar (20) not null unique,
    tipo_documento varchar (20) not null,
    telefono varchar (20) not null,
    creditos_disponibles int not null default 0,
    perls_disponibles int not null default 0,
    fecha_registro timestamp not null default current_timestamp,
    ultimo_registro timestamp not null default current_timestamp on update current_timestamp,
    racha varchar (50) not null default 0,
    cuenta_verificada boolean not null default false
) engine=InnoDB;

create table suscripcion(
    id_suscripcion int not null auto_increment primary key,
    id_estudiante int not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    tipo_suscripcion varchar (50) not null,
    estado boolean not null default true,
    foreign key (id_estudiante) references estudiantes(id_estudiante)
) engine=InnoDB;

create table plan(
    id_plan int not null auto_increment,
    nombre_plan varchar(50) not null,
    precio decimal(10,2) not null,
    duracion numeric(10,2) not null,
    constraint pk_plan primary key(id_plan),
    constraint fk_plan_suscripcion foreign key(id_suscripcion)
    references suscripcion(id_suscripcion)
) engine=InnoDB;

CREATE TABLE matricula(
    id_matricula int not null auto_increment,
    fecha_matricula date not null,
    id_estudiante int not null,
    constraint pk_matricula primary key(id_matricula),
    constraint fk_estudiante foreign key (id_estudiante) references estudiantes(id_estudiante)
) engine=InnoDB;

create table matricula_materia(
    id_matricula int not null,
    id_materia int not null,
    nota decimal(5,2) not null default 0,
    avance decimal(5,2) not null default 0,
    constraint pk_matricula_materia primary key(id_matricula, id_materia),
    constraint fk_matricula foreign key (id_matricula)
    references matricula(id_matricula),
    constraint fk_materia foreign key (id_materia)
    references materia(id_materia)
) engine=InnoDB;

CREATE TABLE materia(
    id_materia int not null auto_increment,
    nombre varchar(100)not null,
    descripcion text not null,

    constraint pk_materia primary key(id_materia),
    constraint fk_materia_profesor foreign key (id_profesor)
    references profesor(id_profesor)
) engine=InnoDB;

create table profesor(
    id_profesor int not null auto_increment,
    id_materia int not null,
    primer_nombre varchar(50)not null,
    segundo_nombre varchar(50) null,
    primer_apellido varchar(50)not null,
    segundo_apellido varchar(50) null,
    fecha_nacimiento date not null,
    numero_documento varchar(20) not null unique,
    tipo_documento varchar(20) not null unique,
    telefono varchar(20) not null,

    constraint pk_profesor primary key(id_profesor),
    constraint fk_profesor_materia foreign key (id_materia)
    references materia(id_materia),
    constraint fk_profesor_login foreign key (id_login)
    references login(id_login),
    constraint uq_profesor unique (numero_documento, tipo_documento)

) engine=InnoDB;

create table login(
    id_login int not null auto_increment,
    correo varchar(100) not null unique,
    contraseña char(64) not null,
    salt char(32) not null,

    constraint pk_login primary key(id_login),
    constraint unique_login unique (correo),
    constraint fk_login_estudiante foreign key (id_estudiante)
    references estudiantes(id_estudiante),
    constraint fk_login_profesor foreign key (id_profesor)
    references profesor(id_profesor)
) engine=InnoDB;

create TABLE admin_academia(
    id_admin int not null auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    nombre_academia varchar(100) not null,
    direccion_academia varchar(200) not null,
    constraint pk_admin_academia primary key(id_admin),
    constraint fk_admin_academia_estudiante foreign key (id_estudiante)
    references estudiantes(id_estudiante)
) engine=InnoDB;

create table tema (
    id_tema int not null auto_increment,
    nombre_tema varchar(100) not null,
    descripcion text not null,
    constraint pk_tema primary key (id_tema),
    constraint fk_tema_materia foreign key (id_materia)
    references materia(id_materia)
) engine=InnoDB;

create table subtema(
    id_subtema int not null auto_increment,
    nombre_subtema varchar(100) not null,
    descripcion text not null,
    constraint pk_subtema primary key (id_subtema),
    constraint fk_subtema_tema foreign key (id_tema)
    references tema(id_tema)
) engine=InnoDB;


create table preguntas(
    id_pregunta int not null auto_increment,
    enunciado text not null,
    dificultad varchar(20) not null,
    constraint pk_pregunta primary key (id_pregunta),
    constraint fk_pregunta_subtema foreign key(id_subtema)
    references subtema(id_subtema)
) engine=InnoDB;

create table opciones(
    id_opcion int not null auto_increment,
    id_pregunta int not null,
    texto_opcion text not null,
    es_correcta boolean not null default false,
    constraint pk_opcion primary key (id_opcion),
    constraint fk_opcion_pregunta foreign key (id_pregunta)
    references preguntas(id_pregunta)
) engine=InnoDB;

CREATE table tipo_pregunta(
    id_tipo int not null auto_increment,
    tipo varchar(50) not null,
    constraint pk_tipo primary key (id_tipo)
    constraint fk_tipo_pregunta foreign key( id_pregunta)
    references preguntas(id_pregunta)
)engine=InnoDB;

create table usuario(
    id_usuario int not null auto_increment,
    id_estudiante int not null,
    id_profesor int not null,
    primer_nombre varchar(50) not null,
    segundo_nombre varchar(50)null,
    primer_apellido varchar(50) not null,
    segundo_apellido varchar(50)null,
    telefono varchar(20) not null,
    correo varchar(100) not null unique,
    contraseña char(64)not null,
    salt char(32) not null,
    rol varchar(20) not null DEFAULT 'estudiante',
    activo boolean not null DEFAULT true,
    intentos_fallidos int not null DEFAULT 0,
    bloqueado boolean not null DEFAULT false,
    ultimo_acceso datetime null,
    fecha_creacion datetime not null DEFAULT CURRENT_TIMESTAMP,

    constraint pk_usuario primary key(id_usuario),
    constraint fk_usuario_estudiante foreign key (id_estudiante)
    references estudiantes(id_estudiante),
    constraint fk_usuario_profesor foreign key (id_profesor)
    references profesor(id_profesor),
    constraint uq_usuario unique (correo),
    constraint ck_usuario_rol check (rol in ('estudiante', 'profesor', 'admin'))
    on delete set null
) engine=InnoDB;
