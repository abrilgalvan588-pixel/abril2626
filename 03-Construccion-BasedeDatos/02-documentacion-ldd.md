# Construccion de BD en SQL Server, Mysql o MariaDB y Posgres

Para la construccion de la base de datos se utiliza un lenguaje SQL (Structured Languaje) se divide en **cinco grandes categorias**

## SQL
-DDL (Date Definition Languaje)
-DML (Date Manipulation Languaje)
- DQL (Data Query Languaje)
- DCL (Data Control Languaje)
- TCL (Transaction Control Languaje)

### DDL
Lenguaje de Definicion de Datos 
Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos sobre los objetos de la base de datos:
- Base de Datos 
- Tablas
- Vistas 
- Restricciones 
- Esquemas
- Procedimientos Almacenados 
- Funciones
- Disaparadores
## Comandos Principales 
| Comando  |  Función|
| :--- | :--- |
|Create | Crear Objetos |
| Alter | Modificar Objetos
| Drop | Eliminar Objetos |
| Truncate | Vacia una tabla|
| Rename | Renombra objetos (Segun el SGBD) |

### SQL - DML
Sirve para **trabajar con la infromacion almacenada**

Nota: Aquí no cambia la estructura sino los registros


**Comandos Principales**

| Comando  |  Función|
| :--- | :--- |
|INSERT| Inserta Registros |
| UPDATE | Actualiza Registros|
| DELETE| Elimina REgistros |

### SQL - DQL

**Lenguaje de consulta **
Su funcion es **Consultar Infromacion**

| Comando  |  Función|
| :--- | :--- |
|SELECT| Consultar Informacion |

Generalmente se convina con 
- WHERE
- ORDER SY
- GRUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS, FULL)
- DISTINCT
- FUNCIONES DE AGREGADO 
- FUNCIONES DE VENTANA

## Nomeclatura de Construccion 
Utilizaremos la convencion de **snake_case**
| Objeto  |  Convencion | Ejemplo |
| :--- | :--- |:--- |
|Base de datos| Snake_case |control_escolar |
|Esquema| Snake_case |ventas, rh, seguridad |
|Tabla| Singular en Snake_case |cliente, pedido, detalle_pedido |
|Columna| Snake_case |cliente_id, fecha_registro, correo_electronico |
|PK| <tabla>_id |cliente_id, producto_id |
|FK| igual que la PK referenciada|cliente_id, producto_id |
|Tabla puente| <tabla >_ <tabla> |alumno_curso, producto_provedor |

**Restricciones**
pk_cliente
fk_pedido_cliente
uq_cliente_correo_electronico
ck_producto_precio
df_cliente_activo

## DDL en SQL Server ALTER Y DROP para la creacion y modificasion de tabalas
**Sintaxis de la creacion de tablas**

```sql
CREATE TABLE nombre_tabal
(
columna tipo_dato restricciones,
columna tipo_dato restricciones,
)
```


## SQL SERVER 

```   sql
    CREATE
    ALTER
    DROP
  
```
