-- Paquetes

-- Paquete para mascotas

CREATE OR REPLACE PACKAGE BODY PC_MASCOTAS IS

    PROCEDURE AD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number) IS
        BEGIN
            INSERT INTO MASCOTAS (mID,nombre,responsableTID,responsableNUMID) VALUES(xmID,xnombre,xresponsabletID,xresponsableNumID);
            COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EN MASCOTAS');
    END AD_MASCOTAS;
    
    PROCEDURE MOD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number)IS 
    BEGIN
            UPDATE MASCOTAS SET nombre = xnombre,responsableTID=xresponsabletID,responsableNUMID=xresponsableNumID WHERE mID = xmID;
            COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO MODIFICAR EN MASCOTAS');
    END MOD_MASCOTAS;
    
    PROCEDURE AD_HISTORIAS (XhID IN number, XmID IN number, Xraza IN varchar, Xalergias IN varchar, XfechaNacimiento IN Date, XclaseAnimal IN varchar, Xsexo IN varchar, Xpeso IN number) IS
       BEGIN
            INSERT INTO HISTORIAS (hID, mID, raza, alergias, fechaNacimiento, claseAnimal, sexo, peso) VALUES(XhID, XmID, Xraza, Xalergias, XfechaNacimiento, XclaseAnimal, Xsexo, Xpeso);
            COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EN HISTORIAS');
    END AD_HISTORIAS;
    PROCEDURE MOD_HISTORIAS (XhID IN number, Xalergias IN varchar, Xpeso IN number) IS
    BEGIN
            UPDATE HISTORIAS SET alergias = Xalergias, peso= Xpeso;
            COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO MODIFICAR EN HISTORIAS');
    END MOD_HISTORIAS;
    
    FUNCTION CO_MASCOTA (xRESPONSABLETID in VARCHAR, xRESPONSABLENUMID IN NUMBER) RETURN SYS_REFCURSOR IS CO_MA SYS_REFCURSOR;
    BEGIN
		OPEN CO_MA  FOR
			SELECT * FROM MASCOTAS WHERE RESPONSABLETID = xRESPONSABLETID AND RESPONSABLENUMID = xRESPONSABLENUMID;
		RETURN CO_MA;
    END CO_MASCOTA;
END;
/

-- Paquete para Servicios Medicos

CREATE OR REPLACE PACKAGE BODY PC_SERVICIOSMEDICOS IS

    PROCEDURE AD_SERVICIOSMEDICOS (XtipoServicio IN varchar, Xcosto in number, XveterinarioTID in varchar, XveterinarioNumID in number, Xestado in varchar) IS
    BEGIN
    INSERT INTO SERVICIOSMEDICOS(tipoServicio,costo,veterinarioTID, veterinarioNumID, estado) VALUES(XtipoServicio, Xcosto, XveterinarioTID, XveterinarioNumID, Xestado);
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EN SERVICIOS MEDICOS');
    END;
    
    PROCEDURE AD_TOMA_SERVICIOMEDICO(XSMID IN NUMBER, XMID IN NUMBER) IS
    BEGIN
        INSERT INTO TOMASERVICIOMEDICO VALUES(XSMID,XMID);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EN TOMA SERVICIOS MEDICOS');
    END;
    
    PROCEDURE EL_SERVICIOSMEDICOS (XSMID number) IS
    BEGIN
    DELETE FROM TOMASERVICIOMEDICO WHERE SERVICIOMEDICO = XSMID;
    DELETE FROM SERVICIOSMEDICOS WHERE SMID = XSMID;
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO ELIMINAR SERVICIOS MEDICOS');
    END;
    
    FUNCTION CO_SERVICIOSMEDICOS (XMID IN NUMBER) return SYS_REFCURSOR IS CO_SE SYS_REFCURSOR;
    BEGIN
        OPEN CO_SE FOR
            SELECT * FROM SERVICIOSMEDICOS JOIN TOMASERVICIOMEDICO ON SERVICIOSMEDICOS.SMID = TOMASERVICIOMEDICO.SERVICIOMEDICO WHERE MASCOTAID = XMID;
        RETURN CO_SE;
    END;
END;
/

-- Paquete para Servicios SPA

CREATE OR REPLACE PACKAGE BODY PC_SERVICIOSSPA IS

    PROCEDURE AD_SERVICIOSSPA (XtipoSpa IN varchar, Xcosto IN number,Xestado IN varchar, Xfecha IN Date)IS
    BEGIN
    INSERT INTO SERVICIOSSPA(tipoSpa, costo,estado, fecha) VALUES(XtipoSpa, Xcosto,Xestado, Xfecha);
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EN SERVICIOS SPA');
    END;
    PROCEDURE AD_TOMA_SERVICIOSPA(XSSID IN NUMBER, XMID IN NUMBER) IS 
    BEGIN
        INSERT INTO TOMASERVICIOSPA VALUES(XSSID,XMID);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EN TOMA SERVICIOS SPA');
    END;
    PROCEDURE EL_SERVICIOSSPA (XSSID number) IS
    BEGIN
    DELETE FROM TOMASERVICIOSPA WHERE SERVICIOSPA = XSSID;
    DELETE FROM SERVICIOSSPA WHERE SSID = XSSID;
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO ELIMINAR SERVICIOS SPA');
    END;
    
    FUNCTION CO_SERVICIOSSPA (XMID IN NUMBER) return SYS_REFCURSOR IS CO_SPA SYS_REFCURSOR;
    BEGIN
        OPEN CO_SPA FOR
            SELECT * FROM SERVICIOSSPA JOIN TOMASERVICIOSPA ON SERVICIOSSPA.SSID = TOMASERVICIOSPA.SERVICIOSPA WHERE MASCOTAID = XMID;
        RETURN CO_SPA;
    END;
END;
/

-- Paquete para Empleados de la clinica

CREATE OR REPLACE PACKAGE BODY PC_EMPLEADOS IS

    PROCEDURE AD_EMPLEADOS (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN number, Xsalario in number,Xemail IN varchar) IS
    BEGIN
    INSERT INTO EMPLEADOS(tID, numID, nombre, numTelefono, salario,email) values(XtID, XnumID, Xnombre, XnumTelefono, Xsalario,Xemail);
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR EMPLEADOS');
    END;
    PROCEDURE MOD_EMPLEADOS(XtID IN varchar, XnumID IN number,Xsalario IN NUMBER) IS
    BEGIN
    UPDATE EMPLEADOS SET SALARIO = XSALARIO WHERE TID=XTID AND NUMID=XNUMID;
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO MODIFICAR EMPLEADOS');
    END;
    PROCEDURE EL_EMPLEADOS (XtID IN varchar, XnumID IN number) IS
    BEGIN
    DELETE FROM EMPLEADOS WHERE TID=XTID AND NUMID=XNUMID;
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO ELIMINAR EMPLEADOS');
    END;
    
END;
/

-- Paquete para Responsables por las mascotas

CREATE OR REPLACE PACKAGE BODY PC_RESPONSABLES IS

    PROCEDURE AD_RESPONSABLES (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN number, Xsalario in number, Xemail IN varchar) IS
    BEGIN
    INSERT INTO RESPONSABLES(tID, numID, nombre, numTelefono,email) values(XtID, XnumID, Xnombre, XnumTelefono,Xemail);
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR RESPONSABLES');
    END;
    PROCEDURE EL_RESPONSABLES (XtID IN varchar, XnumID IN number) IS
    BEGIN
    DELETE FROM RESPONSABLES WHERE TID=XTID AND NUMID=XNUMID;
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO ELIMINAR RESPONSABLES');
    END;
    
END;
/

-- Paquete para Productos
/*
CREATE OR REPLACE PACKAGE PC_PRODUCTOS IS

    PROCEDURE AD_PRODUCTOS (PID IN number, costo IN number, informacion IN XMLTYPE);
    PROCEDURE MOD_PRODUCTOS(PID IN number, costo IN number, informacion IN XMLTYPE);
    PROCEDURE EL_PRODUCTOS (PID IN number, costo IN number, informacion IN XMLTYPE);
    
    FUNCTION CO_PRODUCTOS return SYS_REFCURSOR;
END;
/