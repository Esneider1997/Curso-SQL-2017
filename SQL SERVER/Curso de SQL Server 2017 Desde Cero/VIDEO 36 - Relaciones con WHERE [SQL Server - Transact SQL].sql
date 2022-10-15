/*Curso de SQL Server 2017 Desde Cero 

36 - Relaciones con WHERE [SQL Server - Transact SQL]*/

-- WHERE
-- JOIN (INNER JOIN)
-- LEFT JOIN ( LEFT OUTHER JOIN )
-- RIGHT JOIN
-- FULL OUTHER JOIN

/* El resultado se conoce como un producto escalar (No tiene ninguna relacion, ningun filtro) */
SELECT Orders.OrderID, Orders.CustomerID, Customers.CompanyName, Products.ProductName,
		[Order Details].Quantity, [Order Details].UnitPrice
FROM Orders, [Order Details], Products, Customers
-- Nota: Si hacemos esto nos mostrara un producto escalas, ¿Porque razon? Porque multiplica la cantidad de registrosn que estan en ordenes
-- multiplicando la cantidad de registros que estan en ordenes detalles, multiplicando la cantidad de registros de la tabla productos
-- multiplicando la cantidad de registros que estan en clientes. 

SELECT Orders.OrderID, Orders.CustomerID, Customers.CompanyName, Products.ProductName,
		[Order Details].Quantity, [Order Details].UnitPrice
FROM Orders, [Order Details], Products, Customers
WHERE
Orders.OrderID = [Order Details].OrderID  AND
[Order Details].ProductID = Products.ProductID AND
Orders.CustomerID = Customers.CustomerID

/* Arroja el mismo resultado de alla arrriba */
SELECT * FROM [Order Details]