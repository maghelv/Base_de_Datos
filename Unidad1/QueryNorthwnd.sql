-- Consultas simles con select -sql-lmd

select * from Customers
--seleccionar todos los clientes
select CompanyName, ContactName, City from Customers

--seleccionar todos los paises de los clientes (distinct)
select country from Customers

-- selecciona el numero de paises de donde son mis clientes (count)
select count(*)from Customers

select count(country) from Customers

select count (distinct country) from Customers

--seleccionar el cliente que tenga un ID anton

select * from Customers
where CustomerID = 'ANTON'


--seleccionar todos los clientes de mexico

select * from Customers
where Country = 'Mexico'

--Seleccionar todos los registros de los clientes de berlin
Select CompanyName, city, country from Customers
where City = 'berlin'

--order by
--seleccionar todos los productos por precio

select * from Products
order by UnitPrice 

--seleccionar todos los productos ordenados por el precio de mayor a menor

select * from Products
order by UnitPrice DESC

--seleccionar todos los productos alfabeticamente

select * from Products
order by ProductName

select * from Products
order by ProductName DESC

--seleccionar todos los clientes por pais y dentro por nombre de forma asendente

select Country,CompanyName, City from Customers
order by Country desc, CompanyName asc

-- operador and
-- seleccionar todos los clientes de españa y que su nombre conmience con g

select * from Customers
where Country ='spain' and CompanyName like 'g%'

--seleccionar todos los clientes de berlin, alemania con codigo postal mayor a 1200

select * from Customers
where Country = 'Germany' and
city = 'Berlin'and PostalCode >1200


--selecconar todos los clientes de españa y 
--que su nombre comience con g o con r

select * from Customers
Where Country = 'spain' 
and (CompanyName like 'g%' or CompanyName like 'r%') 

--Clausula or
--seleccionar todos los clientes de alemania o españa

select * from Customers
Where Country = 'germany' or (country = 'spain')

--seleccionar todos los clientes de berlin o noruega o que comiencen su nombre con g

select * from Customers
Where Country = 'northway' or
City = 'berlin'
or CompanyName like 'G%'