--CREAR BASE DE DATOS
create database centro_medico;
--tabla medico LISTO
--tabla especialidad LISTO
--tabla consulta LISTO
--tabla paciente LISTO

create table medicos(
	medico_id serial not null primary key,
	rut varchar(12) not null unique,
	nombre varchar(30) not null,
	direccion varchar(60)
);

create table especialidades (
	especialidad_id serial not null primary key,
	codigo varchar(25) not null unique,
	descripcion varchar(30) not null
);

create table pacientes(
	paciente_id serial not null primary key,
	nombre varchar (30) not null,
	apellido varchar (30) not null,
	rut varchar(12) not null unique 
);
-- Modificar la tabla pacientes para agregar la columna direccion
ALTER TABLE pacientes
ADD COLUMN direccion VARCHAR(100);

create table consultas(
	consulta_id serial not null primary key,
	medico_id int,
	paciente_id int,
	foreign key (medico_id) references medicos (medico_id),
	foreign key (paciente_id) references pacientes (paciente_id)
);
-- Modificar la tabla consultas para agregar las columnas fecha, hora y numero_box
ALTER TABLE consultas
ADD COLUMN fecha DATE,
ADD COLUMN hora TIME,
ADD COLUMN numero_box INT;



create table licencias (
    licencia_id SERIAL PRIMARY KEY,
    medico_id INT,
    paciente_id INT,
    codigo VARCHAR(25) NOT NULL,
    diagnostico VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_termino DATE NOT NULL,
    FOREIGN KEY (medico_id) REFERENCES medicos (medico_id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes (paciente_id)
);

--AGREGAR CAMPO A ESPECIALIDADES
alter table especialidades add column medico_id int,
 add foreign key (medico_id) references medicos(medico_id);

-- Seleccionar todos los datos de la tabla medicos
SELECT * FROM medicos;
-- Seleccionar todos los datos de la tabla especialidades
SELECT * FROM especialidades;
-- Seleccionar todos los datos de la tabla pacientes
SELECT * FROM pacientes;
-- Seleccionar todos los datos de la tabla consultas
SELECT * FROM consultas;
-- Seleccionar todos los datos de la tabla licencias
SELECT * FROM licencias;


insert into medicos(rut,nombre,direccion) values ('1111111111-1','medico_1','direccion_medico_1');
insert into especialidades(codigo,descripcion,medico_id) values ('1212121212QE','especialidad_prueba',1);
insert into pacientes(nombre,apellido,rut) values ('nombre_paciente_1','apellido_paciente','1111111111-1');
insert into consultas (medico_id,paciente_id) values (1,1);


-- Insertar datos en la tabla medicos
INSERT INTO medicos (rut, nombre, direccion) VALUES 
('12345678-9', 'Dr. Juan Pérez', 'Calle Falsa 123'),
('98765432-1', 'Dra. María García', 'Avenida Siempre Viva 456');

-- Insertar datos en la tabla especialidades
INSERT INTO especialidades (codigo, descripcion) VALUES 
('CARD', 'Cardiología'),
('NEUR', 'Neurología'),
('PED', 'Pediatría');

-- Insertar datos en la tabla pacientes
INSERT INTO pacientes (nombre, apellido, rut, direccion) VALUES 
('Pedro', 'González', '11223344-5', 'Calle Ejemplo 789'),
('Lucía', 'López', '22334455-6', 'Avenida Prueba 1011');

-- Insertar datos en la tabla consultas
INSERT INTO consultas (medico_id, paciente_id, fecha, hora, numero_box) VALUES 
(1, 1, '2024-06-10', '10:30', 101),
(2, 2, '2024-06-11', '11:00', 102);

-- Insertar datos en la tabla licencias
INSERT INTO licencias (medico_id, paciente_id, codigo, diagnostico, fecha_inicio, fecha_termino) VALUES 
(1, 1, 'L12345', 'Lumbalgia', '2024-06-12', '2024-06-19'),
(2, 2, 'L67890', 'Migraña crónica', '2024-06-13', '2024-06-20');

UPDATE consultas 
SET fecha = current_date, hora = current_time, numero_box = 101 
WHERE consulta_id = 1;




