--seleccoar todos los clientes con una ciudad que comience con l y
--seguido de tres cualquiera caracteres y que termine con la palabra "on"


use NORTHWND
select * from
Customers
where City like 'L___on'


--seleccionar todos los productos que comiencen con la "a" o "c" o "t"
select * from 
Products
where ProductName like '[act]%'

--seleccioanr todos los productos que comiencen de la letra b a la d
select * from 
Products
where ProductName like '[b-g]%'

--clausula in ()
--seleccionar todos los clientes de alemania, españa y reino unido
--usar esta***
select * from Customers
where Country in('Germany','Spain','uk')
 --forma larga
select * from Customers
where Country = 'Germany'
or Country= 'spain' or
Country = 'uk'

--not in
--seleccionar todos los clientes que no son de alemania, españa y reino unido
select * from Customers
where Country not in ('Germany','spain','uk')
-- otro modo
select * from Customers
where not Country = 'Germany'
or Country= 'spain' or
Country = 'uk'

--instruccion between
--seleccionar todos los productos con un precio entre 10 y 20 dolares

select * from Products
where UnitPrice between 10 and 20

select * from Products
where UnitPrice>=10 and UnitPrice<=20

--alias de columnas y alias de tablas
--seleccionar el nombre del producto, su stock, y su precio
select ProductName as 'Nombre del producto',
UnitsInStock as existencias , UnitPrice from Products

select ProductName as 'Nombre del producto',
UnitsInStock as existencias , p.UnitPrice as precio 
from Products as p
inner join [Order Details] as od
on p.ProductID= od.ProductID
