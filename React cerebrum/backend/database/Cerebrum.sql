CREATE DATABASE IF NOT EXISTS Cerebrum
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

use Cerebrum;

CREATE TABLE IF NOT EXISTS usuarios (
    id int auto_increment primary key,
    nombre varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null,
    rol varchar(50) not null default 'admin',
    estado TINYINT(1) not null default 1,
    creado_en timestamp not null default current_timestamp
);
