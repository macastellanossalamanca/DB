/* Creacion de Tablas
*/

Create TABLE Mascotas (
mID NUMBER not null, 
nombre varchar(100) not null, 
raza varchar(100) not null, 
edad number not null);

Create TABLE ServiciosSpa (
SSID NUMBER not null, 
costo number not null,
estado varchar(50));

Create Table Baños(
BID NUMBER not null, 
costo number not null);

Create Table Productos (
PID number not null, 
costo number not null);

Create Table ProductosBaño(
bañoID number not null,
producto number not null);

Create Table Peluqueria(
PeID number not null, 
costo number not null);

Create Table ServiciosMedicos(
SMID number not null, 
tipoServicio varchar(100) not null, 
costo number not null, 
veterinarioTID varchar(50), 
veterinarioNumID number, 
estado varchar(50));

Create Table InsumosMedicos(
servicioMedico number not null, 
producto number not null);

Create Table TomaServicioMedico(
mascotaID number not null, 
servicioMedico number not null);

Create Table TomaServicioSpa(
mascotaID number not null, 
servicioSpa number not null);

Create Table Empleados(
tID varchar(50), 
numID number, 
nombre varchar(100), 
salario number);

Create Table Groomers(
tID varchar(50), 
numID number, 
nombre varchar(100), 
salario number);

Create Table Veterinarios(
tID varchar(50), 
numID number, 
nombre varchar(100), 
salario number);

Create Table Especialidades(
veterinarioTID varchar(50), 
veterinarioNumID number, 
especialidad varchar(50));


/* LLaves Primarias
*/

Alter Table Mascotas Add Constraint PK_Mascotas Primary Key(mID);
Alter Table ServiciosSpa Add Constraint PK_ServiciosSpa Primary Key(SSID,numID);
Alter Table Baños Add Constraint PK_Baños Primary Key(BID,numID);
Alter Table Productos Add Constraint PK_Productos Primary Key(PID,numID);
Alter Table ProductosBaño Add Constraint PK_ProductosBaño Primary Key(bañoID,producto);
Alter Table Peluqueria Add Constraint PK_Peluqueria Primary Key(PeID);
Alter Table ServiciosMedicos Add Constraint PK_ServiciosMedicos Primary Key(SMID);
Alter Table InsumosMedicos Add Constraint PK_InsumosMedicos Primary Key(servicioMedico, producto);
Alter Table TomaServicioMedico Add Constraint PK_TomaServicioMedico Primary Key(mascotaID, servicioMedico);
Alter Table TomaServicioSpa Add Constraint PK_TomaServicioSpa Primary Key(mascotaID, servicioSpa);
Alter Table Empleados Add Constraint PK_Empleados Primary Key(tID,numID);
Alter Table Groomers Add Constraint PK_Groomers Primary Key(tID,numID);
Alter Table Veterinarios Add Constraint PK_Veterinarios Primary Key(tID,numID);
Alter Table Especialidades Add Constraint PK_Especialidades Primary Key(veterinarioTID,veterinarioNumID,especialidad);

/* LLaves Foraneas 
*/

Alter Table Baños Add Constraint FK_Baños_ServiciosSpa Foreign Key(BID) references ServiciosSpa(SSID);
Alter Table Peluqueria Add Constraint FK_Peluqueria_ServiciosSpa Foreign Key(PeID) references ServiciosSpa(SSID);
Alter Table ProductosBaño Add Constraint FK_ProductosBaño_Baños Foreign Key(bañoID) references Baños(BID);
Alter Table ProductosBaño Add Constraint FK_ProductosBaño_Producto Foreign Key(producto) references Productos(PID);
Alter Table ServiciosMedicos Add Constraint FK_ServiciosMedicos_V Foreign Key(veterinarioTID,veterinarioNumID) references Veterinarios(tID,numID);
Alter Table InsumosMedicos Add Constraint FK_InsumosMedicos_S Foreign Key(servicioMedico) references ServiciosMedicos(SMID);
Alter Table InsumosMedicos Add Constraint FK_InsumosMedicos_Producto Foreign Key(producto) references Productos(PID);
Alter Table TomaServicioMedico Add Constraint FK_TomaServicioMedico_M Foreign Key(mascotaID) references Mascotas(mID);
Alter Table TomaServicioMedico Add Constraint FK_TomaServicioMedico_S Foreign Key(servicioMedico) references ServiciosMedicos(SMID);
Alter Table TomaServicioSpa Add Constraint FK_TomaServicioSpa_M Foreign Key(mascotaID) references Mascotas(mID);
Alter Table TomaServicioSpa Add Constraint FK_TomaServicioSpa_S Foreign Key(servicioSpa) references ServiciosSpa(SSID);
Alter Table Groomers Add Constraint FK_Groomers_Empleado Foreign Key(tID,numID) references Empleados(tID,numID);
Alter Table Veterinarios Add Constraint FK_Veterinarios_Empleado Foreign Key(tID,numID) references Empleados(tID,numID);
Alter Table Especialidades Add Constraint FK_Especialidades_V Foreign Key(veterinarioTID,veterinarioNumID) references Veterinarios(tID,numID);


/* Restricciones

REGISTRAR SERVICIO SPA
*/


CREATE OR REPLACE TRIGGER ADICION_SERVICIOSSPA
BEFORE INSERT ON ServiciosSpa
FOR EACH ROW
DECLARE
actual NUMBER;
BEGIN
    SELECT COUNT(*) INTO actual FROM ServiciosSpa;
    :NEW.SSID := actual+1;
END ADICION_SERVICIOSSPA;
/

CREATE OR REPLACE TRIGGER MODIFICAR_SERVICIOSSPA
BEFORE UPDATE ON ServiciosSpa
FOR EACH ROW
BEGIN
    :NEW.SSID := :OLD.SSID;
END MODIFICAR_SERVICIOSSPA;
/

CREATE OR REPLACE TRIGGER ELIMINAR_SERVICIOSSPA
BEFORE DELETE ON ServiciosSpa
FOR EACH ROW
BEGIN
    IF :OLD.estado = 'Despachado' THEN
    Raise_Application_Error (-20343, 'El servicio ya fue despachado, no puede ser cancelado');
    END IF;
END ELIMINAR_SERVICIOSSPA;
/
-- REGISTRAR SERVICIOS MEDICOS

CREATE OR REPLACE TRIGGER ADICION_SERVICIOSMEDICOS
BEFORE INSERT ON ServiciosMedicos
FOR EACH ROW
DECLARE
actual NUMBER;
BEGIN
    SELECT COUNT(*) INTO actual FROM ServiciosMedicos;
    :NEW.SMID := actual+1;
END ADICION_SERVICIOMEDICOS;
/

CREATE OR REPLACE TRIGGER MODIFICAR_SERVICIOSMEDICOS
BEFORE INSERT ON ServiciosMedicos
FOR EACH ROW
BEGIN
    :NEW.costo := :OLD.costo ;
END MODIFICAR_SERVICIOSMEDICOS;
/

CREATE OR REPLACE TRIGGER ELIMINAR_SERVICIOSMEDICOS
BEFORE DELETE ON ServiciosMedicos
FOR EACH ROW
BEGIN
    IF :OLD.estado = 'Despachado' THEN
    Raise_Application_Error (-203473, 'El servicio ya fue despachado, no puede ser cancelado');
    END IF;
END ELIMINAR_SERVICIOSMEDICOS;
/

/* Borrado total de la base de datos 
*/

insert into ServiciosSpa(SSID,costo,estado) values (2,100,'Pendiente');

select * from ServiciosSpa;

BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                    FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/