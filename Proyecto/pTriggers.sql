--REGISTRAR SERVICIO SPA

-- El ID y la fecha del servicio se generan automaticamente
CREATE OR REPLACE TRIGGER ADICION_SERVICIOSSPA
BEFORE INSERT ON ServiciosSpa
FOR EACH ROW
DECLARE
actual NUMBER;
BEGIN
    SELECT COUNT(*) INTO actual FROM ServiciosSpa;
    :NEW.SSID := actual+1;
    :NEW.fecha := SYSDATE;
END ADICION_SERVICIOSSPA;
/

-- El costo del servicio Spa no se puede modificar, tampoco su ID
CREATE OR REPLACE TRIGGER MODIFICAR_SERVICIOSSPA
BEFORE UPDATE ON ServiciosSpa
FOR EACH ROW
BEGIN
    :NEW.SSID := :OLD.SSID;
    :NEW.costo := :OLD.costo;
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

-- El ID y la fecha del servicio se generan automaticamente, además se asignan automaticamente el costo a cada tipo de servicio
CREATE OR REPLACE TRIGGER ADICION_SERVICIOSMEDICOS
BEFORE INSERT ON ServiciosMedicos
FOR EACH ROW
DECLARE
actual NUMBER;
BEGIN
    SELECT COUNT(*) INTO actual FROM ServiciosMedicos;
    :NEW.SMID := actual+1;
    :NEW.fecha := SYSDATE;
    IF :NEW.tipoServicio = 'Consulta' THEN 
    :NEW.costo := 20000;
    ELSIF :NEW.tipoServicio = 'Cirugia' THEN 
    :NEW.costo := 210000;
    ELSIF :NEW.tipoServicio = 'Hospitalizacion' THEN 
    :NEW.costo := 120000;
    ELSIF :NEW.tipoServicio = 'Imagen Diagnostica' THEN 
    :NEW.costo := 15000;
    ELSIF :NEW.tipoServicio = 'Odontologia' THEN 
    :NEW.costo := 210000;
    END IF;
END ADICION_SERVICIOMEDICOS;
/
-- El costo del servicio Médico no se puede modificar, tampoco su ID

CREATE OR REPLACE TRIGGER MODIFICAR_SERVICIOSMEDICOS
BEFORE UPDATE ON ServiciosMedicos
FOR EACH ROW
BEGIN
    :NEW.SMID := :OLD.SMID;
    :NEW.costo := :OLD.costo;
END MODIFICAR_SERVICIOSMEDICOS;
/

CREATE OR REPLACE TRIGGER ELIMINAR_SERVICIOSMEDICOS
BEFORE DELETE ON ServiciosMedicos
FOR EACH ROW
BEGIN
    IF :OLD.estado = 'Despachado' THEN
    Raise_Application_Error (-20001, 'El servicio ya fue despachado, no puede ser cancelado');
    END IF;
END ELIMINAR_SERVICIOSMEDICOS;
/