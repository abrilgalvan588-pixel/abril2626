CREATE DATABASE hospital;
GO

USE hospital;
GO

CREATE TABLE paciente (
nombre_paciente VARCHAR (100) NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
fecha_nacimiento DATE,
CONSTRAINT pk_paciente PRIMARY KEY (nombre_paciente)

);
GO

CREATE TABLE expediente (
num_expediente INT IDENTITY(1,1) NOT NULL,
fecha_apertura DATE NOT NULL,
tipo_sangre CHAR(3),
nombre_paciente VARCHAR(100) NOT NULL,
CONSTRAINT pk_expediente PRIMARY KEY (num_expediente),
CONSTRAINT uq_expediente_paciente UNIQUE (nombre_paciente),
CONSTRAINT fk_expediente_paciente FOREIGN KEY (nombre_paciente)
REFERENCES paciente (nombre_paciente)

);
GO