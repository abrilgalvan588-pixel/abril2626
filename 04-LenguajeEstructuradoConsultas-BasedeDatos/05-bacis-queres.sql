/*==================================== 

Tema: Consultar Basicas con Select

Archivo: es-basic-queries-sql

Descripcion : Desarrollar la Capacidad para construir basicas mediante

======================================*/
USE comercial_db;
GO

/*==================================== 

Uso del SELECT *
Sintaxis :
SELECT *
FROM nombre_tabla;

Nota : EL * se sinignifica las columnas de una tabla (No es tan rrecomendable su uso)

Porque no se recomienda utilizar siempre
1. Recupera informacion innecesaria
2. Reduce la claridad de la consulta
3. puede aumentar el consumo de recursos

======================================*/

-- Selecciona todos los registros y campos de la tabla productos
SELECT *
FROM productos;

-- Proyeccion
SELECT 
	codigo,
	nombre,
	precio
FROM productos;

GO
-- Alias de columna
-- Un alias de columna es un nombre temporal asignado a una columna
-- Dentro del resultado de una columna

SELECT 
	codigo,
	nombre,
	precio
FROM productos;

SELECT 
	codigo AS codigo_productos,
	nombre AS nombre_productos,
	precio AS precio_productos
FROM productos;
GO

SELECT 
	codigo AS [codigo_productos],
	nombre AS [nombre_productos],
	precio AS [precio_productos]
FROM productos;
GO

SELECT 
	codigo AS 'codigo_productos',
	nombre AS 'nombre_productos',
	precio AS 'precio_productos'
FROM productos;
GO

SELECT 
	codigo AS [codigo_productos],
	TRIM (UPPER (nombre)) AS 'nombre_productos',
	precio AS precio_productos
FROM productos;
GO

-- ALIAS DE TABLA
-- Tambien se puede asignar un alias temporal a  una tabla

-- Sintaxis
/*
	SELECT alias_tabla.columna
	FROM nombre_tabla_AS_alias_tabla;
*/

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;

SELECT 
	P.codigo,
	P.nombre,
	P.precio
FROM productos AS P;

SELECT *FROM categorias;
SELECT *FROM productos;

SELECT 
	C.id_categoria AS[#categoria],
	C.nombre AS[nombre categoria], 
	P.id_producto AS [# Productos],
	P.nombre AS[nombre productos],
	P.precio,
	P.existencia
FROM categorias AS C
INNER JOIN productos AS P
ON C.id_categoria = P.id_categoria;
GO

-- Campos calculados - columnas calculadas
-- Una columna calculada es el resultado de una expresion incluida en la 
-- Lista de seleccion
-- No existe fisicamente en la tabla
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.existencia * p.precio AS valor_iventario
FROM productos AS p;

-- Seleccionar el nombre, apellido paterno , salario y simular
-- como quedaria el salario de cada empleado si recibir un 
-- aumento fijo de $1000, el campo se debe llamar salario_simulado

SELECT 
    nombre, 
    apellido_paterno, 
    salario, 
    (salario + 1000) AS salario_simulado
FROM 
    empleados;
GO

SELECT
	e.nombre,
	e.apellido_paterno,
	CONCAT (e.nombre, '', e.apellido_paterno,'',e.apellido_materno) 
	AS nombre_completo,
	YEAR (e.fecha_ingreso) AS año_ingreso,
	MONTH (e.fecha_ingreso) AS mes_ingreso,
	DAY (e.fecha_ingreso) AS dia_ingreso,
	e.fecha_ingreso,
	e.salario,
	(e.salario + 1000) AS salario_simulado

FROM empleados AS e;
GO

-- Mostrar de una venta cual es su numero, cantidad venta, precio,
-- descuento, importe_bruto (cantidad por el precio) y ademas el 
-- Importe_descuento (importe_bruto por el descuento dividido entre 100)

SELECT 
    dv.id_detalle_venta,
    dv.cantidad,
    dv.precio,
    dv.descuento,
	dv.cantidad * dv.precio AS importe_bruto,
    (dv.cantidad * dv.precio * dv.descuento / 100.0) AS importe_descuento
FROM detalle_ventas as dv;

/*=======================================================================
-- Operadores aritmeticos en sql server
+ SUMA
- RESTA
* MULTIPLICACION
/ DIVICISION
% MODULO - RESIDUO DE DIVISION
=========================================================================*/

-- Uso de la clasula DISTRINCT

-- Elimina del resultado las filas que tenga valores repetidos en todas
-- las columnas seleccionadas

SELECT c.sexo
FROM clientes AS C;


SELECT COUNT (c.sexo) AS cantidad_sexo
FROM clientes AS C;


SELECT  COUNT (DISTINCT sexo) AS numero_sexos
FROM clientes AS c;

SELECT COUNT (sexo) AS [mujeres]
FROM clientes
WHERE sexo = 'M';

-- seleccionar los distintos descuentos que se realizan alas ventas
SELECT descuento
FROM detalle_ventas
ORDER BY descuento DESC;

SELECT DISTINCT descuento
FROM detalle_ventas
ORDER BY descuento DESC;

-- DISTINCT CON MAS DE UN CAMPO 
-- Cuando el DISTINCT se utiliza con varias columnas, se evalua la 
--combinacion 
-- EL DISTINC APLICA LOS CAMBIOS A TODOS LOA CAMPOS SE LE APLICA A LOS CONJUNTOS DE LOS CAMPOS 
SELECT
	id_categoria,
	id_producto
FROM productos
ORDER BY id_categoria DESC,id_producto DESC;
GO

SELECT
	id_cliente,
	id_empleado
FROM ventas
ORDER BY 1 DESC, 2 DESC;
GO

SELECT DISTINCT
	id_categoria,
	id_producto
FROM productos
ORDER BY id_categoria DESC,id_producto DESC;
GO

-- USO DE TOD 
--LIMITA LA CANTIDAD DE FILAS DEVUELTAS POR UNA CONSULTA

SELECT TOP (5)
	id_producto,
	codigo,
	nombre,
	precio
FROM productos
ORDER BY precio DESC;

SELECT TOP (10)
	nombre
FROM clientes;

--TOP con expreciones calculadas 
SELECT 
	codigo,
	nombre,
	precio,
	existencia,
	(precio * existencia) AS valor_inventraio
FROM productos;

SELECT TOP (5)
	codigo,
	nombre,
	precio,
	existencia,
	(precio * existencia) AS valor_inventraio
FROM productos;

-- TOP con porcentaje 
-- SQL SERVER PERMITE LIMITAR EL RESULTADO MEDIANTE UN PORSENTAJE 

SELECT TOP (10) PERCENT
	codigo,
	nombre,
	precio,
	existencia,
	(precio * existencia) AS valor_inventraio
FROM productos;

-- COMBINAR DISTINCT CON EL TOP 
SELECT 
	descuento
FROM detalle_ventas;

SELECT TOP (3)
	descuento
FROM detalle_ventas;