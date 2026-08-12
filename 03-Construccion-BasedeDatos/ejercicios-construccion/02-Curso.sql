CREATE DATABASE curso;
GO

USE curso;
GO

CREATE TABLE Profesor (
    NombreProfesor VARCHAR(100) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50),
    CONSTRAINT pk_Profesor PRIMARY KEY (NombreProfesor)
);
GO

CREATE TABLE Curso (
    NumCurso INT IDENTITY(1,1) NOT NULL,
    NombreCurso VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    NombreProfesor VARCHAR(100) NOT NULL,
    CONSTRAINT pk_Curso PRIMARY KEY (NumCurso),
    CONSTRAINT fk_Curso_Profesor FOREIGN KEY (NombreProfesor)
        REFERENCES Profesor (NombreProfesor)
);
GO

CREATE TABLE Especialidad (
    EspecialidadID INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Profesor VARCHAR(100) NOT NULL,
    Row3 VARCHAR(100),
    CONSTRAINT pk_Especialidad PRIMARY KEY (EspecialidadID),
    CONSTRAINT fk_Especialidad_Profesor FOREIGN KEY (Profesor)
        REFERENCES Profesor (NombreProfesor)
);
GO