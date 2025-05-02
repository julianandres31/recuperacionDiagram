create database Terminal_Intermunicipal;
show databases;
use Terminal_Intermunicipal;
create table Pasajes (
	ID_Pasajes int,
    Precio int,
    Asiento int,
    Hora_Salida time,
    Fecha_Compra date,
    primary key (ID_Pasajes)
);

insert into Pasajes (Precio, Asiento, Hora_Salida, Fecha_Compra) values ("valor del asiento", "lugar del bus")

create table Cliente (
	ID_Cliente int,
    Nombre varchar (20);
    Apellido varchar (20);
    Telefono varchar (20);
    Identidad_Personal varchar (15);
);