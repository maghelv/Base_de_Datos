use NORTHWND

--seleccionar todas las ordenes de compra
--mostrando las fechas ordenes de compra
--nombre del shipper y el nombre al cliente
--al que se le vendio (inner join)

select c.CompanyName as 'Cliente'
, O.OrderDate as 'Fecha de orden'
, s.ShipperID as 'Nombre flete'
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

--funciona sin el inner tambien.
select c.CompanyName as 'Cliente'
, O.OrderDate as 'Fecha de orden'
, s.ShipperID as 'Nombre flete'
from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
join Shippers as s
on o.ShipVia = s.ShipperID


--seleccionar el nombre del producto y su categoria

select c.CategoryName, p.ProductName from
Categories as c
inner join
Products as p
on c.CategoryID = p.CategoryID
--listar el nombre del cliente, la fecha de la orden,
--los nombres de los productos que fueron vendidos

select c.CompanyName, o.OrderDate, ProductName
from 
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details]as od
on o.OrderID  = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--seleccionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe 

select CONCAT(e.FirstName,' ',e.LastName)as 'nombre completo',
p.ProductID as 'Producto', od.Quantity as 'cantidad',(od.Quantity * od.UnitPrice) as 'importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID

--seleccionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe,
--pero de suiza, alemania y francia

select CONCAT(e.FirstName,' ',e.LastName)as 'nombre completo',
p.ProductID as 'Producto', od.Quantity as 'cantidad',
(od.Quantity * od.UnitPrice) as 'importe', o.ShipCountry
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where  o.ShipCountry in ('France' ,'Germany',' Switzerland')

--seleccionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe,
--pero de suiza, alemania y francia
-- Agrupados por la cantidad total de ordenes hechas por los
-- empleados

select CONCAT(e.FirstName,' ',e.LastName)as 'nombre completo'
.ShipCountry, p.ProductName, count as 'total de ordenes'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where  o.ShipCountry in ('France' ,'Germany',' Switzerland')
group by CONCAT(e.FirstName,' ',e.LastName)
order by 1

-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

--seleccionar el total de dinero que se le
--han vendido a cada uno de los clienes
--de 1996

select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc

--seleccionar el total de dinero que se le
--han vendido a cada uno de los clienes
--Por cada año

Select c.CompanyName as 'Cliente' year(o.OrderDate) as 'Año',sum(od.Quantity * od.UnitPrice) as 'total'
from
[Order Details] as od
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
group by year(o.OrderDate)
order by 1 asc

--seleccionar el importe total que se ha vendido
--por categoria
select c.CategoryName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by 2 Desc
--seleccionar el importe total que se ha vendido
--por categoria y nombre de producto que permita
--visualizar el producto mas vendido
select p.ProductID, p.ProductName, c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
order by c.CategoryName asc

--left join
select c.CompanyName,o.OrderID
from Customers as c
left outer join 
orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null

