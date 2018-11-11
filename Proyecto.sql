/* Creacion de Tablas
*/

Create TABLE Mascotas (mID NUMBER not null, nombre varchar(100) not null, raza varchar(100) not null, edad number not null);
Create TABLE ServiciosSpa (SSID NUMBER not null, costo number not null);
Create Table Baños(BID NUMBER not null, costo number not null);
Create Table Productos (PID number not null, costo number not null);
Create Table ProductosBaño(bañoID number not null,producto number not null);
Create Table Peluqueria(PeID number not null, costo number not null);
Create Table ServiciosMedicos(SMID number not null, tipoServicio varchar(100) not null, costo number not null, veterinarioTID varchar(50), veterinarioNumID number);
Create Table InsumosMedicos(servicioMedico number not null, producto number not null);
Create Table TomaServicioMedico(mascotaID number not null, servicioMedico number not null);
Create Table TomaServicioSpa(mascotaID number not null, servicioSpa number not null);
Create Table Empleados(tID varchar(50), numID number, nombre varchar(100), salario number);
Create Table Groomers(tID varchar(50), numID number, nombre varchar(100), salario number);
Create Table Veterinarios(tID varchar(50), numID number, nombre varchar(100), salario number);
Create Table Especialidades(veterinarioTID varchar(50), veterinarioNumID number, especialidad varchar(50))


/* LLaves Primarias
*/

Alter Table Mascotas Add Constraint PK_Mascotas Primary Key(mID);
Alter Table ServiciosSpa Add Constraint PK_ServiciosSpa Primary Key(SSID);
Alter Table Baños Add Constraint PK_Baños Primary Key(BID);
Alter Table Productos Add Constraint PK_Productos Primary Key(PID);
Alter Table ProductosBaño Add Constraint PK_ProductosBaño Primary Key(bañoID,producto);
Alter Table Peluqueria Add Constraint PK_Peluqueria Primary Key(PeID);
Alter Table ServiciosMedicos Add Constraint PK_ServiciosMedicos Primary Key(SMID);
Alter Table InsumosMedicos Add Constraint PK_InsumosMedicos Primary Key(servicioMedico, producto);
Alter Table TomaServicioMedico Add Constraint PK_TomaServicioMedico Primary Key(mascotaID, servicioMedico);
Alter Table TomaServicioSpa Add Constraint PK_TomaServicioSpa Primary Key(mascotaID, servicioSpa);
Alter Table Empleados Add Constraint PK_Empleados Primary Key(tID);
Alter Table Groomers Add Constraint PK_Groomers Primary Key(tID);
Alter Table Veterinarios Add Constraint PK_Veterinarios Primary Key(tID);
Alter Table Especialidades Add Constraint PK_Especialidades Primary Key(veterinarioTID,veterinarioNumID,especialidad);

/* LLaves Foraneas 
*/

Alter Table Baños Add Constraint FK_Baños_ServiciosSpa Foreign Key(BID) references ServiciosSpa(SSID);
Alter Table Peluqueria Add Constraint FK_Peluqueria_ServiciosSpa Foreign Key(PeID) references ServiciosSpa(SSID);
Alter Table ProductosBaño Add Constraint FK_ProductosBaño_Baños Foreign Key(bañoID) references Baños(BID);
Alter Table ProductosBaño Add Constraint FK_ProductosBaño_Producto Foreign Key(producto) references Productos(PID);
Alter Table ServiciosMedicos Add Constraint FK_ServiciosMedicos_Veterinario Foreign Key(veterinarioTID,veterinarioNumID) references Veterinarios(tID,numID);
Alter Table InsumosMedicos Add Constraint FK_InsumosMedicos_ServicioMedico Foreign Key(servicioMedico) references ServiciosMedicos(SMID);
Alter Table InsumosMedicos Add Constraint FK_InsumosMedicos_Producto Foreign Key(producto) references Productos(PID);
Alter Table TomaServicioMedico Add Constraint FK_TomaServicioMedico_Mascota Foreign Key(mascota) references Mascotas(mID);
Alter Table TomaServicioMedico Add Constraint FK_TomaServicioMedico_servicioMedico Foreign Key(servicioMedico) references ServiciosMedicos(SMID);
Alter Table TomaServicioSpa Add Constraint FK_TomaServicioSpa_Mascota Foreign Key(mascota) references Mascotas(mID);
Alter Table TomaServicioSpa Add Constraint FK_TomaServicioSpa_ServicioSpa Foreign Key(servicioSpa) references ServiciosSpa(SSID);
Alter Table Groomers Add Constraint FK_Groomers_Empleado Foreign Key(tID) references Empleados(tID);
Alter Table Veterinarios Add Constraint FK_Veterinarios_Empleado Foreign Key(tID) references Empleados(tID);
Alter Table Especialidades Add Constraint FK_Especialidades_Veterinario Foreign Key(veterinarioTID,veterinarioNumID) references Veterinarios(tID,numID);


/* Restricciones
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

CREATE OR REPLACE TRIGGER ADICION_SERVICIOSSPA2
BEFORE INSERT ON ServiciosSpa
FOR EACH ROW
DECLARE
costos NUMBER;
BEGIN
    SELECT sum(costo) INTO actual FROM ProductosBaño where :NEW.SSID = ProductosBaño.bañoID;
    :NEW.costo := :NEW.costo + actual;
END ADICION_SERVICIOSSPA2;
/

CREATE OR REPLACE TRIGGER ADICION_SERVICIOSMEDICOS2
BEFORE INSERT ON ServiciosMedicos
FOR EACH ROW
DECLARE
costos NUMBER;
BEGIN
    SELECT sum(costo) INTO actual FROM InsumosMedicos where :NEW.SMID = InsumosMedicos.servicioMedico;
    :NEW.costo := :NEW.costo + actual;
END ADICION_SERVICIOSMEDICOS2;
/

/* Borrado total de la base de datos 
*/

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