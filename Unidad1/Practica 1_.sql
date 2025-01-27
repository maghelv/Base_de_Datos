-- SQL-LDD
-- Crear base de datos bdentornosvip

create database bdentornosv
go

-- Cambiar de base de datos
USE bdentornosv 
go 

-- Crear una tabla categoria
create table tblcategoria(
	categoriaId int not null,
	descripcion varchar(100) not null,
	constraint pk_tblcategoria
	primary key(categoriaID),
	constraint unique_descripcion
	unique(descripcion)

)
go


-- Ejercicio 1 --
  CREATE TABLE tblProducto(
  productoId int not null,
  nombreP varchar(50) not null,
  precio decimal(10,2) not null,
  existencia int not null,
  categoriaId int not null,
  constraint pk_tblProducto
  primary key(productoId),
  constraint unique_nombreP
  unique(nombreP),
  constraint chk_precio
  check(precio>0.0 and precio<=10000),
  constraint chk_existencia
  check(existencia>=0),
  constraint fk_tblProducto_tblcategoria
  foreign key(categoriaId)
  references tblcategoria(categoriaId)
)
go
