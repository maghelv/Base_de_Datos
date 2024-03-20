select * from customers

select CompanyName, ContactName, City from Customers

select Country from Customers

select distinct counrty from customers

select count(*) from customers

select count(country) from customers

select count(distinct country) from customers

-- Seleccionar el cliente que tenga un ID Anton
select * from Customers
where CustomersID = 'Anton'

-- Seleccionar todos los clientes de Mexico
select * from Customers
where Country = 'Mexico'

--Seleccionar todos los regristros de los clientes de berlin
select * from Customers
where City = 'Berlin'

-- Order by

-- Seleccionar todos los productos ordenados por precio
select * from Products
Order by UnitPrice

-- Seleccionar Todos los productos ordenados por el precio de mayor a menor
select * from Products
Order by UnitPrice desc

-- Seleccionar todos los productos alfabeticamente
select * from Products
Order by ProductName

-- Seleccionar todos los clientes por pais y dentro por nombre de forma ascendente
select country, CompanyName, city from Customers
Order by country, CompanyName Desc

-- Operador and

-- Seleccionar todos los clientes de espana y que su nombre comience con G
select * from Custromers
where Country = 'Spain' and CompanyName like 'G%'

-- Seleccionar todos los clientes de berlin, 
-- Alemania con un codigo postal mayor a 1200
select * from Customers
where country='Alemania' and city='Berlin' and PostalCode >= 1200

-- Seleccionar todos los clientes de espana y que su nombre comience con G o con R
select * from Custromers
where Country = 'Spain' and (CompanyName like 'G%' or CompanyName like 'R%')

--Clausula or
--Seleccionar todos los clientes de Alemania o Espana
select * from Customers
where Country = 'Germany' or Country = 'Spain'

--Seleccionar todos los clientes de Berlin o de Noruega o que comiencen su nombre con G
select * from Customers
where city = 'Berlin' or Country = 'Norway' or CompanyName like 'G%'

