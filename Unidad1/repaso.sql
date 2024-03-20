use bd_joins

--REPASO INNER JOIN

select c.Numero as 'Numero de cliente',
c.Nombre as 'Nombre del cliente',
c.pais 'Pais del cliente',
o.FechaOrden 'Fecha de orden',
o.FechaEntrega 'Fecha de entrega',
o.Clienteid as 'foreign key de la tabla cliente'
from
Clientes as c
inner join Ordenes as o
on c.Numero = o.Clienteid

-- LA TABLA JOIN (LA TABLA IZQUIERDA SIEMPRE ES LA PRIMERA
--QUE SE PONE EN EL JOIN)

select c.Numero as 'Numero de cliente',
c.Nombre as 'Nombre del cliente',
c.pais 'Pais del cliente',
o.FechaOrden 'Fecha de orden',
o.FechaEntrega 'Fecha de entrega',
o.Clienteid as 'foreign key de la tabla cliente'
from
Clientes as c
left join Ordenes as o
on c.Numero = o.Clienteid
where o.Clienteid is null