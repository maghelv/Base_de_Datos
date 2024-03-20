use northwnd

--Realizar un sp para Calcular el Total de una orden.

CREATE PROC TotalOrdenes
@ordenes NVARCHAR(15)
AS
BEGIN
 SELECT SUM(UnitPrice * Quantity) AS TotalOrder
 FROM [Order Details]
 WHERE OrderID = @ordenes
END
GO

--Realizar un sp para Actualizar la Cantidad de Productos en Stock

CREATE PROC ActualizarStock
@productoID INT,
@cantidad INT
AS
BEGIN
 UPDATE Products
 SET UnitsInStock = UnitsInStock - @cantidad
 WHERE ProductID = @productoID
END
GO

--Realizar un SP para Calcular el Total de Ventas de un Empleado

CREATE PROC TotalVentasEmpleado
@empleadoID INT
AS
BEGIN
 SELECT SUM(od.UnitPrice * od.Quantity) AS TotalVentas
 FROM [Order Details] od
 INNER JOIN Orders o ON od.OrderID = o.OrderID
 WHERE o.EmployeeID = @empleadoID
END
GO

--Realizar un SP para Actualizar el Nombre de un Empleado

CREATE PROC ActualizarNombreEmpleado
@empleadoID INT,
@nuevoNombre NVARCHAR(50),
@nuevoApellido NVARCHAR(50)
AS
BEGIN
 UPDATE Employees
 SET FirstName = @nuevoNombre, LastName = @nuevoApellido
 WHERE EmployeeID = @empleadoID
END
GO

--Realizar un SP para Obtener el Total de Ventas por País

CREATE PROC TotalVentasPorPais
AS
BEGIN
 SELECT c.Country, SUM(od.UnitPrice * od.Quantity) AS TotalVentas
 FROM [Order Details] od
 INNER JOIN Orders o ON od.OrderID = o.OrderID
 INNER JOIN Customers c ON o.CustomerID = c.CustomerID
 GROUP BY c.Country
END
GO


--Realizar un SP para Obtener el Número de Órdenes por Cliente

CREATE PROC NumeroOrdenesPorCliente
AS
BEGIN
 SELECT o.CustomerID, COUNT(o.OrderID) AS NumeroOrdenes
 FROM Orders o
 GROUP BY o.CustomerID
END
GO


--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría

CREATE PROC TotalProductosPorCategoria
AS
BEGIN
 SELECT p.CategoryID, SUM(od.Quantity) AS TotalProductosVendidos
 FROM [Order Details] od
 INNER JOIN Products p ON od.ProductID = p.ProductID
 GROUP BY p.CategoryID
END
GO

--SP para Calcular el Total de Ventas por Año

CREATE PROC TotalVentasPorAño
AS
BEGIN
 SELECT YEAR(o.OrderDate) AS Año, SUM(od.UnitPrice * od.Quantity) AS TotalVentas
 FROM [Order Details] od
 INNER JOIN Orders o ON od.OrderID = o.OrderID
 GROUP BY YEAR(o.OrderDate)
END
GO