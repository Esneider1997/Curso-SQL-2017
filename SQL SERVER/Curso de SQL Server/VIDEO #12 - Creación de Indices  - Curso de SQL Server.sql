-- Url: https://youtu.be/y1TxR53RlYU 
-- Creaci�n de Indices | Curso de SQL Server #12

/* Los mostrara de forma desordenada porque no tiene indice*/
USE clientes 
SELECT * FROM listado;

/*Si ejecutamos ver el detalle de los indices sin haberlos creado*/
-- R/ El objeto 'listado' no tiene ningun indice o el usuario no tiene permisos
EXECUTE sp_helpindex 'listado'

/* Creamos el INDEX AGRUPADO*/
CREATE CLUSTERED INDEX IDX_Nombre
on listado (nombre)
-- Nota: Mostra

/* Muestra los index creados de la tabla en este caso la tabla 'listado' */
EXECUTE sp_helpindex 'listado'
-------------------------------------------------------
---|  | index_name|index_description		   |index_keys | 
------|---------------------------------------------------
---|1 | IDX_Nombre|clustered located on PRIMARY|Nombre	   |
-------------------------------------------------------

/* Creamos el INDEX NO AGRUPADO */
-- Definicion: Sus datos no pueden ser ordenados en el disco por lo que crean una estructura adicional y sobre dicha extructura se ordena. 
-- Normalmente los indixes no agrupados se crean para mejorar el rendimiento de las consultas usadas con frecuencia no cubiertas por el indice no agrupado o para buscar 
-- filas en una tabla con ningun indice no agrupado. 
CREATE NONCLUSTERED INDEX IDX_Apellido
on listado (Apellido)

/* Listamos de nuevo: solo aparece la columna nombre en orden alfabetico */
SELECT * FROM listado;
-- Alberto		Jim�nez					Direcci�n8	22888888	77888888	susana@mail.com
-- Beatriz		Ram�rez					Direcci�n9	22999999	77999999	susana@mail.com
-- Francisco	Mart�nez				Direcci�n3	22333333	77333333	frank@mail.com
-- Irma			Polanco					Direcci�n2	22222222	77222222	irma@mail.com
-- Jos�			Manuel La�nez			Direcci�n4	22444444	77444444	jml@mail.com
-- Luis			L�pez					Direcci�n5	22555555	77555555	luisl@mail.com
-- Milena		Fuentes					Direcci�n6	22666666	77666666	milena@mail.com
-- Susana		Mendoza de Cartagena	Direcci�n7	22443456	77234567	susana@mail.com
-- Ximena		Armendaris				Direcci�n1	22111111	77111111	ximena@mail.com


/* Listamos de nuevo y esta vez y se indixara la columna apellido  */
SELECT nombre, apellido FROM listado;
--Ximena	Armendaris
--Milena	Fuentes
--Alberto	Jim�nez
--Luis		L�pez
--Jos�		Manuel La�nez
--Francisco	Mart�nez
--Susana	Mendoza de Cartagena
--Irma		Polanco
--Beatriz	Ram�rez


/* NO SE TE OLVIDE EL BOTON DE ARRIBA PARA VER EL PLAN DE EJECUCION QUE SE REALIZA */


/* -- SCRIPT DE LA TABLA PARA LOS EJERCICIOS
Create database Clientes
GO

USE Clientes 
GO
create table listado
(
Nombre varchar(50) null,
Apellido varchar(50) null,
Direccion varchar(50),
Tel int,
Cel int,
email varchar(50),
)

insert into listado values('Ximena','Armendaris','Direcci�n1',22111111,77111111,'ximena@mail.com');
insert into listado values('Irma','Polanco','Direcci�n2',22222222,77222222,'irma@mail.com');
insert into listado values('Francisco','Mart�nez','Direcci�n3',22333333,77333333,'frank@mail.com');
insert into listado values('Jos�','Manuel La�nez','Direcci�n4',22444444,77444444,'jml@mail.com');
insert into listado values('Luis','L�pez','Direcci�n5',22555555,77555555,'luisl@mail.com');
insert into listado values('Milena','Fuentes','Direcci�n6',22666666,77666666,'milena@mail.com');
insert into listado values('Susana','Mendoza de Cartagena','Direcci�n7',22443456,77234567,'susana@mail.com');
insert into listado values('Alberto','Jim�nez','Direcci�n8',22888888,77888888,'susana@mail.com');
insert into listado values('Beatriz','Ram�rez','Direcci�n9',22999999,77999999,'susana@mail.com'); 
*/
