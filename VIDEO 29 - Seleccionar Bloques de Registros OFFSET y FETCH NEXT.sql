/*Curso de SQL Server 2017 Desde Cero 

VIDEO 29 - Seleccionar Bloques de Registros: OFFSET y FETCH NEXT [SQL Server - Transact SQL]]*/

-- LIMIT (No existe en Sql Server)
-- OFFSET 'n' ROWS
-- FETCH NEXT 'n' ROWS ONLY
-- NOTA: Es obligatorio colocar el ORDER BY; Esto se utiliza en la paginaciones

SELECT * FROM Products
ORDER BY ProductID
OFFSET 5 ROWS /* Se salta los 5 registros*/
FETCH NEXT 10 ROWS ONLY /* Muestra solo 10 registro de la CONSULTA*/

/* No devolvera nada: mas adelante no hay ningun registro */
SELECT * FROM Products
ORDER BY ProductID
OFFSET 5100 ROWS 
FETCH NEXT 10 ROWS ONLY

/* Mostrara todos los registros */
SELECT * FROM Products
ORDER BY ProductID
OFFSET 0 ROWS 
FETCH NEXT 1000 ROWS ONLY


/* antes del 5 registro mostrara los 10 */
SELECT * FROM Products
ORDER BY ProductID DESC
OFFSET 5 ROWS 
FETCH NEXT 10 ROWS ONLY
