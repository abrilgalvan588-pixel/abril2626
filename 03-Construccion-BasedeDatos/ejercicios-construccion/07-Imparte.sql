CREATE DATABASE imparte;

USE imparte;

CREATE TABLE Alumno (
    Matricula INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoP VARCHAR(50) NOT NULL,
    ApellidoM VARCHAR(50),
    Correo VARCHAR(100),
    Telefono VARCHAR(20),
    CONSTRAINT pk_Alumno PRIMARY KEY (Matricula)
);
GO
 

CREATE TABLE Credencial (
    NumCredencial INT IDENTITY(1,1) NOT NULL,
    Vigencia DATE NOT NULL,
    FechaExpedicion DATE NOT NULL,
    Matricula INT NOT NULL,
    CONSTRAINT pk_Credencial PRIMARY KEY (NumCredencial),
    CONSTRAINT uq_Credencial_Matricula UNIQUE (Matricula), 
    CONSTRAINT fk_Credencial_Alumno FOREIGN KEY (Matricula)
        REFERENCES Alumno (Matricula)
);
GO
 
CREATE TABLE Departamento (
    CodDepartamento INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    NombreJefe VARCHAR(100),
    CONSTRAINT pk_Departamento PRIMARY KEY (CodDepartamento)
);
GO
 

CREATE TABLE Profesor (
    NumProf INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoP VARCHAR(50) NOT NULL,
    ApellidoM VARCHAR(50),
    Correo VARCHAR(100),
    Telefono VARCHAR(20),
    CodDepartamento INT NOT NULL,
    CONSTRAINT pk_Profesor PRIMARY KEY (NumProf),
    CONSTRAINT fk_Profesor_Departamento FOREIGN KEY (CodDepartamento)
        REFERENCES Departamento (CodDepartamento)
);
GO
 

CREATE TABLE Materia (
    ClaveMateria INT IDENTITY(1,1) NOT NULL,
    NombreMateria VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    NumProf INT NOT NULL,
    CONSTRAINT pk_Materia PRIMARY KEY (ClaveMateria),
    CONSTRAINT fk_Materia_Profesor FOREIGN KEY (NumProf)
        REFERENCES Profesor (NumProf)
);
GO
 

CREATE TABLE Cursa (
    Matricula INT NOT NULL,
    ClaveMateria INT NOT NULL,
    FechaInscripcion DATE NOT NULL,
    CalificacionFinal DECIMAL(4,2),
    CONSTRAINT pk_Cursa PRIMARY KEY (Matricula, ClaveMateria),
    CONSTRAINT fk_Cursa_Alumno FOREIGN KEY (Matricula)
        REFERENCES Alumno (Matricula),
    CONSTRAINT fk_Cursa_Materia FOREIGN KEY (ClaveMateria)
        REFERENCES Materia (ClaveMateria)
);
GO
 

CREATE TABLE Dependiente (
    NumDependiente INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Parentesco VARCHAR(30),
    NumProf INT NOT NULL,
    CONSTRAINT pk_Dependiente PRIMARY KEY (NumDependiente),
    CONSTRAINT fk_Dependiente_Profesor FOREIGN KEY (NumProf)
        REFERENCES Profesor (NumProf)
);
GO
 
CREATE TABLE Proyecto (
    CodProyecto INT IDENTITY(1,1) NOT NULL,
    NombreProyecto VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(12,2),
    CONSTRAINT pk_Proyecto PRIMARY KEY (CodProyecto)
);
GO
 

CREATE TABLE Participa (
    NumProf INT NOT NULL,
    CodProyecto INT NOT NULL,
    CONSTRAINT pk_Participa PRIMARY KEY (NumProf, CodProyecto),
    CONSTRAINT fk_Participa_Profesor FOREIGN KEY (NumProf)
        REFERENCES Profesor (NumProf),
    CONSTRAINT fk_Participa_Proyecto FOREIGN KEY (CodProyecto)
        REFERENCES Proyecto (CodProyecto)
);
GO
 