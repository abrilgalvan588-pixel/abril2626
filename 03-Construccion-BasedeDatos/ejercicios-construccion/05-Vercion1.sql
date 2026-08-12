CREATE DATABASE version1;

USE version1;

CREATE TABLE Department (
    Number INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Startdate DATE,
    CONSTRAINT pk_Department PRIMARY KEY (Number)
);
GO
 

CREATE TABLE Employee (
    Ssn CHAR(11) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Bdate DATE,
    Addres VARCHAR(150),
    Salary DECIMAL(10,2) NOT NULL,
    Sex CHAR(1),
    SupervisorSsn CHAR(11) NULL,
    DepartmentNumber INT NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (Ssn),
    CONSTRAINT fk_Employee_Supervisor FOREIGN KEY (SupervisorSsn)
        REFERENCES Employee (Ssn),
    CONSTRAINT fk_Employee_Department FOREIGN KEY (DepartmentNumber)
        REFERENCES Department (Number)
);
GO
 

ALTER TABLE Department
ADD ManagerSsn CHAR(11) NULL;
GO
 
ALTER TABLE Department
ADD CONSTRAINT uq_Department_Manager UNIQUE (ManagerSsn);
GO
 
ALTER TABLE Department
ADD CONSTRAINT fk_Department_Manager
FOREIGN KEY (ManagerSsn) REFERENCES Employee (Ssn);
GO
 

CREATE TABLE Locations (
    DepartmentNumber INT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    CONSTRAINT pk_Locations PRIMARY KEY (DepartmentNumber, Location),
    CONSTRAINT fk_Locations_Department FOREIGN KEY (DepartmentNumber)
        REFERENCES Department (Number)
);
GO

CREATE TABLE Project (
    Number INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    DepartmentNumber INT NOT NULL,
    CONSTRAINT pk_Project PRIMARY KEY (Number),
    CONSTRAINT fk_Project_Department FOREIGN KEY (DepartmentNumber)
        REFERENCES Department (Number)
);
GO
 

CREATE TABLE WorksOn (
    Ssn CHAR(11) NOT NULL,
    ProjectNumber INT NOT NULL,
    Hours DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_WorksOn PRIMARY KEY (Ssn, ProjectNumber),
    CONSTRAINT fk_WorksOn_Employee FOREIGN KEY (Ssn)
        REFERENCES Employee (Ssn),
    CONSTRAINT fk_WorksOn_Project FOREIGN KEY (ProjectNumber)
        REFERENCES Project (Number)
);
GO
 

CREATE TABLE Dependent (
    NumDependent INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Sex CHAR(1),
    Birthday DATE,
    Relationship VARCHAR(30),
    EmployeeSsn CHAR(11) NOT NULL,
    CONSTRAINT pk_Dependent PRIMARY KEY (NumDependent),
    CONSTRAINT fk_Dependent_Employee FOREIGN KEY (EmployeeSsn)
        REFERENCES Employee (Ssn)
);
GO
 