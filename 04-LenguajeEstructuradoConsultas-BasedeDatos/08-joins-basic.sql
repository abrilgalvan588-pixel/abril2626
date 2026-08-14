/*===========================================================================
INNER JOIN 
¿Que es un join?
un join perite combinar inoformacion de dos o mas tablas, utilizando una relacion  una relacion entre ellas
===============================================================================*/

USE NORTHWND;
GO

SELECT
	ProductID AS [numero_producto],
	ProductName AS [nombre_producto],
	UnitPrice AS[precio],
	UnitsInStock AS[existencia],
	(p.UnitPrice * P.UnitsInStock)AS [valor_inventario],
	C.CategoryID AS[numero_categoria],
	c.CategoryName AS[nombre_categoria],
	s.CompanyName AS [nombre_proveedor]
FROM Products AS P
INNER JOIN
Categories AS C
ON C.CategoryID= P.CategoryID
INNER JOIN Suppliers AS s
ON s.SupplierID= p.SupplierID
WHERE p.UnitsInStock <>0
AND 
c.CategoryName IN ('Seafood','Confections','Beverages')
AND 
p.ProductName LIKE 'C%'
ORDER BY [valor_inventario] ASC;

-- Seleccionar los datos de los clientes que han echo pedidos (orders),
-- mostrando el numero de clinete, el nombre del cliente (companyName),
-- numero de orden y la fecha de orden 
SELECT 
	o.OrderID AS [numero_orden],
	o.OrderDate AS [fecha_orden],
	UPPER (FORMAT(o.OrderDate,'MMMM', 'es-ES')) as [mes_orden],
	UPPER(FORMAT(o.OrderDate,'dddd', 'es-ES')) as [dia_orden],
	DATEPART (YEAR, o.OrderDate) AS [año_orden],
	o.CustomerID AS [numero_cliente],
	UPPER (c.CompanyName) AS [nombre_cliente]
	FROM Orders AS o
	INNER JOIN Customers AS c
	ON c.CustomerID =c.CustomerID;

 -- Seleccionar ademas de el cliente al que se le vendieron los productos 
 -- queremos saber el nombre del empleado en formato  fullnam que atendio
 -- el pedido 
SELECT
		o.OrderID AS [numero_orden],
		o.OrderDate AS [fecha_order],
		UPPER(FORMAT(o.OrderDate,'MMMM','es-ES')) AS [mes_orden],
		UPPER(FORMAT(o.OrderDate,'dddd','es-ES')) AS [dia_orden],
		DATEPART(YEAR, o.OrderDate) AS [año_orden],
		o.CustomerID AS [numero_cliente],
		UPPER (c.CompanyName) AS [nombre_cliente],
		CONCAT (e.FirstName,'',e.LastName) AS [Nombre Completo]
	FROM Orders AS o
	INNER JOIN
	Customers AS c
	ON c.CustomerID = c.CustomerID
	INNER JOIN Employees AS e
	ON o.EmployeeID= e.EmployeeID;

