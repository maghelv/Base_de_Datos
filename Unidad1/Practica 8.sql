-- seleccionar solo los clientes que no son de espana
select * from Customers
where not country = 'spain'

-- Seleccionar todos los productos que no tengan un precion entre 18 y 20 dlls
select * from Products
where not (UnitPrice >=18 and UnitPrice<=20)

select * from Products
where UnitPrice not between 18 and 20

select * from Customers
where not (city = 'paris' or City = 'london')

select * from Customers
where city not in ('paris' , 'london)'

--seleccionar todos los clientes que terminen con la palabra "es"
select * from Customers
where CompanyName like '%es'

--seleccionar todos los clientes que tengan la palabra "mer"
select * from Customers
where CompanyName like '%mer%'

