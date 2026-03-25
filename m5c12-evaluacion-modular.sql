DROP TABLE IF EXISTS Atencion;
DROP TABLE IF EXISTS Mascota;
DROP TABLE IF EXISTS Profesional;
DROP TABLE IF EXISTS Dueno;

CREATE TABLE Dueno (
    id_dueno SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE Mascota (
    id_mascota SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES Dueno(id_dueno)
);

CREATE TABLE Profesional (
    id_profesional SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Atencion (
    id_atencion SERIAL PRIMARY KEY,
    fecha_atencion DATE,
    descripcion TEXT,
    id_mascota INT,
    id_profesional INT,
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
    FOREIGN KEY (id_profesional) REFERENCES Profesional(id_profesional)
);

INSERT INTO Dueno (nombre, direccion, telefono) VALUES
('Juan Pérez','Calle Falsa 123','555-1234'),
('Ana Gómez','Avenida Siempre Viva 456','555-5678'),
('Carlos Ruiz','Calle 8 de Octubre 789','555-8765');

INSERT INTO Mascota (nombre, tipo, fecha_nacimiento, id_dueno) VALUES
('Rex','Perro','2020-05-10',1),
('Luna','Gato','2019-02-20',2),
('Fido','Perro','2021-03-15',3);

INSERT INTO Profesional (nombre, especialidad) VALUES
('Dr. Martínez','Veterinario'),
('Dr. Pérez','Especialista en dermatología'),
('Dr. López','Cardiólogo veterinario');

INSERT INTO Atencion (fecha_atencion, descripcion, id_mascota, id_profesional) VALUES
('2025-03-01','Chequeo general',1,1),
('2025-03-05','Tratamiento dermatológico',2,2),
('2025-03-07','Consulta cardiológica',3,3);

BEGIN;

INSERT INTO Mascota (nombre, tipo, fecha_nacimiento, id_dueno)
VALUES ('Max','Perro','2022-01-01',1);

INSERT INTO Atencion (fecha_atencion, descripcion, id_mascota, id_profesional)
VALUES ('2025-03-10','Vacunación',4,1);

UPDATE Dueno
SET telefono = '555-0000'
WHERE id_dueno = 1;

COMMIT;
SELECT * FROM Mascota;
SELECT * FROM Atencion;
SELECT * FROM Dueno;
SELECT * FROM Profesional;


