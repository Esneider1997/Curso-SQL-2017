/*Curso de SQL Server 2017 Desde Cero 

31 - Introducción a las Subconsultas (Subqueries) [SQL Server - Transact SQL]]*/


--SELECT * FROM Products
--WHERE ProductID NOT IN(1,5,7,8)

-- Productos que no se han vendido
SELECT * FROM Products WHERE ProductID NOT IN(select [Order Details].ProductID from [Order Details])

-- cuatro productos que no se han vendidos
SELECT * FROM [Order Details] WHERE ProductID IN(4000,
4001,
50000,
50001)

-- productos que se han vendido
SELECT * FROM Products WHERE ProductID IN(select [Order Details].ProductID from [Order Details])

--condiciones: descuanto mayor a cero, nunca han tenido un descuento pero se han vendido(segunda condicion)
SELECT * FROM Products WHERE ProductID NOT IN(select [Order Details].ProductID from [Order Details] where Discount > 0)
AND ProductID IN(select ProductID [Order Details])

