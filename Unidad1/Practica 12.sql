---Realizar un sp para Calcular el Total de una orden.
CREATE PROC TotalOrden
@OrderID INT
AS
BEGIN
SELECT @OrderID AS OrderID, SUM(od.UnitPrice * od.Quantity) AS OrderTotal
FROM [Order Details] od
inner JOIN 
    Orders o ON od.OrderID = o.OrderID
WHERE o.OrderID = @OrderID;
END

drop proc TotalOrden

EXEC TotalOrden @OrderID = 10248;


--Realizar un sp para Actualizar la Cantidad de Productos en Stock
CREATE PROC ActualizarCantidadProductoStock
@ProductID INT,
@NewCant INT
AS
BEGIN
UPDATE Products
SET UnitsInStock = @NewCant
WHERE ProductID = @ProductID;
END

drop proc ActualizarCantidadProductoStock

EXEC ActualizarCantidadProductoStock @ProductID = 1, @NewCant = 90; 

select * from Products


--Realizar un SP para Calcular el Total de Ventas de un Empleado
CREATE PROC TotaldeVentasdeunEmpleado
@EmployeeID INT
AS
BEGIN
SELECT sum(EmployeeID) as TotalVentas
FROM Orders
WHERE EmployeeID = @EmployeeID
END

drop proc TotaldeVentasdeunEmpleado

EXEC TotaldeVentasdeunEmpleado @EmployeeID = 2

select * from orders

--Realizar un SP para Actualizar el Nombre de un Empleado
CREATE PROCEDURE ActualizarNombre
@EmployeeID INT,
@NewName Varchar(25)
AS
BEGIN
UPDATE Employees
SET FirstName = @NewName
WHERE EmployeeID = @EmployeeID;
END

EXEC Actualizarnombre @EmployeeID = 1, @NewName = Pancracio; 

select * from Employees


--Realizar un SP para Obtener el Total de Ventas por País
CREATE PROCEDURE TotaldeVentasporPais
@ShipCountry varchar(30)
AS
BEGIN
SELECT @ShipCountry AS Country, SUM(od.Quantity * od.UnitPrice) AS TotalVentas
FROM Orders o
inner JOIN 
[Order Details] od ON o.OrderID = od.OrderID
WHERE o.ShipCountry=@ShipCountry;
END

EXEC TotaldeVentasporPais @ShipCountry=USA;


--Realizar un SP para Obtener el Número de Órdenes por Cliente
CREATE PROC NumerodeOrdenesdeunCliente
@CustomerID Varchar(20)
AS
BEGIN
SELECT @CustomerID AS CustomerID, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
INNER JOIN 
Orders o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID=@CustomerID
END

EXEC NumerodeOrdenesdeunCliente @CustomerID = SAVEA;


--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría
CREATE PROC ProductosVendidosporCategoria
@TotalCategoria varchar (20)
AS
BEGIN
SELECT c.CategoryName, sum(od.Quantity * od.UnitPrice) as 'ProductosVendidos'
FROM Categories c
inner JOIN Products p
on c.CategoryID = p .CategoryID
inner JOIN [Order Details] od
on p.ProductID = od.ProductID
WHERE CategoryName = @TotalCategoria
GROUP BY c.CategoryName
END

EXEC ProductosVendidosporCategoria @TotalCategoria = Condiments


-- Categories:  Beverages, Condiments, Confections, Dairy Products, Grains/Cereals, Meat/Poultry, Produce, Seafood

--SP para Calcular el Total de Ventas por Año
Alter PROC TotaldeVentasAño
@OrderDate int, @tipo int 
AS
BEGIN

if @tipo = 1
begin
SELECT 
YEAR(OrderDate) AS OrderYear, sum(od.UnitPrice * od.Quantity) AS TotalVentas
FROM Orders o
INNER JOIN 
[Order Details] od ON o.OrderID = od.OrderID 
group by YEAR(OrderDate)
end
else
begin
SELECT 
 sum(od.UnitPrice * od.Quantity) AS TotalVentas
FROM Orders o
INNER JOIN 
[Order Details] od ON o.OrderID = od.OrderID 
where year(o.OrderDate) = @OrderDate 
end
end

drop proc TotaldeVentasAño

EXEC TotaldeVentasAño @OrderDate=1996, @tipo = 1;

