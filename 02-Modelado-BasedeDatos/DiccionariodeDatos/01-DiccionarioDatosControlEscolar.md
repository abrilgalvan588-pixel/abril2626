## Diccionario de la base de datos de control escolar 

## 1.1 Informacion general

1. Identificasion General 

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Version | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Abril Perez Galvan |

2. Descripcion de la Bace de Datos

La Bace de Datos Administra:

- Carrera 
- Alumnos
- Profesor
- Materia
- Grupo 
- Inscripcion

Permite controlar la oferta academica la inscripcio de estudiantes 

3. Catalogo de Restricciones utilizadas 

| Catalogo | Significado |
| :--- | :--- |
| PK | Primary key|
| FK | Foreinfg Key |
| NW | Not NUll |
| UQ | Unique |
|AI | Autoincrement o Identify |
| CK | Chek |
| DF | Defaul |

4. Diccionario de Dato

**Tabla** _Carrera_

**Descripcion** 
Almacena las carreras Ofertadas por la universidad

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_carrera | INT | - | PK,AI,NM | Identificador unico de la carrera|
| nombre | Varchar | 100 | UQ,NM | Nombre de la carrera  |
| duracion_cuatrimestre | INT | 0 | NM,PK(>0) | Duracion en Cuatrimestre |

----


**Tabla** _Alumno_

**Descripcion** 
Almacena la informacion de los estudiantes

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno| INT | - | PK,AI,NM | Identificador unico del alumno|
| matricula | VARCHAR | 10 | UQ,NM | Matricula Institucional  |
| apellido_paterno | VARCHAR | 50 | NN | Apellido Paterno |
| apellido_materno | VARCHAR | 50 | NN | Apellido Materno |
| correo | INT | 100 | UQ,NULL | Correo Institucional |
| fecha_nacimiento | INT | - | NN | Fecha Nacimiento |
| id_Carrera | INT | - | FK,NM |carrera a la que pertensece |

----
TODO: Documentar las siguientes tablas 


5. Relaciones en la Bace de Datos


| Relacion | Cardinalidad | Descripcion | 
| :--- | :--- | :--- | 
| Carrera-> Alumno | 1:N | Una Carrera tiene muchos Alumno | 
| Carrera-> Materia | 1:N | Una carrera tiene mucas materias | 
| Profesor-> Grupo | 1:N | Un profesor puede impartir en varios Grupos | 
| Materia-> Grupo  | 1:N | Una materia puede abrirse en varios grupos | 
|Alumno-> Inscripcion | 1:N | Un grupo puede tener varias Inscripciones | 
|Grupo -> Inscripcion | 1:N | Un grupo puede tener muchos alumnos | 

6. Matriz de claves foraneas 

| Tabla | Campo FK | Referencias  | 
| :--- | :--- | :--- | 
| Alumno | id_carrera | Carrera (id_carrera) | 
| Materia | id_carrera | Carrera (id_carrera) | 
| Grupo | id_profesor | Profesor (id_profesor) | 
| Grupo | id_materia | Materia (id_materia) |
| Inscripcion | id_alumno | Alumno (id_alumno) |
| Inscripcion | id_grupo | Grupo (id_grupo) |


7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo par aun profesor inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |

8. Reglas del negosio 

| Clave | Regla |
| :--- | :--- |
| RN -01 | Un alumno pertenece a una sola carrera  |
| RN-02 | Una carrera puede tener muchas alumno |
| RN-03 | Una carrera puede tener muchas materias |
| RN-04 | Un profesor puede impartir varios cursos |

9. Diagrama Relacional

