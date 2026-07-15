-- ALTER
 CREATE DATABASE escuelita;
 GO

 USE escuelita;
 GO

 CREATE TABLE alumno(
  alumno_id INT IDENTITY (1,1),
  nombre VARCHAR (20) NOT NULL,
  apellido_paterno VARCHAR (15) NOT NULL,
  apellido_materno VARCHAR (15),
  CONSTRAINT pk_alumno 
  PRIMARY KEY (alumno_id)
 );
 GO 

 -- Agregar una columna a una tabala existente
 ALTER TABLE alumno
 ADD telefono VARCHAR (20);
 GO

 -- A gregar varias columnas 
 ALTER TABLE alumno 
 ADD
 crup CHAR (18),
 rfc CHAR (13);

 -- Modificar el tipo de dato 
 ALTER TABLE alumno
 ALTER COLUMN 
 telefono VARCHAR (30) NOT NULL;
 GO 

  CREATE TABLE alumno2(
  alumno_id INT IDENTITY (1,1),
  nombre VARCHAR (20) NOT NULL,
  apellido_paterno VARCHAR (15) NOT NULL,
  apellido_materno VARCHAR (15),
 );
 GO 

 -- Agregar un PRIMARY KEY 

 ALTER TABLE alumno2
 ADD CONSTRAINT pk_alumno2
 PRIMARY KEY (alumno_id);

CREATE TABLE carrera(
carrera_id INT IDENTITY (1,1)
CONSTRAINT pk_carrera
PRIMARY KEY (carrera_id),
nombre VARCHAR (10) NOT NULL
);

-- Agregar un campo para foreing key en alumno 
ALTER TABLE alumno
ADD
carrera_id INT;

-- Agregar restriccion FOREING KEY 
ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera (carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- AGREGAR CAMPO EDAD A LA TABA ALUMNO 
ALTER TABLE alumno
ADD
edad INT;

--AGREGAR UNA RESTRICCION CHECK 
ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad
CHECK (edad>=18);
GO

-- TODO: CONTINUAR CON RESTRICCIONES DEFAULT 