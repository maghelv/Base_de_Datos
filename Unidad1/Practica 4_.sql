--Practica #4
use Practica3
--Crear una tabla que contenga un campo calculado

create table PruebaCalculado(
id int not null identity (1,1),
nombre varchar (50),
precio decimal (10,2) not null,
existencia int not null,
importe as
(precio * existencia),
constraint pk_pruebacalculo
primary key (id)
)

select * from PruebaCalculado
insert into PruebaCalculado
values ( ,345,4)