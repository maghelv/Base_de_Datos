-- Lenguaje sql de maniulacion de datos (sql-lmd) (insert,dele,update,select)
--seleccionar todos los datos de la tabla categoria

select * from Categoria

--Aregar una sola fila a una tabla (Categoria)

insert into categoria
values (1,'Carnes Frias')

insert into categoria
values (2,'Lacteos')

insert into categoria
values (3,'Vinos y Licores')

insert into categoria
values (4,'Ropa')

insert into categoria(idCategoria,Descripcion)
value(5,'Linea Blanca')

insert into categoria(idCategoria,Descripcion)
value('Electronica',6)

--Insertar varios registros a la vez
insert into Categoria
values(7,'Carnes Buenas')
	  (8,'Dulces')
	  (9,'Panaderia')
	  (10,'Salchiconeria')

-- Insertar aaprtir de una conslta

select idCategoria, Descripcion from categoria

create table categoriacopia
	categoriaid int not null primary key,
	nombre varchar(100) not null

-- Actualizacion de datos squl-lmd
select * from producto

insert into Producto
values(1,'Salchicha', 600,12, 1)

insert into Producto
values(1,'Paleta de pollo', 22,56, 8)

insert into Producto
values(3,'Refrigerador', 3000,22, 5),
	  (3,'Chilindrina', 23,43, 9),
	  (3,'Terrible mezcal', 200,12, 3),
	  (3,'Leche de burra', 235,3, 2)

	  update producto
	  set idproducto - 2
	  where nombre ='paleta de pollo'

	  select producto from 
	  
	  update producto
	  set idproducto = 4
	  where nombre = 'chilindrina'

	  update producto
	  set idproducto = 5
	  where nombre = 'Terrible mezcal'

	  update producto
	  set idproducto = 5
	  where nombre = 'Terrible mezcal'

	  update producto
	  set nombre = 'salchica grande'
		existencia = 20
		where IdProducto = 1

	  alter table producto
	  add constraint pk_producto2
	  primary key(idproducto)

 --Eliminar registros de una tabla

	  /*
		delete from tabla
		where expresion
	*/

select * from producto

delete from producto
where idProducto =4

delete from producto
where nombre = 'salcicha grande'

delete from producto
where precio >=3 and precio <=22 

delete from producto
where precio >=3 and precio <=12
