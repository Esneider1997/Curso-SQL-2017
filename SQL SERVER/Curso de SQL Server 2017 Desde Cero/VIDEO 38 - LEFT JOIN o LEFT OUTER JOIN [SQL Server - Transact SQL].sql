/*Curso de SQL Server 2017 Desde Cero 

38 - LEFT JOIN o LEFT OUTER JOIN [SQL Server - Transact SQL] */

-- WHERE
-- JOIN (INNER JOIN)
-- LEFT JOIN ( LEFT OUTHER JOIN )
-- RIGHT JOIN
-- FULL OUTHER JOIN

SELECT  Products.ProductID, Products.ProductName, [Order Details].OrderID, [Order Details].Quantity, [Order Details].UnitPrice
FROM Products
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
ORDER BY ProductID


SELECT DISTINCT Products.ProductID, Products.ProductName
FROM Products
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
ORDER BY ProductID