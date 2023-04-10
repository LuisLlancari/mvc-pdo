CREATE DATABASE senati;
USE senati;

CREATE TABLE cursos
(
	idcurso			INT AUTO_INCREMENT PRIMARY KEY,
	nombrecurso		VARCHAR(50)		NOT NULL,
	especialidad 	VARCHAR(70) 	NOT NULL,
	complejidad 	CHAR(1)			NOT NULL DEFAULT 'B',
	fechainicio		DATE 				NOT NULL,
	precio				DECIMAL(7,2)	NOT NULL,
	fechacreacion	DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME 		NULL,
	estado 				CHAR(1)			NOT NULL DEFAULT '1'
)ENGINE = INNODB;

INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
	('Java', 'ETI', 'M', '2023-05-10', 180),
	('Desarrollo Web', 'ETI', 'B', '2023-04-20', 190),
	('Excel financiero', 'Administración', 'A', '2023-05-14', 250),
	('ERP SAP', 'Administración', 'A', '2023-05-11', 400),
	('Inventor', 'Mecánica', 'M', '2023-04-29', 380);

SELECT * FROM cursos;

-- STORE PROCEDURE
-- Un procedimiento almacenado es un PROGRAMA que se ejecuta desde el
-- motor de BD, y que permite recibir valores de entrada, realizar
-- diferentes tipos de cálculos y entregar una salida.

-- DROP PROCEDURE spu_cursos_listar;
DELIMITER $$
CREATE PROCEDURE spu_cursos_listar()
BEGIN
	SELECT	idcurso,
				nombrecurso,
				especialidad,
				complejidad,
				fechainicio,
				precio
		FROM cursos
		WHERE estado = '1'
		ORDER BY idcurso DESC;
END $$

CALL spu_cursos_listar();

-- Procedimiento registrar cursos
DELIMITER $$
CREATE PROCEDURE spu_cursos_registrar
(
	IN _nombrecurso	VARCHAR(50),
	IN _especialidad	VARCHAR(70),
	IN _complejidad	CHAR(1),
	IN _fechainicio	DATE,
	IN _precio			DECIMAL(7,2)
)
BEGIN
	INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
		(_nombrecurso, _especialidad, _complejidad, _fechainicio, _precio);
END $$

CALL spu_cursos_registrar('Python para todos', 'ETI', 'B', '2023-05-10', 120);
CALL spu_cursos_listar();


CREATE DATABASE senati;
USE senati;

CREATE TABLE cursos
(
	idcurso			INT AUTO_INCREMENT PRIMARY KEY,
	nombrecurso		VARCHAR(50)		NOT NULL,
	especialidad 	VARCHAR(70) 	NOT NULL,
	complejidad 	CHAR(1)			NOT NULL DEFAULT 'B',
	fechainicio		DATE 				NOT NULL,
	precio			DECIMAL(7,2)	NOT NULL,
	fechacreacion	DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME 		NULL,
	estado 			CHAR(1)			NOT NULL DEFAULT '1'
)ENGINE = INNODB;

INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
	('Java', 'ETI', 'M', '2023-05-10', 180),
	('Desarrollo Web', 'ETI', 'B', '2023-04-20', 190),
	('Excel financiero', 'Administración', 'A', '2023-05-14', 250),
	('ERP SAP', 'Administración', 'A', '2023-05-11', 400),
	('Inventor', 'Mecánica', 'M', '2023-04-29', 380);

SELECT * FROM cursos;

-- STORE PROCEDURE
-- Un procedimiento almacenado es un PROGRAMA que se ejecuta desde el
-- motor de BD, y que permite recibir valores de entrada, realizar
-- diferentes tipos de cálculos y entregar una salida.

-- DROP PROCEDURE spu_cursos_listar;
DELIMITER $$
CREATE PROCEDURE spu_cursos_listar()
BEGIN
	SELECT	idcurso,
				nombrecurso,
				especialidad,
				complejidad,
				fechainicio,
				precio
		FROM cursos
		WHERE estado = '1'
		ORDER BY idcurso DESC;
END $$

CALL spu_cursos_listar();

-- Procedimiento registrar cursos
DELIMITER $$
CREATE PROCEDURE spu_cursos_registrar
(
	IN _nombrecurso	VARCHAR(50),
	IN _especialidad	VARCHAR(70),
	IN _complejidad	CHAR(1),
	IN _fechainicio	DATE,
	IN _precio			DECIMAL(7,2)
)
BEGIN
	INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
		(_nombrecurso, _especialidad, _complejidad, _fechainicio, _precio);
END $$

CALL spu_cursos_registrar('Python para todos', 'ETI', 'B', '2023-05-10', 120);
CALL spu_cursos_insertar('c# para la web', 'ETI', 'A', '2023-05-10', 220);
CALL spu_cursos_listar();




-- PROCEDIMIENTO PARA ELIINAR
DELIMITER $$
CREATE PROCEDURE spu_cursos_eliminar(IN idcurso_ INT)
BEGIN
	UPDATE cursos
	SET estado = '0'
	WHERE idcurso = idcurso_;
END$$

CALL spu_cursos_eliminar(1);
`senati`
-- recuperar

DELIMITER$$
CREATE PROCEDURE spu_cursos_recuperar_id(IN idcurso_ INT)
BEGIN
	SELECT * FROM cursos WHERE idcurso = idcurso_;
END$$

CALL spu_cursos_recuperar_id(16)


DELIMITER$$
CREATE PROCEDURE spu_cursos_actualizar
(
	IN idcurso_ 	INT,
	IN nombrecurso_  VARCHAR(50),
	IN especialidad_ VARCHAR(70),
	IN complejidad_  CHAR(1),
	IN fechainicio_  DATE,
	IN precio_		DECIMAL(7,2)
)
BEGIN
	UPDATE cursos SET
		nombrecurso = nombrecurso_,
		especialidad = especialidad_,
		complejidad = complejidad_,
		fechainicio = fechainicio_,
		precio = precio_,
		fechaupdate = NOW()
	WHERE idcurso = idcurso_;
END$$

CALL spu_cursos_actualizar(16,'Java','administracion','B','2023-06-20',450);


CREATE TABLE ususarios
(
	idusuario		INT  				AUTO_INCREMENT 	PRIMARY KEY,
	nombreusuario 	VARCHAR(30) 	NOT NULL,
	claveacceso 	VARCHAR(90) 	NOT NULL,
	apellidos	 	VARCHAR(30) 	NOT NULL,
	nombres		 	VARCHAR(30) 	NOT NULL,
	nivelacceso		CHAR(1) 			NOT NULL DEFAULT'A',
	estado			CHAR(1)    		NOT NULL DEFAULT'1',
	fecharegistro  DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME			NULL,
	CONSTRAINT uk_nombreusuario_usa UNIQUE (nombreusuario)
)ENGINE =INNODB;

INSERT INTO usuarios (nombreusuario, claveacceso, apellidos, nombres) VALUES
	('Luis','123456','LLancari','Luis'),
	('bla','123456','LLanri','Miguel');






CREATE DATABASE senati;
USE senati;

CREATE TABLE cursos
(
	idcurso			INT AUTO_INCREMENT PRIMARY KEY,
	nombrecurso		VARCHAR(50)		NOT NULL,
	especialidad 	VARCHAR(70) 	NOT NULL,
	complejidad 	CHAR(1)			NOT NULL DEFAULT 'B',
	fechainicio		DATE 				NOT NULL,
	precio			DECIMAL(7,2)	NOT NULL,
	fechacreacion	DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME 		NULL,
	estado 			CHAR(1)			NOT NULL DEFAULT '1'
)ENGINE = INNODB;

INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
	('Java', 'ETI', 'M', '2023-05-10', 180),
	('Desarrollo Web', 'ETI', 'B', '2023-04-20', 190),
	('Excel financiero', 'Administración', 'A', '2023-05-14', 250),
	('ERP SAP', 'Administración', 'A', '2023-05-11', 400),
	('Inventor', 'Mecánica', 'M', '2023-04-29', 380);

SELECT * FROM cursos;

-- STORE PROCEDURE
-- Un procedimiento almacenado es un PROGRAMA que se ejecuta desde el
-- motor de BD, y que permite recibir valores de entrada, realizar
-- diferentes tipos de cálculos y entregar una salida.

-- DROP PROCEDURE spu_cursos_listar;
DELIMITER $$
CREATE PROCEDURE spu_cursos_listar()
BEGIN
	SELECT	idcurso,
				nombrecurso,
				especialidad,
				complejidad,
				fechainicio,
				precio
		FROM cursos
		WHERE estado = '1'
		ORDER BY idcurso DESC;
END $$

CALL spu_cursos_listar();

-- Procedimiento registrar cursos
DELIMITER $$
CREATE PROCEDURE spu_cursos_registrar
(
	IN _nombrecurso	VARCHAR(50),
	IN _especialidad	VARCHAR(70),
	IN _complejidad	CHAR(1),
	IN _fechainicio	DATE,
	IN _precio			DECIMAL(7,2)
)
BEGIN
	INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
		(_nombrecurso, _especialidad, _complejidad, _fechainicio, _precio);
END $$

CALL spu_cursos_registrar('Python para todos', 'ETI', 'B', '2023-05-10', 120);
CALL spu_cursos_listar();


CREATE DATABASE senati;
USE senati;

CREATE TABLE cursos
(
	idcurso			INT AUTO_INCREMENT PRIMARY KEY,
	nombrecurso		VARCHAR(50)		NOT NULL,
	especialidad 	VARCHAR(70) 	NOT NULL,
	complejidad 	CHAR(1)			NOT NULL DEFAULT 'B',
	fechainicio		DATE 				NOT NULL,
	precio			DECIMAL(7,2)	NOT NULL,
	fechacreacion	DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME 		NULL,
	estado 			CHAR(1)			NOT NULL DEFAULT '1'
)ENGINE = INNODB;

INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
	('Java', 'ETI', 'M', '2023-05-10', 180),
	('Desarrollo Web', 'ETI', 'B', '2023-04-20', 190),
	('Excel financiero', 'Administración', 'A', '2023-05-14', 250),
	('ERP SAP', 'Administración', 'A', '2023-05-11', 400),
	('Inventor', 'Mecánica', 'M', '2023-04-29', 380);

SELECT * FROM cursos;

-- STORE PROCEDURE
-- Un procedimiento almacenado es un PROGRAMA que se ejecuta desde el
-- motor de BD, y que permite recibir valores de entrada, realizar
-- diferentes tipos de cálculos y entregar una salida.

-- DROP PROCEDURE spu_cursos_listar;
DELIMITER $$
CREATE PROCEDURE spu_cursos_listar()
BEGIN
	SELECT	idcurso,
				nombrecurso,
				especialidad,
				complejidad,
				fechainicio,
				precio
		FROM cursos
		WHERE estado = '1'
		ORDER BY idcurso DESC;
END $$

CALL spu_cursos_listar();

-- Procedimiento registrar cursos
DELIMITER $$
CREATE PROCEDURE spu_cursos_registrar
(
	IN _nombrecurso	VARCHAR(50),
	IN _especialidad	VARCHAR(70),
	IN _complejidad	CHAR(1),
	IN _fechainicio	DATE,
	IN _precio			DECIMAL(7,2)
)
BEGIN
	INSERT INTO cursos (nombrecurso, especialidad, complejidad, fechainicio, precio) VALUES
		(_nombrecurso, _especialidad, _complejidad, _fechainicio, _precio);
END $$

CALL spu_cursos_registrar('Python para todos', 'ETI', 'B', '2023-05-10', 120);
CALL spu_cursos_insertar('c# para la web', 'ETI', 'A', '2023-05-10', 220);
CALL spu_cursos_listar();




-- PROCEDIMIENTO PARA ELIINAR
DELIMITER $$
CREATE PROCEDURE spu_cursos_eliminar(IN idcurso_ INT)
BEGIN
	UPDATE cursos
	SET estado = '0'
	WHERE idcurso = idcurso_;
END$$

CALL spu_cursos_eliminar(1);
`senati`
-- recuperar

DELIMITER$$
CREATE PROCEDURE spu_cursos_recuperar_id(IN idcurso_ INT)
BEGIN
	SELECT * FROM cursos WHERE idcurso = idcurso_;
END$$

CALL spu_cursos_recuperar_id(16)


DELIMITER$$
CREATE PROCEDURE spu_cursos_actualizar
(
	IN idcurso_ 	INT,
	IN nombrecurso_  VARCHAR(50),
	IN especialidad_ VARCHAR(70),
	IN complejidad_  CHAR(1),
	IN fechainicio_  DATE,
	IN precio_		DECIMAL(7,2)
)
BEGIN
	UPDATE cursos SET
		nombrecurso = nombrecurso_,
		especialidad = especialidad_,
		complejidad = complejidad_,
		fechainicio = fechainicio_,
		precio = precio_,
		fechaupdate = NOW()
	WHERE idcurso = idcurso_;
END$$

CALL spu_cursos_actualizar(16,'Java','administracion','B','2023-06-20',450);


CREATE TABLE usuarios
(
	idusuario		INT  				AUTO_INCREMENT 	PRIMARY KEY,
	nombreusuario 	VARCHAR(30) 	NOT NULL,
	claveacceso 	VARCHAR(90) 	NOT NULL,
	apellidos	 	VARCHAR(30) 	NOT NULL,
	nombres		 	VARCHAR(30) 	NOT NULL,
	nivelacceso		CHAR(1) 			NOT NULL DEFAULT'A',
	estado			CHAR(1)    		NOT NULL DEFAULT'1',
	fecharegistro  DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 	DATETIME			NULL,
	CONSTRAINT uk_nombreusuario_usa UNIQUE (nombreusuario)
)ENGINE =INNODB;

SELECT * FROM usuarios

INSERT INTO usuarios (nombreusuario, claveacceso, apellidos, nombres) VALUES
	('Luis','123456','LLancari','Luis'),
	('bla','123456','LLanri','Miguel');


-- AcTUALIZANDO por clave
UPDATE usuarios SET
	claveacceso = '$2y$10$f3IVX.JWCDDwLQd/Mng27Of6LxzwOVwBflXRI2wfRBQOMiJf91x06'
	WHERE idusuario = 1;
	
	UPDATE usuarios SET
		claveacceso = '$2y$10$f3IVX.JWCDDwLQd/Mng27Of6LxzwOVwBflXRI2wfRBQOMiJf91x06'
		WHERE idusuario = 2;	
	
DELIMITER$$
CREATE PROCEDURE spu_usuarios_login(IN nombreusuario_ VARCHAR(30))
BEGIN
	SELECT  idusuario, nombreusuario, claveacceso, apellidos,
				nombres,nivelacceso
		FROM usuarios
		WHERE nombreusuario = nombreusuario_ AND estado = '1';
END$$

CALL spu_usuarios_login('Luis')

-- CREANDO PROCEDIMIENTO ALMACENADOS PARA USUARIOS

delimiter$$
create procedure spu_listar_usuarios()
begin
	select idusuario,nombreusuario, apellidos, nombres,nivelacceso, fecharegistro
	from usuarios where estado = '1';
end$$

call spu_listar_usuarios()

DELIMITER $$
CREATE PROCEDURE spu_usuarios_registrar
(
	IN _nombreusuario	 VARCHAR(30),
	IN _claveacceso	 VARCHAR(90),
	IN _apellidos		 VARCHAR(30),
	IN _nombres			 varchar(30),
	IN _nivelacceso	 char(1)
	
)
BEGIN
	INSERT INTO cursos (nombreusario, claveacceso, apellidos, nombres, nivelacceso) VALUES
		(_nombrecurso, _claveacceso, _apellidos, _nombres, _nivelacceso);
END $$



