/*Curso de SQL Server 2017 Desde Cero 

35 - Creación de Llaves Foránea (FOREIGN KEY) [SQL Server]*/

CREATE TABLE Estudiantes 
(
	Id int Primary key identity(1,1),
	Nombre varchar(100)
)

CREATE TABLE Materias
(
	Id int primary Key identity(1,1),
	Nombre varchar(10)
)

CREATE TABLE EstudiantesMaterias
(
	EstudiantesId int,
	MateriasId int,
	FOREIGN KEY (EstudiantesID) REFERENCES Estudiantes(Id), CONSTRAINT FK_MateriasId 
	FOREIGN KEY (MateriasId) REFERENCES Materias(Id),  PRIMARY KEY (EstudiantesId, MateriasId)
)