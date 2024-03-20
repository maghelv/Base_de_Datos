-- CREATE DATABASE

CREATE DATABASE Practica4
go

use Practica4
go

CREATE TABLE tblCategoria(
CategoriaID int not null,
Numero int not null,
Descripcion varchar (50) not null,
stock int not null,
constraint pk_CategoriaID
primary key (CategoriaID, Numero)
)

CREATE TABLE tblProducto(
ProductoID int not null,
Descripcion varchar (100) not null,
Precio decimal (10,2) not null,
stock int not null,
numeroInventario int not null,
constraint pk_ProductoID
primary key (ProductoID),
constraint fk_Producto_Categoria
foreign key(ProductoID,numeroInventario)
references tblCategoria (CategoriaID,Numero)
)
