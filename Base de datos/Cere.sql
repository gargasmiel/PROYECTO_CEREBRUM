create DATABASE cerebrum;
CHARACTER SET utf8mb4 
collate utf8mb4_unicode_ci;

use cerebrum;

create table estudiantes(
    id_estudiante int not null auto_increment primary key,
    primer_nombre varchar(50) not null,
    segundo_nombre varchar(50) null,
    primer_apellido varchar(50)not null,
    segundo_apellido varchar(50) null,
    fecha_nacimiento date not null,
    numero_documento varchar(20) not null unique,
    tipo_documento varchar(20) not null,
    creditos_disponibles int not null default 0,
    perls_disponibles int not null default 0,
    fecha_registro timestamp not null default current_timestamp,
    ultimo_registro timestamp not null default current_timestamp on update current_timestamp,
    racha varchar(50) not null default 0,
    cuenta_verificada boolean not null default false
) engine=InnoDB;

create table suscripcion(
    id_suscripcion int not null auto_increment primary key,
    id_estudiante int not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    tipo_suscripcion varchar(50) not null,
    estado boolean not null default true,
    foreign key (id_estudiante) references estudiantes(id_estudiante)
) engine=InnoDB;

