-- Seleccionar la base de datos

USE NORTHWND;

--	Mostrar  los clientes de Mexico o de Alemania y ademas que sea Stuttgar
SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country = 'Mexico'
	  OR
	  (c.Country = 'Germany'
	  AND
	  c.City = 'Stuttgart');

SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country IN ('Mexico','Germany');


-- Mostrar las ventas realizadas en Francia,Brazil y Belgica
-- de 10 de julio de 1996 al 31 de Diciempre de 1998
-- Pero que tengan region de envio,
-- Para los clientes VICTE, HANAR y SUPRD y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua
SELECT
	o.OrderID AS [Numero_orden],
	o.CustomerID AS [clinte],
	o.ShipCountry AS [pais_enviado],
	o.OrderDate AS [fecha_pedido],
	UPPER (FORMAT (o.OrderDate, 'MMMM', 'es-ES')) AS [mes_pedido],
	UPPER (FORMAT (o.OrderDate, 'dddd', 'es-ES')) AS [dia_pedido],
	DATEPART (YEAR, o.OrderDate) AS [año_pedido]
FROM Orders AS o
WHERE o.ShipCountry IN ('France','Brazil','Belgium')
	AND 
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-31'
	AND o.ShipRegion IS NOT NULL 
	AND 
	o.CustomerID IN ('VICTE', 'HANAR ',' SUPRD')
ORDER BY o.OrderDate DESC;
