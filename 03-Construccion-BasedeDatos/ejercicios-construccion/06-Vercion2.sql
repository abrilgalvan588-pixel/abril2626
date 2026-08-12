CREATE DATABASE version2;

USE version2;


CREATE TABLE Department (
    Number INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Startdate DATE,
    CONSTRAINT pk_Department PRIMARY KEY (Number)
);
GO
 

CREATE TABLE Employee (
    NumEmployee INT IDENTITY(1,1) NOT NULL,
    Ssn CHAR(11) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Bdate DATE,
    Addres VARCHAR(150),
    Salary DECIMAL(10,2) NOT NULL,
    Sex CHAR(1),
    SupervisorId INT NULL,
    DepartmentNumber INT NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (NumEmployee),
    CONSTRAINT uq_Employee_Ssn UNIQUE (Ssn),
    CONSTRAINT fk_Employee_Supervisor FOREIGN KEY (SupervisorId)
        REFERENCES Employee (NumEmployee),
    CONSTRAINT fk_Employee_Department FOREIGN KEY (DepartmentNumber)
        REFERENCES Department (Number)
);
GO
 

ALTER TABLE Department
ADD ManagerId INT NULL;
GO
 
ALTER TABLE Department
ADD CONSTRAINT uq_Department_Manager UNIQUE (ManagerId);
GO
 
ALTER TABLE Department
ADD CONSTRAINT fk_Department_Manager
FOREIGN KEY (ManagerId) REFERENCES Employee (NumEmployee);
GO
 

CREATE TABLE Locations (
    NumLocation INT IDENTITY(1,1) NOT NULL,
    DepartmentNumber INT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    CONSTRAINT pk_Locations PRIMARY KEY (NumLocation),
    CONSTRAINT fk_Locations_Department FOREIGN KEY (DepartmentNumber)
        REFERENCES Department (Number)
);
GO
 

CREATE TABLE Project (
    NumberProject INT IDENTITY(1,1) NOT NULL,
    Location VARCHAR(100),
    DepartmentNumber INT NOT NULL,
    CONSTRAINT pk_Project PRIMARY KEY (NumberProject),
    CONSTRAINT fk_Project_Department FOREIGN KEY (DepartmentNumber)
        REFERENCES Department (Number)
);
GO
 

CREATE TABLE WorksOn (
    NumEmployee INT NOT NULL,
    NumberProject INT NOT NULL,
    Hours DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_WorksOn PRIMARY KEY (NumEmployee, NumberProject),
    CONSTRAINT fk_WorksOn_Employee FOREIGN KEY (NumEmployee)
        REFERENCES Employee (NumEmployee),
    CONSTRAINT fk_WorksOn_Project FOREIGN KEY (NumberProject)
        REFERENCES Project (NumberProject)
);
GO
 

CREATE TABLE Dependent (
    NumDependent INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Birthday DATE,
    Relationship VARCHAR(30),
    NumEmployee INT NOT NULL,
    CONSTRAINT pk_Dependent PRIMARY KEY (NumDependent),
    CONSTRAINT fk_Dependent_Employee FOREIGN KEY (NumEmployee)
        REFERENCES Employee (NumEmployee)
);
GO
 