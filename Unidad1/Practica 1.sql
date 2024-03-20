USE Practicas
go

CREATE TABLE tblCliente(
IDCliente int not null,
Nombre varchar (100) not null,
Direccion varchar(100)not null,
Telefono varchar (20)not null,
Constraint pk_IDCliente
primary key (IDCliente),
constraint unique_Nombre
unique (Nombre)
)

CREATE TABLE tblEmpleado(
IDEmpleado int not null,
Nombre varchar (50) not null,
Apellidos varchar(80) not null,
Sexo char (1) not null,
Salario decimal (10,2) not null,
constraint pk_IDEmpleado
primary key (IDEmpleado),
constraint chk_Salario
check(salario>=400 and salario <=50000),
)

CREATE TABLE tblVenta(
IDVenta int not null,
Fecha date not null,
IDCliente int not null,
IDEmpleado int not null,
constraint pk_IDVenta
primary key (IDVenta),
constraint fk_IDCliente
foreign key (IDCliente)
references tblCliente(IDCliente),
constraint fk_IDEmpleado
foreign key (IDEmpleado)
references tblEmpleado(IDEmpleado)
)

CREATE TABLE tblProducto(
IDProducto int not null,
Descripcion varchar (100) not null,
Existencia int not null,
PrecioUnitario decimal (10,2) not null,
constraint pk_IDProducto
primary key (IDProducto),
constraint unique_Descripcion
unique (Descripcion),
)

CREATE TABLE Detalle_Venta(
  IDVenta int not null,
  IDProducto int not null,
  Precio decimal(10,2) not null,
  Cantidad int not null, 
  constraint pk_Detalle_Venta
  primary key(IDVenta,IDProducto),
  constraint fk_tblVenta
  foreign key(IDVenta)
  references tblVenta(IdVenta),
  constraint fk_tblProducto
  foreign key(IDProducto)
  references tblProducto(IDProducto),
)


