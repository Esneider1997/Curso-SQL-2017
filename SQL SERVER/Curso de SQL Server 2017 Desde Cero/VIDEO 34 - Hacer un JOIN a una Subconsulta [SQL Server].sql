/*Curso de SQL Server 2017 Desde Cero 

34 - Hacer un JOIN a una Subconsulta [SQL Server]*/

SELECT * FROM Customers

SELECT * FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID