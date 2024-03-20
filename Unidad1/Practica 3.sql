--- Practica 3 ---

create database Practica3
go
use Practica3
go 

Create  table categoria (
	categoriaId int not null,
	numero int not null,
	descripcion varchar (50) not null,
	constraint pk_categoria
	primary key (categoriaId,numero)
)
go
Create  table producto (
	productoId int not null,
	descripcion varchar (100) not null,
	precio decimal (10,2) not null,
	stock int not null,
	categoriaId int not null,
	numeroInventario int not null,
	constraint pk_producto
	primary key (categoriaId),
	constraint fk_producto_cateoria
	foreign key (categoriaId,numeroInventario)
	references categoria(categoriaId, numero)
)