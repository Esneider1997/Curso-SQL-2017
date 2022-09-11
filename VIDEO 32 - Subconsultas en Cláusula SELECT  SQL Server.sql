/*Curso de SQL Server 2017 Desde Cero 

32 - Subconsultas en Cláusula SELECT [SQL Server]*/

-- La relacion vendria siendo consulta coorelacionada.
--Monto total de cada producto que se ha vendido, total unidades vendidas, precio promedio cual se han vendido
SELECT ProductID, ProductName, 
ISNULL((select sum(Quantity * UnitPrice) from [Order Details] where [Order Details].ProductID = Products.ProductID ),0) [total monto vendido],
ISNULL((select sum(UnitPrice) from [Order Details] where [Order Details].ProductID = Products.ProductID ),0) [total unidades vendidas],
ISNULL((select avg(UnitPrice) from [Order Details] where [Order Details].ProductID = Products.ProductID ),0) [precio promedio por orden],
-- (select Quantity * UnitPrice from [Order Details] where [Order Details].ProductID = Products.ProductID) -- si colocas esto dira que la subconsulta devuelve mas de un valor.
ISNULL((select top 1 Quantity * UnitPrice from [Order Details] where [Order Details].ProductID = Products.ProductID order by OrderID desc),0)-- se soluciona con un top 1, NOTA: En este caso si puedo usar un order by solo cuando es un exit, i t
FROM Products
-- NOTA: podemos utilizar JOIN lo unico que no podemos utilizar es un order by. 2. debe mandar uno y un solo rejistro
-- 1	Computadora	14277,60	651,60	17,1473	720,00

-- select Quantity * UnitPrice from [Order Details] where [Order Details].ProductID = 1
-- 720,00
