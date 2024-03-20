use NORTHWND
 
 --Ejemplo
 declare @x int
 set @x = 10
 select @x=count(x)
 From Orders
 print @x

--crear un store procidure que pueda insertar registros en la tabla customers *INSERT*

CREATE PROCEDURE InsertarCustomers
    @CompanyName NVARCHAR(40),
    @Country NVARCHAR(15),
    @city NVARCHAR(15)
AS
BEGIN
	    INSERT INTO Customers (CompanyName,Country,City)
    VALUES (@Companyname,@Country,@city);
	end
	exec InsertarCustomers
	@CompanyName = 'SweetTooth',
	@City = 'Coyotepec',
	@country = 'Mexico'
 

--Crear un store procedure que permita eliminar registros en la tabla customers, por customersID *DELETE*

select * from Customers
CREATE PROCEDURE EliminarCostumers
    @CustomerID varchar(5)
AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = @CustomerID;

END;

EXEC EliminarCostumers @CustomerID = OBO;

--Crear un sp que permita eliminar un producto de una orden dada. *DELETE*

CREATE PROCEDURE EliminarProduct
    @OrderID INT,
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Products
    WHERE ProductID = @OrderID
        AND ProductID = @ProductID;
END;

EXEC EliminarProduct @OrderID = 1, @ProductID = 101;

--Crear un sp que permita eliminar un producto de una orden y modificar el stock(unitstock del producto ) *Update products* *Delete order details*
select * from [Order Details]
CREATE PROCEDURE EliminarProductoYModificarStock
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    DECLARE @Cantidad INT;
    SELECT @Cantidad = Quantity
    FROM [Order Details]
    WHERE ProductID = @ProductID
        AND ProductID = @ProductID;

    DELETE FROM [Order Details]
    WHERE  = @Cantidad
        AND ProductoID = @ProductID;

    UPDATE Products
    SET UnitsInStock = UnitsInStock + @Cantidad
    WHERE ProductID = @ProductID;
END;

EXEC EliminarProductoYModificarStock @Quantity = 4, @ProductID = 11;