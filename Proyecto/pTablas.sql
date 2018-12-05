/* Creacion de Tablas
*/

Create TABLE Mascotas (mID NUMBER not null, nombre varchar(100) not null, responsabletID varchar(50), responsableNumID number);
Create TABLE ServiciosSpa (SSID NUMBER not null, tipoSpa varchar(50), costo number not null,estado varchar(50), fecha Date);
Create Table Productos (PID number not null, costo number not null);
Create Table ProductosBaño(bañoID number not null,producto number not null);
Create Table Empleados(tID varchar(50), numID number, nombre varchar(100), salario number,email varchar(100), numTelefono number);
Create Table ServiciosMedicos(SMID number not null, tipoServicio varchar(100) not null, costo number, veterinarioTID varchar(50), veterinarioNumID number, estado varchar(50), fecha Date);
Create Table InsumosMedicos(servicioMedico number not null, producto number not null);
Create Table TomaServicioMedico(mascotaID number not null, servicioMedico number not null);
Create Table TomaServicioSpa(mascotaID number not null, servicioSpa number not null);
Create Table Especialidades(veterinarioTID varchar(50), veterinarioNumID number, especialidad varchar(50));
Create Table Historias(hID number, mID number, raza varchar(100), alergias varchar(100), fechaNacimiento Date, claseAnimal varchar(50), sexo varchar(50), peso number);
Create Table Responsables(tID varchar(50), numID number, nombre varchar(50), numTelefono number, email varchar(50));
Create Table Facturas(fID number, responsabletID varchar(50), responsableNumID number, valor number, estado varchar(50));

