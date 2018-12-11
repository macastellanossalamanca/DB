

-- BODY DE PAQUETES DE USUARIOS


CREATE OR REPLACE PACKAGE BODY PA_EMPLEADO IS

    PROCEDURE AD_RESPONSABLES (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN number, Xemail IN varchar) IS
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


CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS

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
    PROCEDURE AD_ESPECIALIDAD(XtID IN varchar, XnumID IN number, xespecialidad in varchar) IS
    BEGIN
    insert into Especialidades (veterinariotID, veterinarioNumID, especialidad) values (XtID , XnumID, xespecialidad);
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR ESPECIALIDAD');
    END;
    PROCEDURE EL_ESPECIALIDAD(XtID IN varchar, XnumID IN number) IS
    BEGIN
    DELETE FROM Especialidades WHERE veterinariotID = XtID AND veterinarioNumID = XnumID;
    COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                raise_application_error(-20001, 'NO SE PUDO INSERTAR ESPECIALIDAD');
    END;

END;
/



GRANT EXECUTE ON PA_EMPLEADO TO EMPLEADO_CLINICA;
GRANT EXECUTE ON PC_SERVICIOSMEDICOS TO EMPLEADO_CLINICA;
GRANT EXECUTE ON PC_SERVICIOSSPA TO EMPLEADO_CLINICA;
GRANT EXECUTE ON PC_SERVICIOSMEDICOS TO ADMINISTRADOR_CLINICA;
GRANT EXECUTE ON PC_SERVICIOSSPA TO ADMINISTRADOR_CLINICA;
GRANT EXECUTE ON PA_ADMINISTRADOR TO ADMINISTRADOR_CLINICA;
GRANT EXECUTE ON PA_EMPLEADO TO ADMINISTRADOR_CLINICA;