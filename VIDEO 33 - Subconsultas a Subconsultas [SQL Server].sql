/*Curso de SQL Server 2017 Desde Cero 

33 - Subconsultas a Subconsultas [SQL Server]*/

/*SELECT *
FROM(
	select Products.ProductID, Products.ProductName, sum(Quantity) [Total Cantidad], sum([Order Details].UnitPrice) [Total Precio Unitario]
	from Products
	join [Order Details] on [Order Details].ProductID = Products.ProductID
	group by Products.ProductID, Products.ProductName
)  DetalleUno */
-- NOTA: Lo trata como una tabla

-- Maximo total precio unitario
/*SELECT MAX([Total Precio Unitario]) [Maximo precio unitario]
FROM(
	select Products.ProductID, Products.ProductName, sum(Quantity) [Total Cantidad], sum([Order Details].UnitPrice) [Total Precio Unitario]
	from Products
	join [Order Details] on [Order Details].ProductID = Products.ProductID
	group by Products.ProductID, Products.ProductName
)  DetalleUno */

-- verifica el de arriba pero solo con el primer registro
/*SELECT Products.ProductID, Products.ProductName, sum(Quantity) [Total Cantidad], sum([Order Details].UnitPrice) [Total Precio Unitario]
FROM Products
JOIN [Order Details] on [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductID, Products.ProductName ORDER BY [Total Precio Unitario] DESC */

/*SELECT Categories.CategoryName, ProductID, ProductName, [Total Cantidad]
FROM(
	select CategoryID, Products.ProductID, Products.ProductName, sum(Quantity) [Total Cantidad], sum([Order Details].UnitPrice) [Total Precio Unitario]
	from Products
	join [Order Details] on [Order Details].ProductID = Products.ProductID
	group by Products.ProductID, Products.ProductName, CategoryID
) DetalleUno
JOIN Categories ON Categories.CategoryID = DetalleUno.CategoryID*/

-- NOTA: Lo mejor es evitar subconsultas y utilizar funciones de agrupacion en algunos casos.

SELECT [Total Cantidad]
FROM
(
	SELECT Categories.CategoryName, ProductID, ProductName, [Total Cantidad]
	FROM(
		select CategoryID, Products.ProductID, Products.ProductName, sum(Quantity) [Total Cantidad], sum([Order Details].UnitPrice) [Total Precio Unitario]
		from Products
		join [Order Details] on [Order Details].ProductID = Products.ProductID
		group by Products.ProductID, Products.ProductName, CategoryID
	) DetalleUno
	JOIN Categories ON Categories.CategoryID = DetalleUno.CategoryID
) TablaDetalle2