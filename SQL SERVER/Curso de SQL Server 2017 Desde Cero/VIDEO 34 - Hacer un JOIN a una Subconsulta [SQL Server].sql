/*Curso de SQL Server 2017 Desde Cero 

34 - Hacer un JOIN a una Subconsulta [SQL Server]*/

SELECT * FROM Customers

SELECT * FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID


SELECT * FROM Orders
JOIN (select customerID, CompanyName, ContactName from Customers where Country = 'Brazil')
Customers ON Customers.CustomerID = Orders.CustomerID
-- Nota: Algo que si no podemos hacer en este tipo de subconsultas, es una consulta correlacionada, ejemplo: dentro del JOIN EN LA SUBCONSULTA COLOCAMOS "where Customers.CustomerID = Orders.CustomerID"

SELECT * FROM Orders
JOIN (select Employees.EmployeeID, LastName, TerritoryDescription
	  from Employees 
	  join EmployeeTerritories on Employees.EmployeeID = EmployeeTerritories.EmployeeID
	  join Territories on Territories.TerritoryID = EmployeeTerritories.TerritoryID
	  where City = 'London'
	  )
	  Employees ON Employees.EmployeeID = Orders.EmployeeID

/* Para que salga ordenado por Empleados y despues por Ordenes */
SELECT Employees.*, Orders.* FROM Orders
JOIN (select Employees.EmployeeID, LastName, TerritoryDescription
	  from Employees 
	  join EmployeeTerritories on Employees.EmployeeID = EmployeeTerritories.EmployeeID
	  join Territories on Territories.TerritoryID = EmployeeTerritories.TerritoryID
	  where City = 'London'
	  )
	  Employees ON Employees.EmployeeID = Orders.EmployeeID


