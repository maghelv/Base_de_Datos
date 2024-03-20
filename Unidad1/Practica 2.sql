create database Practicas
go

use Practicas
go

create table Cliente(
ClienteID int not null,
NombreC varchar (100) not null,
DireccionC varchar (100) not null,
NumTelC varchar(20) not null,
constraint pk_ClienteID
primary key (ClienteID),
constraint Unique_NombreC
unique (NombreC)
)
go

create table Empleado(
EmpleadoID int not null,
Nombre varchar (50) not null,
Apellidos varchar (80) not null,
Sexo char (1) not null,
Salario decimal (10,2) not null,
constraint pk_empleado
primary key (EmpleadoID),
constraint chk Sexo,
)