/*Curso de SQL Server 2017 Desde Cero 

VIDEO 28 - Cláusula TOP: Limitar Resultados de una Consulta [SQL Server - Transact SQL]]*/

-- TOP
-- BOTTON (No se utiliza porque ya es redundante, se utiliza el TOP con el Order By)

/* Primeros 10  registro que */
SELECT TOP 10 * FROM Products WHERE UnitPrice BETWEEN 10 AND 20 /*Obtener primeros registros*/
SELECT TOP 10 * FROM Products WHERE UnitPrice BETWEEN 10 AND 20 ORDER BY Products.ProductID DESC /*NOTA: Obtener ultimos registros*/

/* Seleccionar la cantidad(Quantity) del primeros registro de la orden por cada producto */
SELECT Products.ProductID, Products.ProductName, 
	  (	select top 1 Quantity from [Order Details] where [Order Details].ProductID = Products.ProductID ) [Primera cantidad bendida]
FROM Products ORDER BY ProductID

select * FROM [Order Details] ORDER BY ProductID ASC


/* Unir dos resultados */
SELECT TOP 5 * FROM Products WHERE UnitPrice BETWEEN 10 AND 20 ORDER BY Products.ProductID 
SELECT TOP 5 * FROM Products WHERE UnitPrice BETWEEN 10 AND 20 ORDER BY Products.ProductID DESC

