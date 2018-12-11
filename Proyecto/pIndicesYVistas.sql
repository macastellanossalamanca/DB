
-- Vistas

-- Se crea una vista con el ID, el nombre y la cantidad de servicios medicos tomados por cada mascota

CREATE OR REPLACE VIEW SERVICIOS_MEDICOS_TOMADOS AS (
SELECT MID, NOMBRE, COUNT(SERVICIOMEDICO) AS SERVICIOSTOMADOS 
FROM TOMASERVICIOMEDICO JOIN MASCOTAS ON MASCOTAS.MID = TOMASERVICIOMEDICO.MASCOTAID 
GROUP BY MID,NOMBRE);

-- Se crea una vista con el ID, el nombre y la cantidad de servicios spa tomados por cada mascota

CREATE OR REPLACE VIEW SERVICIOS_SPA_TOMADOS AS (
SELECT MID, NOMBRE, COUNT(SERVICIOSPA) AS SERVICIOSTOMADOS 
FROM TOMASERVICIOSPA JOIN MASCOTAS ON MASCOTAS.MID = TOMASERVICIOSPA.MASCOTAID 
GROUP BY MID,NOMBRE);

-- Esta vista nos brinda la informacion basica de las mascotas

CREATE OR REPLACE VIEW INFO_MASCOTAS AS(
SELECT nombre, fechaNacimiento, peso, claseAnimal
FROM MASCOTAS JOIN HISTORIAS ON MASCOTAS.MID = HISTORIAS.MID);

-- Esta vista nos da el detalle de cada uno de los servicios medicos que estan pendientes por atender

CREATE OR REPLACE VIEW PENDIENTES_MEDICOS AS(
SELECT * FROM  SERVICIOSMEDICOS WHERE ESTADO = 'Pendiente'
);

-- Esta vista nos da el detalle de cada uno de los servicios de Spa que estan pendientes por atender

CREATE OR REPLACE VIEW PENDIENTES_MEDICOS AS(
SELECT * FROM  SERVICIOSMEDICOS WHERE ESTADO = 'Pendiente'
);

-- INDICES

-- Indice para la tabla Mascotas

CREATE INDEX INDEX_MASCOTAS ON MASCOTAS(NOMBRE);

-- Indice para la tabla Responsables

CREATE INDEX INDEX_RESPONSABLES ON RESPONSABLES(EMAIL);

-- Indice para la tabla Especialidades

CREATE INDEX INDEX_ESPECIALIDADES ON ESPECIALIDADES(ESPECIALIDAD);

-- Indice para la tabla ServiciosMedicos

CREATE INDEX INDEX_SERVICIOS_MEDICOS ON SERVICIOSMEDICOS(TIPOSERVICIO);

-- Indice para la tabla ServiciosSpa

CREATE INDEX INDEX_SERVICIOS_SPA ON SERVICIOSSPA(TIPOSPA);
