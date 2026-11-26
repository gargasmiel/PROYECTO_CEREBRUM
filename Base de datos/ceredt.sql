USE cerebrum;

INSERT INTO estudiantes
(id_estudiante, primer_nombre, segundo_nombre, primer_apellido,
 segundo_apellido, fecha_nacimiento, numero_documento,
 tipo_documento, telefono, creditos_disponibles,
 perls_disponibles, racha, cuenta_verificada)
VALUES
(1,'Gabriel','Jose','Fernandez','Paez','2005-04-12','1001001001','CC','3001112233',150,50,7,1),
(2,'Laura','Camila','Rodriguez','Perez','2006-02-15','1001001002','CC','3001112234',100,30,5,1),
(3,'Andres','Felipe','Martinez','Lopez','2005-08-20','1001001003','CC','3001112235',200,80,12,1),
(4,'Daniela','Sofia','Garcia','Torres','2006-11-10','1001001004','CC','3001112236',80,20,3,1),
(5,'Juan','David','Lopez','Ramirez','2005-06-05','1001001005','CC','3001112237',120,45,8,1),
(6,'Valentina','Isabel','Castro','Moreno','2006-09-18','1001001006','CC','3001112238',90,25,4,1),
(7,'Santiago','Andres','Herrera','Diaz','2005-03-22','1001001007','CC','3001112239',180,60,10,1),
(8,'Maria','Alejandra','Rojas','Vargas','2006-07-14','1001001008','CC','3001112240',110,35,6,1),
(9,'Sebastian','David','Gomez','Ruiz','2005-12-01','1001001009','CC','3001112241',70,15,2,0),
(10,'Camila','Andrea','Morales','Cruz','2006-05-27','1001001010','CC','3001112242',130,40,9,1),
(11,'Nicolas','Esteban','Jimenez','Ortiz','2005-10-09','1001001011','CC','3001112243',160,55,11,1),
(12,'Isabella','Maria','Torres','Silva','2006-01-30','1001001012','CC','3001112244',100,30,5,1),
(13,'Mateo','Alejandro','Diaz','Mendoza','2005-07-19','1001001013','CC','3001112245',140,45,8,1),
(14,'Sara','Valentina','Reyes','Castillo','2006-04-25','1001001014','CC','3001112246',90,25,4,1),
(15,'Samuel','Andres','Vargas','Molina','2005-09-11','1001001015','CC','3001112247',200,75,15,1),
(16,'Juliana','Paola','Cortes','Navarro','2006-12-03','1001001016','CC','3001112248',60,10,1,0),
(17,'David','Santiago','Ortega','Rios','2005-02-17','1001001017','CC','3001112249',150,50,7,1),
(18,'Mariana','Lucia','Acosta','Pineda','2006-08-08','1001001018','CC','3001112250',120,40,6,1),
(19,'Alejandro','Jose','Mendez','Leon','2005-05-21','1001001019','CC','3001112251',170,65,13,1);


INSERT INTO profesor
(id_profesor, primer_nombre, segundo_nombre, primer_apellido,
 segundo_apellido, fecha_nacimiento, numero_documento,
 tipo_documento, telefono)
VALUES
(1,'Carlos','Alberto','Ramirez','Gomez','1985-03-12','80010001','CC','3105551001'),
(2,'Patricia','Elena','Morales','Diaz','1982-07-22','80010002','CC','3105551002'),
(3,'Andres','Felipe','Castillo','Rojas','1988-11-05','80010003','CC','3105551003'),
(4,'Monica','Isabel','Torres','Vargas','1984-05-17','80010004','CC','3105551004');

INSERT INTO suscripcion
(id_suscripcion, id_estudiante, fecha_inicio, fecha_fin, tipo_suscripcion, estado)
VALUES
(1,1,'2026-01-01','2026-12-31','Premium',1),
(2,2,'2026-02-01','2026-12-31','Basica',1),
(3,3,'2026-03-01','2026-09-01','Premium',1),
(4,4,'2026-01-15','2026-07-15','Basica',0),
(5,5,'2026-04-01','2026-10-01','Premium',1),
(6,6,'2026-05-01','2026-11-01','Basica',1);

INSERT INTO plan
(id_plan, id_suscripcion, nombre_plan, precio, duracion)
VALUES
(1,1,'Premium Anual',120000,12),
(2,2,'Basico Anual',60000,12),
(3,3,'Premium Semestral',75000,6),
(4,4,'Basico Semestral',35000,6),
(5,5,'Premium Semestral',75000,6),
(6,6,'Basico Semestral',35000,6);

INSERT INTO matricula
(id_matricula, fecha_matricula, id_estudiante)
VALUES
(1,'2026-01-10',1),
(2,'2026-01-12',2),
(3,'2026-01-15',3),
(4,'2026-01-18',4),
(5,'2026-01-20',5),
(6,'2026-01-22',6),
(7,'2026-02-01',7),
(8,'2026-02-03',8),
(9,'2026-02-05',9),
(10,'2026-02-07',10);

INSERT INTO materia
(id_materia, id_profesor, nombre, descripcion)
VALUES
(1,1,'Matematicas','Estudio de numeros, operaciones, algebra y geometria.'),
(2,2,'Ciencias Sociales','Estudio de la sociedad, historia y geografia.'),
(3,3,'Biologia','Estudio de los seres vivos y sus procesos.'),
(4,4,'Lectura Critica','Comprension, interpretacion y analisis de textos.');

INSERT INTO matricula_materia
(id_matricula, id_materia, nota, avance)
VALUES
(1,1,4.5,90),(1,2,4.0,80),(1,3,4.2,85),(1,4,4.8,95),
(2,1,3.8,70),(2,2,4.2,85),(2,3,3.9,75),(2,4,4.5,90),
(3,1,4.7,95),(3,2,4.3,90),(3,3,4.5,90),(3,4,4.1,80),
(4,1,3.5,60),(4,2,3.9,70),(4,3,4.0,75),(4,4,4.2,85),
(5,1,4.1,80),(5,2,4.4,90),(5,3,4.6,95),(5,4,4.3,85),
(6,1,3.9,75),(6,2,4.0,80),(6,3,4.2,85),(6,4,4.5,90);

INSERT INTO login
(id_login, correo, contrasena, salt, id_estudiante, id_profesor)
VALUES
(1,'estudiante1@cerebrum.com',SHA2('Demo1234',256),MD5('salt001'),1,NULL),
(2,'estudiante2@cerebrum.com',SHA2('Demo1234',256),MD5('salt002'),2,NULL),
(3,'estudiante3@cerebrum.com',SHA2('Demo1234',256),MD5('salt003'),3,NULL),
(4,'estudiante4@cerebrum.com',SHA2('Demo1234',256),MD5('salt004'),4,NULL),
(5,'estudiante5@cerebrum.com',SHA2('Demo1234',256),MD5('salt005'),5,NULL),
(6,'profesor1@cerebrum.com',SHA2('Demo1234',256),MD5('salt006'),NULL,1),
(7,'profesor2@cerebrum.com',SHA2('Demo1234',256),MD5('salt007'),NULL,2),
(8,'profesor3@cerebrum.com',SHA2('Demo1234',256),MD5('salt008'),NULL,3);

INSERT INTO admin_academia
(id_admin, id_estudiante, nombre, apellido, nombre_academia, direccion_academia)
VALUES
(1,NULL,'Gabriel','Fernandez','Academia CEREBRUM','Bogota, Colombia'),
(2,NULL,'Laura','Martinez','Academia Aprender','Medellin, Colombia'),
(3,NULL,'Carlos','Ramirez','Academia Saber','Cali, Colombia');


INSERT INTO usuario
(id_usuario, id_estudiante, id_profesor, primer_nombre,
 segundo_nombre, primer_apellido, segundo_apellido,
 telefono, correo, contrasena, salt, rol, activo,
 intentos_fallidos, bloqueado, ultimo_acceso)
VALUES
(1,1,NULL,'Gabriel','Jose','Fernandez','Paez','3001112233',
 'estudiante1@cerebrum.com',SHA2('Demo1234',256),MD5('usuario001'),'estudiante',1,0,0,NOW()),

(2,2,NULL,'Laura','Camila','Rodriguez','Perez','3001112234',
 'estudiante2@cerebrum.com',SHA2('Demo1234',256),MD5('usuario002'),'estudiante',1,0,0,NOW()),

(3,3,NULL,'Andres','Felipe','Martinez','Lopez','3001112235',
 'estudiante3@cerebrum.com',SHA2('Demo1234',256),MD5('usuario003'),'estudiante',1,0,0,NOW()),

(4,4,NULL,'Daniela','Sofia','Garcia','Torres','3001112236',
 'estudiante4@cerebrum.com',SHA2('Demo1234',256),MD5('usuario004'),'estudiante',1,1,0,NOW()),

(5,5,NULL,'Juan','David','Lopez','Ramirez','3001112237',
 'estudiante5@cerebrum.com',SHA2('Demo1234',256),MD5('usuario005'),'estudiante',1,0,0,NOW()),

(6,6,NULL,'Valentina','Isabel','Castro','Moreno','3001112238',
 'estudiante6@cerebrum.com',SHA2('Demo1234',256),MD5('usuario006'),'estudiante',1,0,0,NOW()),

(7,7,NULL,'Santiago','Andres','Herrera','Diaz','3001112239',
 'estudiante7@cerebrum.com',SHA2('Demo1234',256),MD5('usuario007'),'estudiante',1,0,0,NOW()),

(8,8,NULL,'Maria','Alejandra','Rojas','Vargas','3001112240',
 'estudiante8@cerebrum.com',SHA2('Demo1234',256),MD5('usuario008'),'estudiante',1,0,0,NOW()),

(9,9,NULL,'Sebastian','David','Gomez','Ruiz','3001112241',
 'estudiante9@cerebrum.com',SHA2('Demo1234',256),MD5('usuario009'),'estudiante',0,5,1,NULL),

(10,10,NULL,'Camila','Andrea','Morales','Cruz','3001112242',
 'estudiante10@cerebrum.com',SHA2('Demo1234',256),MD5('usuario010'),'estudiante',1,0,0,NOW()),

(11,11,NULL,'Nicolas','Esteban','Jimenez','Ortiz','3001112243',
 'estudiante11@cerebrum.com',SHA2('Demo1234',256),MD5('usuario011'),'estudiante',1,0,0,NOW()),

(12,12,NULL,'Isabella','Maria','Torres','Silva','3001112244',
 'estudiante12@cerebrum.com',SHA2('Demo1234',256),MD5('usuario012'),'estudiante',1,0,0,NOW()),

(13,13,NULL,'Mateo','Alejandro','Diaz','Mendoza','3001112245',
 'estudiante13@cerebrum.com',SHA2('Demo1234',256),MD5('usuario013'),'estudiante',1,0,0,NOW()),

(14,14,NULL,'Sara','Valentina','Reyes','Castillo','3001112246',
 'estudiante14@cerebrum.com',SHA2('Demo1234',256),MD5('usuario014'),'estudiante',1,0,0,NOW()),

(15,15,NULL,'Samuel','Andres','Vargas','Molina','3001112247',
 'estudiante15@cerebrum.com',SHA2('Demo1234',256),MD5('usuario015'),'estudiante',1,0,0,NOW()),

(16,16,NULL,'Juliana','Paola','Cortes','Navarro','3001112248',
 'estudiante16@cerebrum.com',SHA2('Demo1234',256),MD5('usuario016'),'estudiante',1,0,0,NOW()),

(17,17,NULL,'David','Santiago','Ortega','Rios','3001112249',
 'estudiante17@cerebrum.com',SHA2('Demo1234',256),MD5('usuario017'),'estudiante',1,0,0,NOW()),

(18,18,NULL,'Mariana','Lucia','Acosta','Pineda','3001112250',
 'estudiante18@cerebrum.com',SHA2('Demo1234',256),MD5('usuario018'),'estudiante',1,0,0,NOW()),

(19,19,NULL,'Alejandro','Jose','Mendez','Leon','3001112251',
 'estudiante19@cerebrum.com',SHA2('Demo1234',256),MD5('usuario019'),'estudiante',1,0,0,NOW()),

(20,NULL,1,'Carlos','Alberto','Ramirez','Gomez','3105551001',
 'profesor1@cerebrum.com',SHA2('Demo1234',256),MD5('usuario020'),'profesor',1,0,0,NOW()),

(21,NULL,2,'Patricia','Elena','Morales','Diaz','3105551002',
 'profesor2@cerebrum.com',SHA2('Demo1234',256),MD5('usuario021'),'profesor',1,0,0,NOW()),

(22,NULL,3,'Andres','Felipe','Castillo','Rojas','3105551003',
 'profesor3@cerebrum.com',SHA2('Demo1234',256),MD5('usuario022'),'profesor',1,0,0,NOW()),

(23,NULL,4,'Monica','Isabel','Torres','Vargas','3105551004',
 'profesor4@cerebrum.com',SHA2('Demo1234',256),MD5('usuario023'),'profesor',1,0,0,NOW()),

(24,NULL,NULL,'Administrador','General','CEREBRUM','Sistema','3009999999',
 'admin@cerebrum.com',SHA2('Admin1234',256),MD5('usuario024'),'admin',1,0,0,NOW());


INSERT INTO tema
(id_tema, id_materia, nombre_tema, descripcion)
VALUES
(1,1,'Numeros naturales','Conceptos y operaciones con numeros naturales.'),
(2,1,'Numeros enteros','Representacion y operaciones con enteros.'),
(3,1,'Fracciones','Representacion y operaciones con fracciones.'),
(4,1,'Numeros decimales','Operaciones con numeros decimales.'),
(5,1,'Porcentajes','Calculo y aplicacion de porcentajes.'),
(6,1,'Potenciacion','Propiedades de las potencias.'),
(7,1,'Radicacion','Raices y operaciones de radicacion.'),
(8,1,'Algebra','Expresiones y lenguaje algebraico.'),
(9,2,'Historia de Colombia','Procesos historicos de Colombia.'),
(10,2,'Historia universal','Principales acontecimientos mundiales.'),
(11,2,'Geografia','Espacio geografico y territorio.'),
(12,2,'Democracia','Participacion y sistemas democraticos.'),
(13,2,'Derechos humanos','Derechos fundamentales y convivencia.'),
(14,2,'Economia','Conceptos economicos basicos.'),
(15,2,'Cultura','Diversidad cultural y patrimonio.'),
(16,3,'La celula','Estructura y funcionamiento celular.'),
(17,3,'Genetica','Herencia y variacion biologica.'),
(18,3,'Ecosistemas','Relaciones entre organismos y ambiente.'),
(19,3,'Sistema digestivo','Procesos de digestion humana.'),
(20,3,'Sistema respiratorio','Funcionamiento de la respiracion.'),
(21,3,'Reproduccion','Reproduccion de los seres vivos.'),
(22,3,'Clasificacion biologica','Clasificacion de los organismos.'),
(23,4,'Comprension lectora','Identificacion de informacion explicita.'),
(24,4,'Idea principal','Reconocimiento de ideas principales.'),
(25,4,'Inferencias','Interpretacion de informacion implicita.'),
(26,4,'Argumentacion','Analisis de argumentos y opiniones.'),
(27,4,'Tipos de texto','Caracteristicas de diferentes textos.');

INSERT INTO subtema
(id_subtema, id_tema, nombre_subtema, descripcion)
VALUES
(1,1,'Suma y resta','Operaciones basicas con numeros naturales.'),
(2,2,'Numeros negativos','Identificacion y uso de numeros negativos.'),
(3,3,'Fracciones propias','Identificacion de fracciones propias.'),
(4,4,'Suma decimal','Suma de numeros decimales.'),
(5,5,'Porcentaje de una cantidad','Calculo porcentual.'),
(6,6,'Leyes de los exponentes','Propiedades de potenciacion.'),
(7,7,'Raiz cuadrada','Calculo de raices cuadradas.'),
(8,8,'Expresiones algebraicas','Variables y constantes.'),
(9,9,'Independencia','Proceso de independencia colombiana.'),
(10,10,'Edad contemporanea','Acontecimientos contemporaneos.'),
(11,11,'Regiones naturales','Regiones naturales de Colombia.'),
(12,12,'Participacion ciudadana','Mecanismos de participacion.'),
(13,13,'Derechos fundamentales','Derechos constitucionales.'),
(14,14,'Oferta y demanda','Principios economicos.'),
(15,15,'Identidad cultural','Elementos de identidad cultural.'),
(16,16,'Partes de la celula','Organelos y funciones.'),
(17,17,'ADN','Estructura y funcion del ADN.'),
(18,18,'Cadenas alimenticias','Relaciones alimentarias.'),
(19,19,'Organos digestivos','Organos del sistema digestivo.'),
(20,20,'Intercambio gaseoso','Proceso de intercambio de gases.'),
(21,21,'Reproduccion sexual','Caracteristicas de la reproduccion sexual.'),
(22,22,'Reinos biologicos','Clasificacion de los seres vivos.'),
(23,23,'Informacion explicita','Localizacion de informacion textual.'),
(24,24,'Tema central','Identificacion del tema principal.'),
(25,25,'Informacion implicita','Deducciones a partir de un texto.'),
(26,26,'Tesis y argumentos','Identificacion de tesis y argumentos.'),
(27,27,'Texto narrativo','Caracteristicas del texto narrativo.');

INSERT INTO preguntas
(id_pregunta, enunciado, dificultad)
VALUES
(1,'¿Cuanto es 15 + 25?','facil'),
(2,'¿Cuanto es 100 / 4?','facil'),
(3,'¿Cuanto es el 20% de 200?','medio'),
(4,'¿En que año se declaro la independencia de Colombia?','medio'),
(5,'¿Cual es la unidad basica de los seres vivos?','facil'),
(6,'¿Que organelo celular produce energia?','medio'),
(7,'¿Que organo permite el intercambio de gases?','facil'),
(8,'¿Que es la idea principal de un texto?','medio'),
(9,'¿Que es una fraccion equivalente?','medio'),
(10,'¿Que molecula contiene la informacion genetica?','medio'),
(11,'¿Que mecanismo permite elegir representantes?','facil'),
(12,'¿Que es una inferencia en la lectura?','dificil');

INSERT INTO preguntas_subtema
(id_pregunta, id_subtema)
VALUES
(1,1),
(2,1),
(3,5),
(4,9),
(5,16),
(6,16),
(7,20),
(8,24),
(9,3),
(10,17),
(11,12),
(12,25);

INSERT INTO opciones
(id_opcion, id_pregunta, texto_opcion, es_correcta)
VALUES
(1,1,'30',0),
(2,1,'40',1),
(3,1,'45',0),
(4,1,'50',0),

(5,2,'20',0),
(6,2,'25',1),
(7,2,'30',0),
(8,2,'40',0),

(9,3,'20',0),
(10,3,'40',1),
(11,3,'60',0),
(12,3,'80',0),

(13,4,'1810',1),
(14,4,'1819',0),
(15,4,'1821',0),
(16,4,'1900',0),

(17,5,'El tejido',0),
(18,5,'La celula',1),
(19,5,'El organo',0),
(20,5,'El sistema',0),

(21,6,'Mitocondria',1),
(22,6,'Ribosoma',0),
(23,6,'Nucleo',0),
(24,6,'Membrana',0),

(25,7,'Pulmones',1),
(26,7,'Estomago',0),
(27,7,'Higado',0),
(28,7,'Rinones',0),

(29,8,'La informacion mas importante del texto',1),
(30,8,'Una palabra desconocida',0),
(31,8,'El titulo solamente',0),
(32,8,'Una opinion personal',0),

(33,9,'Una fraccion que representa el mismo valor',1),
(34,9,'Una fraccion negativa',0),
(35,9,'Una fraccion sin denominador',0),
(36,9,'Una multiplicacion',0),

(37,10,'ADN',1),
(38,10,'Agua',0),
(39,10,'Glucosa',0),
(40,10,'Oxigeno',0),

(41,11,'El voto',1),
(42,11,'La lectura',0),
(43,11,'La escritura',0),
(44,11,'La observacion',0),

(45,12,'Una conclusion obtenida a partir de pistas del texto',1),
(46,12,'Copiar una frase literalmente',0),
(47,12,'Leer solamente el titulo',0),
(48,12,'Cambiar el tema del texto',0);

INSERT INTO tipo_pregunta
(id_tipo, id_pregunta, tipo)
VALUES
(1,1,'Seleccion multiple'),
(2,2,'Seleccion multiple'),
(3,3,'Seleccion multiple'),
(4,4,'Seleccion multiple'),
(5,5,'Seleccion multiple'),
(6,6,'Seleccion multiple'),
(7,7,'Seleccion multiple'),
(8,8,'Seleccion multiple'),
(9,9,'Seleccion multiple'),
(10,10,'Seleccion multiple'),
(11,11,'Seleccion multiple'),
(12,12,'Seleccion multiple');

INSERT INTO evaluacion
(id_evaluacion, fecha_inicio, fecha_fin, perls_obtenidas)
VALUES
(1,'2026-11-01 08:00:00','2026-11-01 08:30:00',20),
(2,'2026-11-02 09:00:00','2026-11-02 09:40:00',30),
(3,'2026-11-03 10:00:00','2026-11-03 10:25:00',15),
(4,'2026-11-04 11:00:00','2026-11-04 11:45:00',40);

INSERT INTO preguntas_evaluacion
(id_pregunta, id_evaluacion, id_opcion, calificacion)
VALUES
(1,1,2,100),
(2,1,6,100),
(3,1,10,100),
(4,2,13,100),
(5,2,18,100),
(6,2,21,100),
(7,3,25,100),
(8,3,29,100),
(9,3,33,100),
(10,4,37,100),
(11,4,41,100),
(12,4,45,100);

INSERT INTO contenido
(id_contenido, id_subtema, titulo, descripcion, tipo_contenido)
VALUES
(1,1,'Aprende a sumar','Introduccion a la suma de numeros naturales.','Video'),
(2,2,'Numeros negativos','Material educativo sobre numeros negativos.','Documento'),
(3,3,'Fracciones propias','Explicacion de las fracciones propias.','Lectura'),
(4,5,'Calculo de porcentajes','Ejercicios practicos de porcentajes.','Actividad'),
(5,9,'Independencia de Colombia','Contenido historico sobre la independencia.','Video'),
(6,11,'Regiones de Colombia','Estudio de las regiones naturales.','Documento'),
(7,12,'Participacion ciudadana','Mecanismos democraticos de participacion.','Lectura'),
(8,16,'La celula','Introduccion a la estructura celular.','Video'),
(9,17,'El ADN','Material sobre genetica y ADN.','Documento'),
(10,18,'Cadenas alimenticias','Explicacion de las relaciones alimentarias.','Actividad'),
(11,20,'Sistema respiratorio','Funcionamiento del sistema respiratorio.','Video'),
(12,23,'Comprension lectora','Ejercicios de comprension textual.','Actividad'),
(13,24,'Idea principal','Como identificar la idea principal.','Lectura'),
(14,25,'Inferencias','Ejercicios de interpretacion textual.','Actividad'),
(15,27,'Textos narrativos','Caracteristicas de los textos narrativos.','Documento');
