--

select p.ProductID, p.ProductName from products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
order by c.CategoryName asc


-- left join
select c.CustomerID, o.OrderID from Customers as c
left outer join 
orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null

select *, 
		CASE
			when Quantity > 30 then 'La cantidad es mayor a 30'
			when Quantity = 30 then 'La cantidad es 30'
			else 'La cantidad esta por debajo de 30'
			end as CantidadTexto
from [Order Details]


select *,
	case
		when UnitsInStock = 0 then 'Sin Stock'
		when UnitsInStock between 1 and 20 then 'Stock bajo'
		when UnitsInStock between 21 and 50 then 'Stock medio'
		when UnitsInStock>= 51 and UnitsInStock <= 90 then 'Stock Alto'
		else 'Stock maximo'
		end as 'tipo stock'
from Northwnd.dbo.Products

create database PruebaCase

use PruebaCase

Create table NuevaTabla (
ID int not null, 
nombre nvarchar (50) not null,
UnitPrice money,
UnitsInStock smallint,
Constraint pk_nuevatabla
primary key (id)
)


--Crear la estructura de una tabla en base a una consulta

Select ProductID, ProductName, UnitPrice, UnitsInStock
into NuevaTabla2
from Northwnd.dbo.Products

alter table NuevaTabla2
add constraint pk_NuevaTabla2
primary key (NumeroProducto)

Select ProductID as NumeroProducto, ProductName as NombreProducto, UnitPrice, UnitsInStock
into NuevaTabla3
from Northwnd.dbo.Products

select p.ProductID, p.ProductName,p.UnitPrice, p.UnitsInStock,
	case
		when UnitsInStock = 0 then 'Sin Stock'
		when UnitsInStock between 1 and 20 then 'Stock bajo'
		when UnitsInStock between 21 and 50 then 'Stock medio'
		when UnitsInStock>= 51 and UnitsInStock <= 90 then 'Stock Alto'
		else 'Stock maximo'
		end as 'tipo stock'
into TablaCase
from Northwnd.dbo.Products as p

select * from TablaCase

-- crear un SP (Store Procedure)
create proc visualizarClientes
as 
begin
select * from Customers
end 
go


create proc listarClientesPorCiudad
@ciudad nvarchar (15)
as 
begin
select * from Customers
where city = @Ciudad
end
go

exec listarClientesPorCiudad 'Madrid'

create proc listarClientesPorNombre
@nombre nvarchar (40)
as 
begin
select * from Customers
where CompanyName like @nombre + '%' 
end
go

exec listarClientesPorNombre 'laz'

--Realizar un sp que obtenga las ventas totales realizadas a los clientes elegidos por ano




