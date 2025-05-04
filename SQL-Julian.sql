create database terminal;
show databases;
use terminal;

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Codi_Departamento INT
);

CREATE TABLE Ciudad (
    ID_Ciudad INT PRIMARY KEY,
    Codi_Ciudad INT,
    DepartamentoID_Departamento INT,
    FOREIGN KEY (DepartamentoID_Departamento) REFERENCES Departamento(ID_Departamento)
);

CREATE TABLE Rutas (
    ID_Ruta INT PRIMARY KEY,
    Origen VARCHAR(50),
    Destino VARCHAR(50),
    Distancia FLOAT
);

CREATE TABLE Ciudad_Rutas (
    CiudadID_Ciudad INT,
    RutasID_Ruta INT,
    PRIMARY KEY (CiudadID_Ciudad, RutasID_Ruta),
    FOREIGN KEY (CiudadID_Ciudad) REFERENCES Ciudad(ID_Ciudad),
    FOREIGN KEY (RutasID_Ruta) REFERENCES Rutas(ID_Ruta)
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
    Empresas_BusesID_Empresa INT,
    FOREIGN KEY (Empresas_BusesID_Empresa) REFERENCES Empresas_Buses(ID_Empresa)
);

CREATE TABLE Buses (
    ID_Bus INT PRIMARY KEY,
    Placa VARCHAR(15),
    Numero_Bus INT,
    Capacidad INT,
    ConductorID_Conductor INT,
    Empresas_BusesID_Empresa INT,
    FOREIGN KEY (ConductorID_Conductor) REFERENCES Conductor(ID_Conductor),
    FOREIGN KEY (Empresas_BusesID_Empresa) REFERENCES Empresas_Buses(ID_Empresa)
);

CREATE TABLE Buses_Conductor (
    BusesID_Bus INT,
    ConductorID_Conductor INT,
    PRIMARY KEY (BusesID_Bus, ConductorID_Conductor),
    FOREIGN KEY (BusesID_Bus) REFERENCES Buses(ID_Bus),
    FOREIGN KEY (ConductorID_Conductor) REFERENCES Conductor(ID_Conductor)
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Telefono VARCHAR(15),
    Identidad_Personal VARCHAR(15),
    RutasID_Ruta INT,
    FOREIGN KEY (RutasID_Ruta) REFERENCES Rutas(ID_Ruta)
);

CREATE TABLE Pasajes (
    ID_Pasajes INT PRIMARY KEY,
    Precio INT,
    Asiento INT,
    Hora_Salida TIME,
    Fecha_compra DATE,
    PasajerosID_Pasajero INT,
    RutasID_Ruta INT,
    BusesID_Bus INT,
    FOREIGN KEY (PasajerosID_Pasajero) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (RutasID_Ruta) REFERENCES Rutas(ID_Ruta),
    FOREIGN KEY (BusesID_Bus) REFERENCES Buses(ID_Bus)
);

CREATE TABLE Vendedores_Ticket (
    ID_Vendedor INT PRIMARY KEY,
    Nombre VARCHAR(15),
    Apellido VARCHAR(15),
    Empresas_TransportadoraID_Empresa INT,
    FOREIGN KEY (Empresas_TransportadoraID_Empresa) REFERENCES Empresas_Buses(ID_Empresa)
);
