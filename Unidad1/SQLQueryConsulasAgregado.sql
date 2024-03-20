--consultas de agregado
-- caracteristicas principales que devuelven un solo registro

--top y percent

--selecciona las primera 10 ordenes de compra

use NORTHWND
--primeros 10 registros
select top 10 * from orders
--ultimos 10 registros
select top 10 * from orders
order by OrderID desc

select top 10 CustomerID as 'Numero de cliente',OrderDate as 'fecha de orden', ShipCountry as 'Pais de entrega'
from orders
order by OrderID desc
 --seleccionar el 50% de los registros

select top 50 percent * from Orders

select top 25 percent * from Orders

--seleccionar los primeros 3 clienes de alemania
select * from Customers
select top 3 ContactName from Customers
where Country = 'Germany'

select top 3 companyname as 'cliente', country as pais, address as direccion
from Customers
where Country= 'Germany'

--seleccionar el producto con un precio mayor
select * from Products
order by UnitPrice desc

--muestra el precio mas alto de los productos (max)
select max(unitprice)as 'precio maximo' from Products

--mostrar el precio minimo de los productos
select min(unitprice)as 'precio minimo' from Products

--seleccionar todas las ordenes
select * from Orders

--seleccionar el numero total de ordenes
select * from Orders
select count(*)as 'total de ordenes'from Orders

select count(ShipRegion)as 'total de ordenes'from Orders

--seleccionar todas aquellas ordenes donde la region de envio sea null

select count(*) from Orders
where ShipRegion is not null

--seleccionar de forma asendente los productos por precio
select * from Products
order by UnitPrice 

--seleccinar el numero de precio de los productos
select count(distinct UnitPrice) from Products

--seleccionar todos los diferentes paises de los clientes
select count(distinct country)as 'num paises' from Customers

--seleccionar la suma total de cantidades de las ordenes de compra
select *from [Order Details]
select sum(Quantity) from [Order Details]

select * from [Order Details]
--seleccionar todos los registros de order details calculando su importe
select *, count(UnitPrice*Quantity)as importe from [Order Details] 
--seleccionar el total en dinero que ha venido la emrpesa
select sum(UnitPrice*Quantity)as importe from [Order Details]

--seleccionar el total de venta del producto chang
select sum(Unitprice*Quantity) as total
from [Order Details]
where ProductID = 2

--Seleccionar el promedio de los precios de los productos (avg)
select avg(unitprice) from Products
--seleccionar el promedio total y el total de venta de los productos 41,60,31
select sum(UnitPrice*Quantity)as total, avg(UnitPrice*Quantity) 
from [Order Details]
where ProductID in (41,60,31)

--seleccionar el numero de ordenes realizadas entre 1996 y 1997




