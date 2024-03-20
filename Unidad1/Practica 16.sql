-- Vistas

alter view VistaConsulta1
as
select c.CompanyName as 'Nombre Cliente',
min(o.OrderDate) as 'Fecha de primera compra',
sum(od.Quantity * od.UnitPrice) as 'Total de compra'
from Orders o
inner join [Order Details] od
on o.OrderID = od.OrderID
inner join Customers c
on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) >1000


select * from VistaConsulta1
where [Nombre Cliente] = 'Vaffeljernet'

select sum([Total de compra]) as total
from VistaConsulta1
where year ([Fecha de Primera Compra]) = 1997


create view VistaConsulta2
as
select concat (e.FirstName, ' ', e.LastName) as FullName,
count(o.OrderID) as 'Total'
from Orders as o
inner join Employees as e
on e.EmployeeID = o.EmployeeID
Group by concat (e.FirstName, ' ', e.LastName)
having count(o.OrderID) > 50

select * from VistaConsulta2



create view VistaConsulta3
as 
select count(Distinct od.ProductID) as 'Total'
from Orders as o
inner join Employees as e
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where concat (e.FirstName, ' ', e.LastName) = 'Andrew Fuller'

select * from VistaConsulta3



create view VistaConsulta4
as
select concat (e.FirstName, ' ', e.LastName) as 'Nombre Cliente',
sum(od.Quantity * od.UnitPrice) as 'Total de compra'
from Orders o
inner join Employees e
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on od.OrderID = o.OrderID
where year (o.OrderDate) = '1996'
group by concat (e.FirstName, ' ', e.LastName)
having sum(od.Quantity * od.UnitPrice) > 500