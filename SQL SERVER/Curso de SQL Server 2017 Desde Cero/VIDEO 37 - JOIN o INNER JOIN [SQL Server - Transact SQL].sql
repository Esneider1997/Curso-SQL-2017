/*Curso de SQL Server 2017 Desde Cero 

37 - JOIN o INNER JOIN [SQL Server - Transact SQL]*/

-- WHERE
-- JOIN (INNER JOIN)
-- LEFT JOIN ( LEFT OUTHER JOIN )
-- RIGHT JOIN
-- FULL OUTHER JOIN

/*SELECT Orders.OrderID, Orders.CustomerID, Customers.CompanyName, Products.ProductName,
		[Order Details].Quantity, [Order Details].UnitPrice
FROM Orders, [Order Details], Products, Customers
WHERE
Orders.OrderID = [Order Details].OrderID  AND
[Order Details].ProductID = Products.ProductID AND
Orders.CustomerID = Customers.CustomerID AND
Discount > 0*/

SELECT Orders.OrderID, Orders.CustomerID, Customers.CompanyName, Products.ProductName,
		[Order Details].Quantity, [Order Details].UnitPrice
FROM Orders
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID AND Discount > 0
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID