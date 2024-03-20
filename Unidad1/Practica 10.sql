-- Consultas de agregado
-- Caracteristicas principales es que se devuelven un solo registro

-- Top y Precent

use NORTHWND

select top 10 * from Orders

select top 10 * from Orders
Order by OrderID desc

select top 10 CustomerID as ' numero de cliente', OrderDate as 'Fechas de orden', ShipCountry as 'Pais de entrega' from Orders
Order by OrderID desc

-- Seleccionar el 50% de los registros
select top 50 percent * from Orders

-- Seleccionar los primeros 3 clientes de alemania
select top 3 * from Customers
where Country = 'Germany'

-- Seleccionar el producto con el precio mayor
select top 1 * from Products
order by UnitPrice desc

select max (UnitPrice) as 'Precio Mayor' from Products

select min (UnitPrice) as 'Precio Menor' from Products

--Seleccionar todas las ordenes de compra
select * from Orders

--Seleccionar el numero total de ordenes
select count (*) as 'Total de ordenes' from Orders

select count (ShipRegion) as 'Total de ordenes' from orders

-- Seleccionat todas aquellas ordenes donde la region de envio no sea null
select * from Orders
where ShipRegion is not null

-- Seleccionar el numero de precios de los productos
select count (distinct UnitPrice) from Products

select count (distinct Country) as 'Paises' from Customers

-- Seleccionar la suma total de cantidades de las ordenes de compra
select sum (quantity) from [Order Details]

select * from [Order Details]

-- seleccionar todos los registros de order details calculando su importe
-- (Campo calculado)
select *,(UnitPrice*Quantity) as 'Importe'from [Order Details]

-- Seleccionar el total en dinero que ha vendido la empresa
select sum (UnitPrice*Quantity) as 'Total Vendido' from [Order Details]

-- Seleccionar el total de venta del producto Chang
select ProductID from [Order Details]

--Seleccionar el promedio de los precios de los productos
select avg (UnitPrice) from Products

--Seleccionar el promedio total de venta de los productos 41, 60 y 31
select sum (UnitPrice * Quantity) as 'Total', avg (UnitPrice * Quantity) 'Promedio'
from [Order Details]
where ProductID = 41 or ProductID = 60 or ProductID = 31

-- Seleccionar el numero de ordenes realizadas entre 1996 y 1997
select count(*) from Orders
where OrderDate between '1996-01-01' and '1997-12-31'

-- Instruccion group by
select count(*) from Customers
group by Country
order by 1 desc

-- Seleccionar el numero de ordenes enviadas por el shippervia
select shipvia,count(*) as 'ShipVia' from Orders
group by Shipvia

select * from
Customers as c
join orders as o
on c.CustomerID = o.CustomerID
join Shippers as s
on o.ShipVia = s.ShipperID

-- Seleccionar del producto y su categoria
select * from c.


-- Listar el nombre del cliente, fecha de la orden, los nombres de los productos que fueron vendidos
select c.CompanyName, o.OrderDate, p.ProductName 
from Customers as c inner join orders as o on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

-- seleccionar el nombre completo de los empleados, los nombres de los productos que vendio y la cantidad de ellos y calcular el importe
select concat(e.FirstName, ' ', e.Lastname) as 'Nombre Completo', p.ProductName as 'Descripcion', od. Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID 
inner join Products as p on p.ProductID = od.ProductID

-- seleccionar el nombre completo de los empleados, los nombres de los productos que vendio y la cantidad de ellos y calcular el importe de peru, suiza, alemania y francia
select concat(e.FirstName, ' ', e.Lastname) as 'Nombre Completo', p.ProductName as 'Descripcion', od. Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe', ShipCountry
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID 
inner join Products as p on p.ProductID = od.ProductID
where o.ShipCountry in ('france', 'Germany', 'Switzerland')

-- seleccionar el nombre completo de los empleados, los nombres de los productos que vendio y la cantidad de ellos y calcular el importe de peru, suiza, alemania y francia. Agrupados por el numero total de ordenes
select concat(e.FirstName, ' ', e.Lastname) as 'Nombre Completo', p.ProductName as 'Descripcion', od. Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe', ShipCountry, count (*) as 'Total de ordenes'
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID 
inner join Products as p on p.ProductID = od.ProductID
where o.ShipCountry in ('france', 'Germany', 'Switzerland')
group by concat (e.FirstName, ' ', e.LastName)
order by 2

select concat(e.FirstName, ' ', e.Lastname) as 'Nombre Completo', p.ProductName as 'Descripcion', od. Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe', ShipCountry, count (*) as 'Total de ordenes'
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID 
inner join Products as p on p.ProductID = od.ProductID
where o.ShipCountry in ('france', 'Germany', 'Switzerland') and o.EmployeeID = '2'
group by concat (e.FirstName, ' ', e.LastName),  p.ProductName, od. Quantity, (od.Quantity * od.UnitPrice), ShipCountry
order by 2

-- Seleccionar el total de dinero que se le han vendido a cada uno de los clientes de 1996
select concat(e.FirstName, ' ', e.Lastname) as 'Nombre Completo', p.ProductName as 'Descripcion', od. Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe', ShipCountry, count (*) as 'Total de ordenes'
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID 
inner join Products as p on p.ProductID = od.ProductID
where o.ShipCountry in ('france', 'Germany', 'Switzerland') and o.EmployeeID = '2'
group by concat (e.FirstName, ' ', e.LastName),  p.ProductName, od. Quantity, (od.Quantity * od.UnitPrice), ShipCountry
order by 2

-- seleccionar el importe total que se ha vendido por categoria y nombre de producto, que permita visualizar el producto mas vendido
select c.CategoryName, p.ProductName, (od.Quantity * od.UnitPrice) as 'Total' 
from Categories as c
inner join Products as p
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName, p.ProductName, (od.Quantity * od.UnitPrice)
having sum (od.Quantity * od.UnitPrice) >=20000
order by 2 desc



-- De la consulta anterior, solamente mostrar aquellos totales que son mayores a 20000
select c.CategoryName, p.ProductName, (od.Quantity * od.UnitPrice) as 'Total' 
from Categories as c
inner join Products as p
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName, p.ProductName, (od.Quantity * od.UnitPrice)
having sum (od.Quantity * od.UnitPrice) <=20000
order by 2 desc

-- seleccionar el numero de clientes por cada pais, en donde solo sean incluidos los que tengan mas de 5 clientes y ordenados de forma decendiente por el numero de clientes
select country, count (*) from Customers
where Country <> 'Brazil'
group by country
having count(*) > 5 

-- Seleccionar los clientes que han realizado pedidos en mas de un pais
select * from Customers




