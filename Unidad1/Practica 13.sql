use NORTHWND


-- crear un sp que permita insertar registros en la tabla customers
select * from Customers

create proc InsertarRegistrosenCustomerssss
@CustomerID nchar (5),
@CompanyName nvarchar (40)
As Begin
insert into Customers(
CustomerID,
CompanyName
)
Values(
@CustomerID,
@CompanyName
);
end

 exec InsertarRegistrosenCustomerssss @CustomerID = ABABA, @CompanyName = AnalisioEnterprise;

create proc InsertarRegistrosenCustomer
@CustomerID nchar (5),
@CompanyName nvarchar (40),
@ContactName nvarchar (30),
@ContactTitle nvarchar (30),
@Address nvarchar (60),
@City nvarchar (15),
@Region nvarchar (15),
@PostalCode nvarchar (10),
@Country nvarchar (15),
@Phone nvarchar (24),
@Fax nvarchar (24)
As Begin
insert into Customers(
CustomerID,
CompanyName,
ContactName, 
ContactTitle,
[Address],
City,
Region,
PostalCode,
Country,
Phone,
Fax
)
Values(
@CustomerID,
@CompanyName,
@ContactName,
@ContactTitle,
@Address,
@City,
@Region,
@PostalCode,
@Country,
@Phone,
@Fax
);
end

exec InsertarRegistrosenCustomer 
@CustomerID = ALAAA,
@CompanyName = Alibaba,
@ContactName = CHinCHonCHin,
@ContactTitle = null,
@Address = asd,
@City = asdasaw,
@Region = 'Del norte',
@PostalCode = 54685,
@Country = Mexico,
@Phone = 465456165,
@Fax = si;


-- Crear un SP que permita eliminar registros en la tabla customers, por CustomerID
CREATE PROC EliminarRegistrodetablaCustomerPorID
@CustomerID nchar (5)
As Begin
delete from Customers
where CustomerID = @CustomerID

end

exec EliminarRegistrodetablaCustomerPorID @CustomerID = ALAAA

select * from Customers


-- Crear un SP que permita eliminar un producto de una orden dada
CREATE PROCEDURE EliminarProducto
@OrderID INT,
@ProductID INT
AS BEGIN
DELETE FROM [Order Details]
WHERE OrderID = @OrderID AND ProductID = @ProductID;
END

EXEC EliminarProducto @OrderID = 10248, @ProductID = 42;


select * from [Order Details]
select * from Products


-- Crear un SP que permita eliminar un producto de una orden, y al modificar el stock (UnitStock del producto)
CREATE PROCEDURE EliminarModificarProducto
@OrderID INT,
@ProductID INT
AS
BEGIN
Declare @Quantity INT;
Select @Quantity = Quantity
From [Order Details]
Where OrderID = @OrderID AND ProductID = @ProductID;
        -- Eliminar el producto de la orden
DELETE FROM [Order Details]
WHERE OrderID = @OrderID AND ProductID = @ProductID;
        -- Actualizar el stock del producto
UPDATE Products
SET UnitsInStock = UnitsInStock + @Quantity
WHERE ProductID = @ProductID;
END

EXEC EliminarModificarProducto @OrderID = 10248, @ProductID = 72;

select * from [Order Details]




