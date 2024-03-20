use NORTHWND

declare @numero = 10
if @numero >5
begin
print ('El numero es mayor a 5')
end
else
begin
print ('El numero es menor a igual a 5')
end


--Realizar codigo transact para determinar si una persona tiene la edad para beber alcohol.
--El codigo debe tener variable que determine la edad minima permitida y otro variable
 --con la edad de la persona
 --Comparar si la peprsona iene la edad minima permitida, Mostrando un mensaje 'Edad'

 DECLARE @EdadMinimaPermitida INT;
 DECLARE @EdadPersona INT;

SET @EdadMinimaPermitida = 18;
SET @EdadPersona = 21;
IF @EdadPersona >= @EdadMinimaPermitida
BEGIN
    PRINT 'Edad Permitida';
END
ELSE
BEGIN
    PRINT 'Edad no permitida';
END;

--Solicitar un salario mayor a 4000 calcular incremento 20%
--si es mayor o igual a 5000 calcular un incremento del 30%
--si es menor a 4000 calcular el aumento igual a 0 y Impprimir el aumento

DECLARE @Salario INT;
DECLARE @Incremento DECIMAL(5,2);

SET @Salario = 5500;

IF @Salario > 4000
BEGIN
IF @Salario >= 5000
BEGIN
SET @Incremento = 0.30; --30%
END
ELSE
BEGIN
SET @Incremento = 0.20; --20%
END
END
ELSE
BEGIN
SET @Incremento = 0; 
END
-- Aumento
DECLARE @Aumento DECIMAL(10,2);
SET @Aumento = @Salario * @Incremento;

-- Resultado
PRINT 'Salario Original: ' + CAST(@Salario AS VARCHAR(10));
PRINT 'Incremento: ' + CAST(@Incremento * 100 AS VARCHAR(5)) + '%';
PRINT 'Aumento: ' + CAST(@Aumento AS VARCHAR(10));


--generar un sp en donde se compare si un producto tiene mas de 100 unidades en stock,
--incrementar su rpecio en un 10% de lo contrario incrementarlo en 20% utilizar la bd northwnd