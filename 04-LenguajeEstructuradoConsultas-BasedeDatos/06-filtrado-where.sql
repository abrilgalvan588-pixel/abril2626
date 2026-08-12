/*==============================================================

Tema : Filtrado de datos con WHERE
Archivo : 06-filtrado-where.sql
Descripcion: En este temas se filtraran registros mediante, condiciones,
comparaciones, operadores logicos de busqueda por patrones.


================================================================*/

-- Seleccionar columans y filtrar columans 

SELECT 
	codigo,
	nombre,
	precio
FROM productos;

-- Mostrar los productos con un precio  mayor a  40
SELECT 
	codigo,
	nombre,
	precio
FROM productos
WHERE precio > 400;

-- Mostrar el producto cuyo precio es exactamente 200
SELECT 
	p.codigo AS [codigo],
	p.nombre,
	p.precio
FROM productos AS p
WHERE precio = 200;

-- Seleccionar  los datos de los clientes 25
SELECT 
	c.id_cliente ,
	c.nombre,
	c.apellido_paterno,
	c. correo
FROM clientes AS c
WHERE c.id_cliente=25; 

-- Comparacion de cadenas de texto 
-- Los valores de texto deben escribirse entre comillas 
-- Simples 

-- Seleccionar todas las categorias donde 
-- El nombre sea COMPUTO

SELECT 
	c.id_categoria,
	c.nombre
FROM categorias AS c
WHERE c.nombre='Cómputo';

-- Mostrar los datos de los empleados que no pertenescan al 
-- departamento 1 (NUMERO DE EMPLEADO,NOMBRE DE EMPLEADO,SALARIO Y NUMERO DE DEPARTAMENTO

SELECT 
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE id_departamento>1;

-- Seleccionar los productos cuyo precio sea superior a 450,
-- codigo, nombre, precio, existencia, utilizar alias de columnas
-- y tablas 

SELECT 
p.codigo AS [codigo],
p.nombre AS [Nombre Producto],
p.precio,
p.existencia
FROM productos AS p
WHERE precio>=450;


SELECT 
p.codigo AS [codigo],
p.nombre AS [Nombre Producto],
p.precio,
p.existencia
FROM productos AS p
WHERE precio<=450;


SELECT 
p.codigo AS [codigo],
p.nombre AS [Nombre Producto],
p.precio,
p.existencia
FROM productos AS p
WHERE precio<>450;

-- FILTRAR FECHAS 
-- Las fechas deben escribirse en comillas simples 
-- se recomienda utilizar el formato AAA-MM-DD

-- Seleccionar todas las ventas realizadas el 24 de diciembre del 2024
-- Mostrar el numero de venta, la fecha de venta, el cliente al que se vendio 
-- El empleado que lo vendio 

SELECT
v.id_venta AS [Numero de venta],
v.fecha AS [Fecha ventas],
v.id_cliente AS [Cliente],
v.id_empleado AS [Empleado]
FROM ventas AS v
WHERE fecha = '2025-12-24';

SELECT
v.id_venta AS [Numero de venta],
v.fecha AS [Fecha ventas],
v.id_cliente AS [Cliente],
v.id_empleado AS [Empleado]
FROM ventas AS v
INNER JOIN 
clientes AS c
ON v.id_cliente=c.id_cliente
INNER JOIN 
empleados AS e
ON v.id_empleado=c.id_cliente
WHERE v.fecha = '2025-12-24';

-- Seleccionar todas las ventans anteriores al 1 de febrero de 2025
SELECT
	v.id_venta AS numero_venta,
	v.fecha AS  [fecha de venta], -- SE PUEDE PONER EL ALIAS ASI CON CORCHETES Y CON ESAPACIOS PERO NO ES MUY RECOMENDABLE POR QUE CONFUNDE MUCHO 
	v.id_cliente cliente 

FROM ventas AS v 
WHERE v.fecha <'2025-02-01';-- se pone > por que son las anteriares al 2025

-- Seleccionar todas las ventas desde el 1 de octube 2025 
-- en adelante 

SELECT
	v.id_venta AS numero_venta,
	v.fecha AS  [fecha de venta],
	v.id_cliente cliente 

FROM ventas AS v 
WHERE v.fecha >='2025-10-01';

-- COMPARECIONES CON EXPRECIONES CALCULADAS

-- Seleccionar los productos cuyo valor de inventario sea mayor 
-- a 50000

-- valor_inventario = precio*existencia 

-- Nota : AQL Server no reconoce el valor del alias dentro del 
-- WHERE en el mismo vivel de consulta, esto ocurre por el orden 
-- logico en que SQL Server procesa las partes de una consulta 

-- Orden de ejecución 
/*=====================================================================================================

FROM/JOIN
WHERE 
GROUP BY
HAVING
SELECT 
DISTINCT 
ORDER BY 
TOP 

=====================================================================================================*/


-- Orden de ESCRITURA
/*=====================================================================================================

SELECT/ TOP 
FROM / JOIN
WHERE
GROUP BY 
HAVING
ORDER BY 

=====================================================================================================*/

SELECT 
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia,
 (precio * existencia) AS valor_inventario 

FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY valor_inventario DESC;

SELECT 
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia,
 (precio * existencia) AS valor_inventario 

FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY (precio * existencia) DESC;

SELECT 
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia,
 (precio * existencia) AS valor_inventario 

FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY 5 DESC;

SELECT 
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia,
 (precio * existencia) AS valor_inventario 

FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY (precio * existencia) DESC;

/* Consulta con operadores logicos (NOT, AND, OR) */
-- Operador logico AND

/*
	condicion 1 | condicion 2 | Resultado
	TRUE			TRUE		TRUE
	TRUE			FALSE		FALSE
	FALSE			TRUE		FALSE
	FALSE			FALSE		FALSE
*/

-- Mostrar los productos con precio entre $200 y $300 que ademas 
-- tengan menos menos de 50 unidades

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE precio>=200
	  AND precio<=300
	  AND existencia < 50.0;
		GO
-- Seleccionar los empelaedos del departamento 1
-- cuyo salario sea superior a $25.0

SELECT 
e.nombre,
e.id_departamento,
e.salario
FROM empleados AS e
WHERE e.salario>25.0 AND e.id_departamento=1;


SELECT 
	e.id_empleado,
	CONCAT (e.nombre, ' ',
	e.apellido_paterno, '',
	e.apellido_materno) AS [nombre_completo],
	e.id_departamento AS departamento,
	e.salario
FROM empleados AS e
WHERE e.id_departamento = 1
AND e.salario > 25.0;

-- Operador logico OR 

/*=====================================================

OR requiere que al menos  una condicion sea verdadera

condicion 1 | condicion 2 | Resultado
	TRUE			TRUE		TRUE
	TRUE			FALSE		TRUE
	FALSE			TRUE		TRUE
	FALSE			FALSE		FALSE


======================================================*/

-- Seleccionar los productos con existencia inferior a 10 o superior 
-- a 190

SELECT TOP 15
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.existencia <10
	  OR p.precio >190
	  ORDER BY nombre DESC;

-- Operador logico NOT 
/*=====================================================

NOT niega una condicion

condicion 1 | Resultado
	
	TRUE		FALSE
	FALSE		TRUE


======================================================*/

-- Seleccionar los productos que no sean mayor a 400

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE NOT p.precio > 400;


SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE NOT p.precio <= 400
ORDER BY p.precio DESC;

-- Mostrar los productos que no se encuentran dentro el rango 
-- de $100 a $400
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE
	NOT (precio>=100 AND precio<=400);




-- Mostrar los empleados de los departamentos 1 o 2 que tengan 
-- Salario mayor a $25.000


SELECT 
	e.id_empleado,
	CONCAT (e.nombre, ' ',
	e.apellido_paterno, '',
	e.apellido_materno) AS [nombre_completo],
	e.id_departamento AS departamento,
	e.salario
FROM empleados AS e
WHERE 
		(e.id_departamento = 1
		OR e.id_departamento = 2)
		AND e.salario>25000


-- TODO:Instrucciones BETWEEN E IN, LIKE. COMPARACIONES CON NOT NULL

-- OPERADOR BETWEEN:
-- Permite comprobar si un valor se encuentra dentro de un rango inclusivo

-- Sintaxis
-- WHERE columna BETWEEN limite_inferior AND LIMITE_SUPERIOR;
-- EJEMPLO: MOSTRAR EMPREADOS CON SALARIO ENTRE $15000 Y $20000

SELECT 
e.id_empleado,
e.nombre,
e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000 AND 20000;


SELECT 
e.id_empleado,
e.nombre,
e.salario
FROM empleados AS e
WHERE e.salario >= 15000
AND e.salario<=20000;


-- Seleccionar las ventas del primero de enero del 2025 al 
-- 10 de enero de 2025

SELECT 
  v.id_venta,
  v.fecha,
  FORMAT(v.fecha,'MM') AS [Mes en Digito],
  FORMAT(v.fecha,'MMMM')AS [Nombre Mes en Ingles],
  FORMAT(v.fecha,'dd')AS [Día en Digito),
  FORMAT (v.fecha,'dddd')AS[Nombre del Día En Ingles],
  UPPER (FORMAT (v.fecha,'MMMM','es-ES')) AS [Nombre del Mes Español],
  UPPER (FORMAT(v.fecha,'dddd','es-ES')) AS [Nombre del Día añol],
  DATEPART (MONTH,v.fecha)AS [Mes del año],
 v.id_cliente

  FROM ventas as v
  WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10';

-- SELECCIONAR LOS PRODUCTOS QUE NO SE ENCUENTRAN EN EL RANGO DE PRECIOS 
-- DE $100 A $400

SELECT 
p.id_producto,
p.nombre,
p.precio

FROM productos AS p
 WHERE precio NOT BETWEEN 100 AND 400;

 -- OPERADORN INT 
 -- Permite comprobar con una columna con una lista de valores
 -- Sintaxis: WHERE columna IN (valor_1, valor_2, valor_n);
 -- Equivalee a varias condiciones OR conectadas 

 -- Mostrar los productos pertenecientes a las categorias 1,7,12

 SELECT 
 P.id_producto,
 p.nombre,
 p.precio,
 p.id_categoria
 FROM productos AS p
 WHERE p.id_categoria=1
 OR 
 p.id_categoria=7
 OR
 p.id_categoria=12;

 SELECT 
 p.id_producto,
 p.nombre,
 p.precio,p.id_categoria
 FROM productos AS p
 WHERE p.id_categoria IN (1,7,12);

-- Selecciona los datos de los clientes 1, 10, 25, 50, 100

SELECT 
c.id_cliente,
c.nombre, 
c.correo
FROM clientes AS c
WHERE id_cliente IN (1, 10, 25, 50, 100);

-- Seleecionar los datos de los departaemntos de Ventas TI o Dirección
SELECT 
d.id_departamento AS numero,
d.nombre AS nombre_departamento

FROM departamentos AS d
WHERE d.nombre IN ('Ventas', 'TI','Dirección');

-- Seleccionar todos los departamentos que no correspondan al departamento 1 o 2
-- NOT IN 
SELECT 
d.id_departamento AS numero,
d.nombre AS nombre_departamento

FROM departamentos AS d
WHERE d.id_departamento NOT IN (1 , 2);

SELECT 
d.id_departamento AS numero,
d.nombre AS nombre_departamento

FROM departamentos AS d
WHERE 
	NOT (d.id_departamento= 1
	OR
	d.id_departamento= 2);

-- PRECAUCIÓN CON NOT IN Y NULL.
-- Cuando una columna contiene NULL, una comparacion con NOT IN puede comportarse
-- de manera diferente a lo esperado 

-- SELECCIONAR TODOS LOS EMPLEDOS QUE NO TENGAN JEFE 

SELECT 
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe
FROM empleados  AS e
WHERE id_jefe IS NOT NULL;

SELECT 
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe
FROM empleados  AS e
WHERE e.id_jefe NOT IN (1,2,3)
OR e.id_jefe IS NULL;


SELECT 
e.id_empleado,
e.nombre,
e.salario,
e.id_jefe
FROM empleados AS e
WHERE NOT (e.id_jefe = 1
		OR e.id_jefe = 2
		OR e.id_jefe = 3)
		OR e.id_jefe IS NOT NULL;

SELECT 
e.id_empleado,
e.nombre,
e.salario,
e.id_jefe
FROM empleados AS e
WHERE NOT ( e.id_jefe = 1
OR
	e.id_jefe IS NOT NULL)
	

	SELECT 
e.id_empleado,
e.nombre,
e.salario,
e.id_jefe
FROM empleados AS e
WHERE 
		e.id_jefe IS NOT NULL
		OR 
		e.id_jefe = 4;

-- Cundo se utilizan NULOS no hacer consultas tan complejas 

-- OPERADOR LIKE 
-- permite buscar patrones dentro de valores de texto 

-- SINTAXIS 
-- WHERE columna LIKE 'patron'
-- Los patrones son:
-- comodin    significado
--   %		  cero, uno o varios caracteres 		
--	 -		  exactamente un caracter
-- [abc]	  Un carcater incluido en las listas
-- [a-f]	  Un carcater incluido en el rango
-- [^abc]     Un carcater no incluido en la lista

-- Seleccionar los datos de los productos donde el codigo comience con 
--
-- P001

SELECT
* 
FROM productos 
WHERE codigo LIKE 'P001%';