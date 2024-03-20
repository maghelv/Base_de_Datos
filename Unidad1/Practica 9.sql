-- sELECCIONAR TODOS LOS CLIENTES DE UNA CIUDAD QUE EMPIECE CON L
-- sEGUIDO DE 3 CARACTERESY QUE TERMINE CON LA PALABRA ON
select* from Customers
where City like 'L___on'

--SECCIONAR
use NORTHWND
select *
-- SELECCIONAR TODOS LOS PRODUCTOS QUE COMIENCEN CON LA LETRA A, C, o T
select * from Products
where ProductName like '[a c t]'

-- CLAUSULA IN()
select * from Customers
where Country in ('Germany', 'Spain', 'UK' )

-- SELECCIONAR TODOS LOS CLIENTES DE ALEMANIA, ESPANA, Y REINO UNIDO
select * from Customers
where Country = 'Germany' or Country = 'Spain' or Country = 'UK' 

-- INTRODUCCION BETWEEN
-- SELECCIONAR TODOS LOS PRODUCTOS CON UN PRECIO ENTRE 10 Y 20 DOLARES
select * from Products
where UnitPrice between 10 and 20

select * from Products
where UnitPrice >=10 and UnitPrice <= 20


