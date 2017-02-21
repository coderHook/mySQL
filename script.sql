
-- Borrado de cualquier base de datos que exista

DROP SCHEMA IF EXISTS `AEC3`;

-- CREACION DE LA BASE DE DATOS

CREATE SCHEMA IF NOT EXISTS `AEC3` DEFAULT CHARACTER SET utf8;

-- PROGRAMACION DE LAS TABLAS

USE `AEC3`; -- a partir de este momento nuestro gestor ya sabe que estamos usando esta base de datos.alter

-- CREAMOS LA TABLA OPERARIO, LA CUAL ESTARA INCOMPLETA HASTA UE CREEMOS LA TABLA PARQUE NATURAL

CREATE TABLE IF NOT EXISTS `AEC3`.`OPERARIO`(
`DNI` VARCHAR(100) NOT NULL,
`NOMBRE` VARCHAR(60) NOT NULL,
`CARGO` VARCHAR(40) NOT NULL,
`SUELDO` FLOAT NOT NULL,
`FECHA_DE_NACIMIENTO` DATE NOT NULL, -- FORMATO DATE = AAAA-MM-DD
`FECHA_DE_INCORPORACION` DATE NOT NULL,
PRIMARY KEY(`DNI`)
);

-- CREAMOS LA TABLA PARQUE NATURAL

CREATE TABLE IF NOT EXISTS `AEC3`.`PARQUE_NATURAL`(
`NOMBRE` VARCHAR(60) NOT NULL,
`PAIS`VARCHAR(40) NOT NULL,
`EXTENSION` FLOAT NOT NULL,
`PATRIMONIO_DE_LA_HUMANIDAD` VARCHAR(3) NOT NULL, -- DAMOS 3 CARACTERES POR SI SE QUIERE PONER YES/NO AUNQUE LA PREFERENICA SERA SI/NO
`Dni_Operario_Director` VARCHAR(9) DEFAULT NULL, 
PRIMARY KEY (`NOMBRE`),
FOREIGN KEY (`Dni_Operario_Director`)
	REFERENCES `AEC3`.`OPERARIO`(`DNI`)
);

-- una vez que ya existe la tabla "PARQUE NATURAL" ya podemos insertar la FK en OPERARIO que apunte al parque natural alter

ALTER TABLE `AEC3`.`OPERARIO`
ADD COLUMN `Nombre_ParqueNatural_Adscrito` VARCHAR(60);

ALTER TABLE `AEC3`.`OPERARIO`
ADD FOREIGN KEY (`Nombre_ParqueNatural_Adscrito`)
	REFERENCES `AEC3`.`PARQUE_NATURAL`(`NOMBRE`);

-- CREAMOS LA TABLA VEHICULO

CREATE TABLE IF NOT EXISTS `AEC3`.`VEHICULO` (
`MATRICULA` VARCHAR(7) NOT NULL,
`MODELO` VARCHAR(20) NOT NULL,
`MARCA` VARCHAR(20) NOT NULL,
`PLAZAS` INTEGER(2) NOT NULL,
`Nombre_Parque_Dispone_de` VARCHAR(60) DEFAULT NULL,
PRIMARY KEY(`MATRICULA`),
FOREIGN KEY (`Nombre_Parque_Dispone_de`)
	REFERENCES `AEC3`.`PARQUE_NATURAL`(`NOMBRE`)
);

-- CREAMOS LA TABLA SAFARI

CREATE TABLE IF NOT EXISTS `AEC3`.`SAFARI`(
`NOMBRE` VARCHAR(60) NOT NULL,
`DURACION` FLOAT NOT NULL, -- SE INDICARA SI ES 1 HORA, 2 HORAS O 5 HORAS O 2.5 HORAS
`PRECIO` FLOAT NOT NULL,
`DESCRIPCION` VARCHAR(300) NOT NULL, 
`Nombre_Parque_Oferta` VARCHAR(60) DEFAULT NULL,
PRIMARY KEY (`NOMBRE`),
FOREIGN KEY(`Nombre_Parque_Oferta`)
	REFERENCES `AEC3`.`PARQUE_NATURAL`(`NOMBRE`)
);

-- CREAMOS LA TABLA ESPECIE

CREATE TABLE IF NOT EXISTS `AEC3`.`ESPECIE`(
`NOMBRE` VARCHAR(60) NOT NULL, -- LA CLAVE PRIMARY KEY YA INCORPORA LA ETIQUETA UNIQUE Y NOT NULL
`TAMAÑO MEDIO` FLOAT NOT NULL, -- AL TRATARSE DE TAMAÑO Y PESOS MEDIOS ELEGIMOS FLOAT COMO VALOR
`PESO MEDIO` FLOAT NOT NULL, 
`HABITOS` VARCHAR(250) NOT NULL,
`ALIMENTACION`VARCHAR(200) NOT NULL,
PRIMARY KEY(`NOMBRE`)
);

-- CREAMOS LA TABLA CONTEMPLA

CREATE TABLE IF NOT EXISTS `AEC3`.`CONTEMPLA`(
`Nombre_Safari_Contempla` VARCHAR(60) NOT NULL,
`Nombre_Especie_Animal_Contempla` VARCHAR(60) NOT NULL,
PRIMARY KEY (`Nombre_Safari_Contempla`,`Nombre_Especie_Animal_Contempla`),
FOREIGN KEY (`Nombre_Safari_Contempla`)
	REFERENCES `AEC3`.`SAFARI`(`NOMBRE`),
FOREIGN KEY (`Nombre_Especie_Animal_Contempla`)
	REFERENCES `AEC3`.`ESPECIE`(`NOMBRE`)
);


-- FINALIZA EL PROGRAMA DE CREACIÓN DE TABLAS


