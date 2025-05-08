create database Terminal;
use Terminal;


CREATE TABLE Pasajes (
    ID_Pasajes INT PRIMARY KEY auto_increment,
    Precio INT,
    Asiento INT,
    Hora_Salida TIME,
    Fecha_compra DATE ,
    ID_Cliente INT,
    ID_Ruta INT,
    ID_Bus INT
);

create table ordenes (
	ID_Ordenes int primary key auto_increment,
    Cantidad int,
    ID_Cliente int,
    Fecha date
);

create table Reservas (
	ID_Reserva int primary key auto_increment,
    ID_Clientes int,
    Fecha date,
    Hora time
);


create table Buses_Reserva (
	ID_Bus int,
    ID_Reserva int,
    PRIMARY KEY (ID_Bus, ID_Reserva) 
);

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Codi_Departamento INT
);

CREATE TABLE Ciudad (
    ID_Ciudad INT PRIMARY KEY,
    Codi_Ciudad INT,
    ID_Departamento INT
);

CREATE TABLE Rutas (
    ID_Ruta INT PRIMARY KEY,
    Origen VARCHAR(50),
    Destino VARCHAR(50),
    Distancia FLOAT
);

CREATE TABLE Ciudad_Rutas (
    ID_Ciudad INT,
    ID_Ruta INT,
    PRIMARY KEY (ID_Ciudad, ID_Ruta)
);

CREATE TABLE Empresas_Buses (
    ID_Empresa INT PRIMARY KEY,
    Correo VARCHAR(50),
    Telefono VARCHAR(15),
    Logo_URL VARCHAR(255)
);

CREATE TABLE Conductor (
    ID_Conductor INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Telefono VARCHAR(15),
    Licencia VARCHAR(20),
    ID_Empresa INT
);

CREATE TABLE Buses (
    ID_Bus INT PRIMARY KEY auto_increment,
    Placa VARCHAR(15),
    Numero_Bus INT,
    Capacidad INT,
    ID_Conductor INT,
    ID_Empresa INT
);

CREATE TABLE Buses_Conductor (
    ID_Bus INT,
    ID_Conductor INT,
    PRIMARY KEY (ID_Bus, ID_Conductor)
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Telefono VARCHAR(15),
    Identidad_Personal VARCHAR(15),
    ID_Ruta INT
);


CREATE TABLE Vendedores_Ticket (
    ID_Vendedor INT PRIMARY KEY,
    Nombre VARCHAR(15),
    Apellido VARCHAR(15),
    ID_Empresa INT
);

alter table Pasajes
add foreign key (ID_Cliente) references Clientes(ID_Cliente);
alter table Pasajes
add foreign key (ID_Ruta) references Rutas(ID_Ruta);
alter table Pasajes
add foreign key (ID_Bus) references Buses(ID_Bus);

alter table Buses_Reserva
add foreign key (ID_Bus) references Buses(ID_Bus);
alter table Buses_Reserva
add foreign key (ID_Reserva) references Reservas(ID_Reserva);

alter table Ciudad
add foreign key (ID_Departamento) references Departamento(ID_Departamento);
    
alter table Ciudad_Rutas
add foreign key (ID_Ciudad) references Ciudad(ID_Ciudad);
alter table Ciudad_Rutas
add foreign key (ID_Ruta) references Rutas(ID_Ruta);

alter table Conductor
add foreign key (ID_Empresa) references Empresas_Buses(ID_Empresa);        

alter table Buses
add foreign key (ID_Conductor) references Conductor(ID_Conductor);   
alter table Buses
add foreign key (ID_Empresa) references Empresas_Buses(ID_Empresa);   

alter table Buses_Conductor
add foreign key (ID_Bus) references Buses(ID_Bus); 
alter table Buses_Conductor
add foreign key (ID_Conductor) references Conductor(ID_Conductor); 

alter table Clientes
add foreign key (ID_Ruta) references Rutas(ID_Ruta); 

alter table Vendedores_Ticket
add foreign key (ID_Empresa) references Empresas_Buses(ID_Empresa); 

alter table Conductor change column Telefono Tel varchar(15);


Insert into Clientes (ID_Cliente, Apellido, Identidad_Personal) values (130, "Triana", 123);
insert INTO clientes values 
(36, "Manco", "Araujo", "2225555", "000", "3");

INSERT INTO empresas_buses (ID_Empresa, Correo, Telefono, Logo_URL) VALUES
(2, 'info@expresobogota.com', '6012345678', 'https://logos.com/expresobogota.png'),
(3, 'contacto@transportesdelnorte.com', '6019876543', 'https://logos.com/transportesnorte.png'),
(4, 'servicio@viajerosdelvalle.com', '6024567890', 'https://logos.com/viajerosvalle.png');

INSERT INTO rutas (ID_Ruta, Origen, Destino, Distancia) VALUES
(1, 'Bogotá', 'Medellín', 414.0),
(2, 'Cali', 'Pereira', 208.5),
(3, 'Barranquilla', 'Cartagena', 120.0),
(4, 'Bucaramanga', 'Cúcuta', 194.3),
(5, 'Manizales', 'Armenia', 98.7);


INSERT INTO conductor (ID_Conductor, Nombre, Apellido, Tel, Licencia, ID_Empresa) VALUES
(1, 'Carlos', 'Ramírez', '3104567890', 'ABC123456', 1),
(2, 'Lucía', 'Pérez', '3119876543', 'DEF654321', 1),
(3, 'Juan', 'Gómez', '3123456789', 'GHI789123', 2),
(4, 'Ana', 'Martínez', '3135678912', 'JKL321987', 2),
(5, 'Pedro', 'López', '3146789123', 'MNO456789', 1);

INSERT INTO vendedores_ticket (ID_Vendedor, Nombre, Apellido, ID_Empresa) VALUES
(1, 'Sofía', 'Díaz', 1),
(2, 'Mateo', 'Rodríguez', 1),
(3, 'Valentina', 'García', 2),
(4, 'Andrés', 'Torres', 2),
(5, 'Camila', 'Moreno', 1);

insert INTO reservas (ID_Reserva, ID_Clientes, Fecha, Hora) VALUES
(1, 1, '2025-05-10', '08:30:00'),
(2, 2, '2025-05-11', '09:00:00'),
(3, 3, '2025-05-12', '10:15:00'),
(4, 4, '2025-05-13', '11:45:00'),
(5, 5, '2025-05-14', '13:00:00');

INSERT INTO pasajes VALUES
(1, 15000, 12, '08:00:00', '2025-05-01', 3, 1, 1),
(2, 18000, 15, '09:30:00', '2025-05-02', 4, 2, 2),
(3, 20000, 5,  '07:45:00', '2025-05-03', 5, 3, 3),
(4, 17000, 8,  '06:30:00', '2025-05-04', 36, 4, 1),
(5, 16000, 22, '10:15:00', '2025-05-05', 120, 1, 2);

INSERT INTO buses (ID_Bus, Placa, Numero_Bus, Capacidad, ID_Conductor, ID_Empresa) VALUES
(6, 'JKL012', 104, 50, 4, 3);

INSERT INTO buses_conductor VALUES
(1,1),
(2,2),
(3,3),
(4,4);

INSERT INTO buses_reserva VALUES
(1,1),
(2,2),
(3,3),
(4,4);

INSERT INTO ciudad VALUES
(1, "77777", 1),
(2, "111111", 2),
(3, "3232323", 3),
(4, "3232324", 4);


INSERT INTO ciudad_rutas VALUES
(1,1),
(2,2),
(3,3),
(4,4);

INSERT INTO ordenes VALUES
(1, 11, 1, '2025-05-01'),
(2, 12, 2, '2025-05-02'),
(3, 13, 3, '2025-05-03'),
(4, 14, 4, '2025-05-04');

INSERT INTO departamento VALUES
(1,001),
(2,002),
(3,003),
(4,004);