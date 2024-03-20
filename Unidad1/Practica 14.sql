--Realizar un SP que calcule las ventas totales hechas por cada empleado por año, el sp debe solicitar el nombre del empleado y un año inicial y un año final

alter proc VentasTotalesporEmpleadoporAno
@EmployeeID varchar(10)
As
Begin 
SELECT 
e.EmployeeID ,sum(od.Quantity) AS TotalVentas , year (o.OrderDate) as AnoDeVenta
FROM Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on o.OrderID = od.OrderID
where e.EmployeeID = @EmployeeID
group by e.EmployeeID, year (o.OrderDate)
end

exec VentasTotalesporEmpleadoporAno @EmployeeID = 3


-- segunda forma

Alter proc VentasConAno
@EmployeeID varchar(10),
@AnoInicial int,
@Anofinal int
As
Begin 
SELECT 
e.EmployeeID ,sum(od.Quantity) AS TotalVentas , year (o.OrderDate) as AnoDeVentas
FROM Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on o.OrderID = od.OrderID
where e.EmployeeID = @EmployeeID or year (o.OrderDate) >= @AnoInicial and year (o.OrderDate) <= @Anofinal
group by e.EmployeeID, year (o.OrderDate)
end

exec VentasConAno @EmployeeID = 3, @AnoInicial = 1996, @Anofinal = 1997

SELECT 
e.EmployeeID ,sum(od.Quantity) AS TotalVentas , year (o.OrderDate) as AnoDeVenta
FROM Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on o.OrderID = od.OrderID
where e.EmployeeID = 1 and year (o.OrderDate) = 1996
group by e.EmployeeID, year (o.OrderDate)

select EmployeeID, OrderDate from Orders
where  EmployeeID = 3 and year (OrderDate) >= 1996 and year (OrderDate) <= 1997
group by EmployeeID, OrderDate

select * from Orders



-- crear un SP que Muestre el precio promedio de los productos dentro de cada categoría, 
-- incluyendo solo aquellas categorías cuyo precio promedio de producto supere el precio enviado en el store procedure

alter proc PromediodeProductosPorCategoria
@ValorDeCategoria int
as
begin
select c.CategoryID, c.CategoryName, avg (p.UnitPrice) as ValorDeCategoria
from Products p
inner join Categories c
on p.CategoryID = c.CategoryID
group by c.CategoryID, c.CategoryName
having avg (p.UnitPrice) >= @ValorDeCategoria
end

exec PromediodeProductosPorCategoria @ValorDeCategoria = 30

select * from Categories

select * from Products



