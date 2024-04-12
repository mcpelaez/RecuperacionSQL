CREATE DATABASE RecuperacionTransporte


USE RecuperacionTransporte

SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM Vehiculos


CREATE TABLE Cliente (
IdCliente INT PRIMARY KEY NOT NULL,
Telefono VARCHAR(20),
Direccion VARCHAR(100),
Email VARCHAR(50)
);

CREATE TABLE Ciudades (
IdCiudad INT PRIMARY KEY NOT NULL,
Nombre VARCHAR(50)
);

CREATE TABLE Modelo (
IdModelo INT PRIMARY KEY NOT NULL,
Nombre VARCHAR(50)
);

CREATE TABLE Marca (
IdMarca INT PRIMARY KEY NOT NULL,
Nombre VARCHAR(50)
);

CREATE TABLE Vehiculos (
Matricula INT PRIMARY KEY NOT NULL,
AñoFabricacion INT,
KilometrajeActual DECIMAL(10,2),
Color VARCHAR(50),
CapacidadCarga DECIMAL(10,2),
IdMarca INT,
IdModelo INT,
FOREIGN KEY (IdMarca) REFERENCES Marca(IdMarca),
FOREIGN KEY (IdModelo) REFERENCES Modelo(IdModelo)
);

CREATE TABLE Conductores (
IdConductor INT PRIMARY KEY NOT NULL,
IdLicenciaConduccion INT,
Nombre VARCHAR(50),
Apellidos VARCHAR(50),
Telefono VARCHAR(20),
Email VARCHAR(100),
Direccion VARCHAR(100)
);

CREATE TABLE VehiculosPorConductores (
IdVehiculoPorConductor INT PRIMARY KEY NOT NULL,
FechaAsignacion DATE,
Matricula INT,
IdConductor INT,
FOREIGN KEY (Matricula) REFERENCES Vehiculos (Matricula),
FOREIGN KEY (IdConductor) REFERENCES Conductores(IdConductor)
);

CREATE TABLE Rutas (
IdRutas INT PRIMARY KEY NOT NULL,
DistanciaKm DECIMAL(10,2),
DuracionAproximada TIME
);

CREATE TABLE Transportadoras (
NitTransportadora INT PRIMARY KEY NOT NULL,
Nombre VARCHAR(100),
Direccion VARCHAR(100),
TelefonoContacto VARCHAR(20),
Email VARCHAR(100),
Interna VARCHAR (100),
Externa VARCHAR (100),
IdVehiculoPorConductor INT,
FOREIGN KEY (IdVehiculoPorConductor) REFERENCES VehiculosPorConductores(IdVehiculoPorConductor)
);

CREATE TABLE Viajes (
IdViaje INT PRIMARY KEY NOT NULL,
KilometrajeInicial DECIMAL(10,2),
KilometrajeFinal DECIMAL(10,2),
FechaHoraInicio DATETIME,
FechaHoraEntrega DATETIME,
CostoViaje DECIMAL(10,2),
NitTransportadora INT,
IdCliente INT,
IdCiudad INT,
FOREIGN KEY (NitTransportadora) REFERENCES Transportadoras(NitTransportadora),
FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
FOREIGN KEY (IdCiudad) REFERENCES Ciudades(IdCiudad)
);

CREATE TABLE ViajesPorRutas (
IdViajePorRuta INT PRIMARY KEY NOT NULL,
Detalles VARCHAR(100),
IdViaje INT,
IdRuta INT,
FOREIGN KEY (IdViaje) REFERENCES Viajes (IdViaje),
FOREIGN KEY (IdRuta) REFERENCES Rutas(IdRutas)
);

INSERT INTO Cliente (IdCliente, Telefono, Direccion, Email) VALUES
(1, '1234567890', 'Calle 123, Ciudad X', 'cliente1@example.com'),
(2, '2345678901', 'Avenida 456, Ciudad Y', 'cliente2@example.com'),
(3, '3456789012', 'Carrera 789, Ciudad Z', 'cliente3@example.com'),
(4, '4567890123', 'Calle 987, Ciudad W', 'cliente4@example.com'),
(5, '5678901234', 'Avenida 654, Ciudad V', 'cliente5@example.com'),
(6, '6789012345', 'Carrera 321, Ciudad U', 'cliente6@example.com'),
(7, '7890123456', 'Calle 246, Ciudad T', 'cliente7@example.com'),
(8, '8901234567', 'Avenida 135, Ciudad S', 'cliente8@example.com'),
(9, '9012345678', 'Carrera 753, Ciudad R', 'cliente9@example.com'),
(10, '0123456789', 'Calle 159, Ciudad Q', 'cliente10@example.com');


INSERT INTO Ciudades (IdCiudad, Nombre) VALUES
(11, 'Medellin'),
(12, 'Cartagena'),
(13, 'Barranquilla'),
(14, 'Santa Marta'),
(15, 'Bogota'),
(16, 'Cali'),
(17, 'BuenaVentura'),
(98, ' '),
(99, ' '),
(100, ' ');



INSERT INTO Modelo (IdModelo, Nombre) VALUES
(18, 'Civic'),
(19, 'Corolla'),
(20, 'Accord'),
(21, 'Camry'),
(22, 'Mustang'),
(23, 'F-150'),
(24, 'Wrangler'),
(25, 'Explorer'),
(26, 'Prius'),
(27, 'Outback');


INSERT INTO Marca (IdMarca, Nombre) VALUES
(28, 'Toyota'),
(29, 'Honda'),
(30, 'Ford'),
(31, 'Chevrolet'),
(32, 'Volkswagen'),
(33, 'BMW'),
(34, 'Mercedes-Benz'),
(35, 'Audi'),
(36, 'Hyundai'),
(37, 'Nissan');


INSERT INTO Vehiculos (Matricula, AñoFabricacion, KilometrajeActual, Color, CapacidadCarga, IdMarca, IdModelo) VALUES
(123456, 2018, 50000.00, 'Rojo', 1000.00, 28, 18),
(234567, 2019, 40000.00, 'Azul', 1500.00, 29, 19),
(345678, 2020, 30000.00, 'Verde', 1200.00, 30, 20),
(456789, 2021, 20000.00, 'Blanco', 1300.00, 31, 21),
(567890, 2022, 10000.00, 'Negro', 1100.00, 32, 22),
(678901, 2023, 60000.00, 'Gris', 1400.00, 33, 23),
(789012, 2024, 70000.00, 'Plateado', 1600.00, 34, 24),
(890123, 2025, 80000.00, 'Dorado', 1700.00, 35, 25),
(901234, 2026, 90000.00, 'Plateado', 1800.00, 36, 26),
(123123, 2027, 95000.00, 'Negro', 1900.00, 37, 27);


INSERT INTO Conductores (IdConductor, IdLicenciaConduccion, Nombre, Apellidos, Telefono, Email, Direccion) VALUES
(38, 123456789, 'Juan', 'Perez', '1111111111', 'juanperez@example.com', 'Calle Principal'),
(39, 234567890, 'María', 'Gomez', '2222222222', 'mariagomez@example.com', 'Avenida Central'),
(40, 345678901, 'Carlos', 'Lopez', '3333333333', 'carloslopez@example.com', 'Carrera Norte'),
(41, 456789012, 'Ana', 'Martinez', '4444444444', 'anamartinez@example.com', 'Calle Sur'),
(42, 567890123, 'Luis', 'Rodriguez', '5555555555', 'luisrodriguez@example.com', 'Avenida Este'),
(43, 678901234, 'Laura', 'Garcia', '6666666666', 'lauragarcia@example.com', 'Calle Oeste'),
(44, 789012345, 'Pedro', 'Hernandez', '7777777777', 'pedrohernandez@example.com', 'Carrera Principal'),
(45, 890123456, 'Sofía', 'Diaz', '8888888888', 'sofiadiaz@example.com', 'Avenida Norte'),
(46, 901234567, 'Pablo', 'Sanchez', '9999999999', 'pablosanchez@example.com', 'Calle Secundaria'),
(47, 1234567890, 'Lucía', 'Fernandez', '0000000000', 'luciafernandez@example.com', 'Carrera Central');


INSERT INTO VehiculosPorConductores (IdVehiculoPorConductor, FechaAsignacion, Matricula, IdConductor) VALUES
(48, '2022-01-01', 123456, 38),
(49, '2022-01-02', 234567, 39),
(50, '2022-01-03', 345678, 40),
(51, '2022-01-04', 456789, 41),
(52, '2022-01-05', 567890, 42),
(53, '2022-01-06', 678901, 43),
(54, '2022-01-07', 789012, 44),
(55, '2022-01-08', 890123, 45),
(56, '2022-01-09', 901234, 46),
(57, '2022-01-10', 123123, 47);


INSERT INTO Rutas (IdRutas, DistanciaKm, DuracionAproximada) VALUES
(58, 100.50, '02:30:00'),
(59, 150.25, '03:45:00'),
(60, 80.75, '01:45:00'),
(61, 200.00, '04:00:00'),
(62, 120.00, '02:15:00'),
(63, 90.25, '02:00:00'),
(64, 180.50, '03:30:00'),
(65, 110.75, '02:30:00'),
(66, 140.25, '03:00:00'),
(67, 170.00, '03:15:00');


INSERT INTO Transportadoras (NitTransportadora, Nombre, Direccion, TelefonoContacto, Email, Interna, Externa, IdVehiculoPorConductor) VALUES
(6870, 'ExpressLog', 'Calle 123, Ciudad X', '1111111111', 'transportadoraA@example.com', 'Interna', 'Externa', 48),
(6971, 'RapidTrans', 'Avenida 456, Ciudad Y', '2222222222', 'transportadoraB@example.com', 'Interna', 'Externa', 49),
(7072, 'SpeedyCargo', 'Carrera 789, Ciudad Z', '3333333333', 'transportadoraC@example.com', 'Interna', 'Externa', 50),
(7173, 'QuickShip', 'Calle 987, Ciudad W', '4444444444', 'transportadoraD@example.com', 'Interna', 'Externa', 51),
(7274, 'SwiftFreight', 'Avenida 654, Ciudad V', '5555555555', 'transportadoraE@example.com', 'Interna', 'Externa', 52),
(7375, 'DirectHaul', 'Carrera 321, Ciudad U', '6666666666', 'transportadoraF@example.com', 'Interna', 'Externa', 53),
(7476, 'TurboTransit', 'Calle 246, Ciudad T', '7777777777', 'transportadoraG@example.com', 'Interna', 'Externa', 54),
(7577, 'FastTrack Logistics', 'Avenida 135, Ciudad S', '8888888888', 'transportadoraH@example.com', 'Interna', 'Externa', 55),
(7678, 'AcceleratedDelivery', 'Carrera 753, Ciudad R', '9999999999', 'transportadoraI@example.com', 'Interna', 'Externa', 56),
(7779, 'VelocityTransport', 'Calle 159, Ciudad Q', '0000000000', 'transportadoraJ@example.com', 'Interna', 'Externa', 57);


INSERT INTO Viajes (IdViaje, KilometrajeInicial, KilometrajeFinal, FechaHoraInicio, FechaHoraEntrega, CostoViaje, NitTransportadora, IdCliente, IdCiudad) VALUES
(78, 10000.00, 20000.00, '2022-01-01 08:00:00', '2022-01-01 15:00:00', 500.00, 6870, 1, 11),
(79, 20000.00, 30000.00, '2022-01-02 09:00:00', '2022-01-02 16:00:00', 600.00, 6971, 2, 12),
(80, 30000.00, 40000.00, '2022-01-03 10:00:00', '2022-01-03 17:00:00', 700.00, 7072, 3, 13),
(81, 40000.00, 50000.00, '2022-01-04 11:00:00', '2022-01-04 18:00:00', 800.00, 7173, 4, 14),
(82, 50000.00, 60000.00, '2022-01-05 12:00:00', '2022-01-05 19:00:00', 900.00, 7274, 5, 15),
(83, 60000.00, 70000.00, '2022-01-06 13:00:00', '2022-01-06 20:00:00', 1000.00, 7375, 6, 16),
(84, 70000.00, 80000.00, '2022-01-07 14:00:00', '2022-01-07 21:00:00', 1100.00, 7476, 7, 17),
(85, 80000.00, 90000.00, '2022-01-08 15:00:00', '2022-01-08 22:00:00', 1200.00, 7577, 8, 98),
(86, 90000.00, 95000.00, '2022-01-09 16:00:00', '2022-01-09 23:00:00', 1300.00, 7678, 9, 99),
(87, 95000.00, 100000.00, '2022-01-10 17:00:00', '2022-01-10 00:00:00', 1400.00, 7779, 10, 100);


INSERT INTO ViajesPorRutas (IdViajePorRuta, Detalles, IdViaje, IdRuta) VALUES
(88, 'Ruta A - Detalles', 78, 58),
(89, 'Ruta B - Detalles', 79, 59),
(90, 'Ruta C - Detalles', 80, 60),
(91, 'Ruta D - Detalles', 81, 61),
(92, 'Ruta E - Detalles', 82, 62),
(93, 'Ruta F - Detalles', 83, 63),
(94, 'Ruta G - Detalles', 84, 64),
(95, 'Ruta H - Detalles', 85, 65),
(96, 'Ruta I - Detalles', 86, 66),
(97, 'Ruta J - Detalles', 87, 67);


--Consulta 1: Obtener todos los vehículos con un kilometraje actual mayor a 50,000:
SELECT * FROM Vehiculos WHERE KilometrajeActual > 50000;

--Consulta 2: Obtener todos los clientes cuyo correo electrónico contenga "@example.com":
SELECT * FROM Cliente WHERE Email LIKE '%@example.com%';

--Consulta 3: Obtener todas las transportadoras que no tienen un contacto interno definido:
SELECT * FROM Transportadoras WHERE Interna IS NULL;

--Consulta 4: Obtener todos los viajes cuyo costo sea mayor a $1000:
SELECT * FROM Viajes WHERE CostoViaje > 1000.00;

--Consulta 5: Obtener todos los conductores cuyo nombre empiece con "L":
SELECT * FROM Conductores WHERE Nombre LIKE 'L%';

--Consulta 6: clientes en la ciudad de Bogotá:
SELECT * FROM Cliente WHERE Direccion LIKE '%Bogota%';

--Consulta 7: vehículos fabricados después del año 2020:
SELECT * FROM Vehiculos WHERE AñoFabricacion > 2020;

--Consulta 8: transportadoras cuyo nombre no contiene la palabra 'Express':
SELECT * FROM Transportadoras WHERE Nombre NOT LIKE '%Express%';

--Consulta 9: vehículos por conductores asignados después del 2022-01-05:
SELECT * FROM VehiculosPorConductores WHERE FechaAsignacion > '2022-01-05';

--Consulta 10: viajes que iniciaron después de las 12 PM:
SELECT * FROM Viajes WHERE HOUR(FechaHoraInicio) >= 12;




--Subconsultas
--Subconsulta 1: Obtener todos los vehículos asignados a conductores que se llamen Juan:
SELECT * FROM VehiculosPorConductores WHERE IdConductor IN (SELECT IdConductor FROM Conductores WHERE Nombre = 'Juan');

--Subconsulta 2: Obtener todas las transportadoras que hayan realizado viajes con un costo superior a $1000:
SELECT * FROM Transportadoras WHERE NitTransportadora IN (SELECT NitTransportadora FROM Viajes WHERE CostoViaje > 1000.00);

--Subconsulta 3: Obtener todas las ciudades en las que se haya entregado algún viaje:
SELECT * FROM Ciudades WHERE IdCiudad IN (SELECT IdCiudad FROM Viajes);

--Subconsulta 4: Obtener todos los vehículos cuyo modelo pertenezca a una marca con nombre que contenga "Toyota":
SELECT * FROM Vehiculos WHERE IdModelo IN (SELECT IdModelo FROM Modelo WHERE IdMarca IN (SELECT IdMarca FROM Marca WHERE Nombre LIKE '%Toyota%'));

--Subconsulta 5: Obtener todos los viajes realizados por clientes que tengan un ID mayor a 5:
SELECT * FROM Viajes WHERE IdCliente IN (SELECT IdCliente FROM Cliente WHERE IdCliente > 5);


--Consulta 1: Obtener todos los viajes con información detallada de la ciudad de destino (LEFT JOIN):
SELECT V.*, C.Nombre AS CiudadDestino 
FROM Viajes V 
LEFT JOIN Ciudades C ON V.IdCiudad = C.IdCiudad;

--Consulta 2: Obtener todas las transportadoras junto con los vehículos asignados a ellas (INNER JOIN):
SELECT T.*, V.Matricula 
FROM Transportadoras T 
INNER JOIN VehiculosPorConductores VC ON T.IdVehiculoPorConductor = VC.IdVehiculoPorConductor
INNER JOIN Vehiculos V ON VC.Matricula = V.Matricula;

--Consulta 3: Obtener todos los clientes junto con los detalles de los viajes que han realizado (RIGHT JOIN):
SELECT C.*, V.Detalles 
FROM Cliente C 
RIGHT JOIN Viajes V ON C.IdCliente = V.IdCliente;

--Consulta 4: Obtener todos los conductores junto con los vehículos asignados a ellos y sus respectivas marcas y modelos (INNER JOIN):
SELECT C.*, V.Matricula, M.Nombre AS Marca, MO.Nombre AS Modelo 
FROM Conductores C 
INNER JOIN VehiculosPorConductores VC ON C.IdConductor = VC.IdConductor
INNER JOIN Vehiculos V ON VC.Matricula = V.Matricula
INNER JOIN Marca M ON V.IdMarca = M.IdMarca
INNER JOIN Modelo MO ON V.IdModelo = MO.IdModelo;

--Consulta 5: Obtener todas las ciudades junto con los detalles de los viajes que han sido entregados en ellas (LEFT JOIN):
SELECT C.*, V.Detalles 
FROM Ciudades C 
LEFT JOIN Viajes V ON C.IdCiudad = V.IdCiudad;






