/*Curso de SQL Server 2017 Desde Cero 

30 - ROW_NUMBER(): Enumerar Resultados [SQL Server - Transact SQL]]*/

-- LIMIT (No existe en Sql Server)
-- OFFSET 'n' ROWS
-- FETCH NEXT 'n' ROWS ONLY
-- ROWS_NUMBER() OVER(ORDER BY)
-- NOTA: ROWS_NUMBER() Nos permite numerar cada uno de los registros, otra razon es para meterlos dentro de un WHILE

-- Primer ORDERBY: pOR NOMBRE DEL PRODUCTO, SEGUNDO por el ID, Prima el segundo ORDER
SELECT ROW_NUMBER() OVER(ORDER BY ProductName) AS #, *
FROM Products
ORDER BY ProductID

-- Prima el product ID
SELECT ROW_NUMBER() OVER(ORDER BY ProductID) [Product ID], ProductName, QuantityPerUnit
FROM Products

-- Prima el Product Name 
SELECT ROW_NUMBER() OVER(ORDER BY ProductName)  [Product Name], ProductName, QuantityPerUnit
FROM Products

--Se puede agregar otro valor
SELECT ROW_NUMBER() OVER(ORDER BY ProductName, productID)  [Product Name], ProductName, QuantityPerUnit
FROM Products

-- Esto ya casi no se usa a partir del SQL SERVER 2012 para poder limitar los registros.
-- Muestre los 10 a partir del 5 registro
SELECT *
FROM ( SELECT ROW_NUMBER() OVER(ORDER BY productID) N, ProductID, ProductName, QuantityPerUnit
FROM Products) TABLA WHERE N >= 6 AND N <= 15
-- Nota: este es insuficiente porque es doble consulta, no se puede utilizar ORDER BY DESPUES DEL 2do FROM

-- Es el mismo que tenemos arriba 
SELECT * FROM Products
ORDER BY ProductID
OFFSET 5 ROWS
FETCH NEXT 10 ROWS ONLY 

SELECT COUNT(*) AS NUMERO, ProductName, QuantityPerUnit
FROM Products
GROUP BY ProductName, QuantityPerUnit
ORDER BY ProductName


SELECT COUNT(*) AS NUMERO, ProductName, QuantityPerUnit
FROM Products
GROUP BY ProductName, QuantityPerUnit
ORDER BY ProductName

SELECT * FROM Products WHERE ProductName = 'Proyector'

