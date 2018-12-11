----------ROLES------------------
CREATE ROLE EMPLEADO_CLINICA;
CREATE ROLE ADMINISTRADOR_CLINICA;
CREATE ROLE PROPIETARIO_CLINICA;

/*
DROP ROLE EMPLEADO_CLINICA;
DROP ROLE ADMINISTRADOR_CLINICA;
DROP ROLE PROPIETARIO_CLINICA;
*/
-- Paquete para Responsables por las mascotas

CREATE OR REPLACE PACKAGE PA_EMPLEADO IS

    PROCEDURE AD_RESPONSABLES (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN number, Xemail IN varchar);
    PROCEDURE EL_RESPONSABLES (XtID IN varchar, XnumID IN number);
    PROCEDURE AD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    PROCEDURE MOD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    PROCEDURE AD_HISTORIAS (XhID IN number, XmID IN number, Xraza IN varchar, Xalergias IN varchar, XfechaNacimiento IN Date, XclaseAnimal IN varchar, Xsexo IN varchar, Xpeso IN number);
    PROCEDURE MOD_HISTORIAS (XhID IN number, Xalergias IN varchar, Xpeso IN number);
    
    FUNCTION CO_MASCOTA (xRESPONSABLETID in VARCHAR, xRESPONSABLENUMID IN NUMBER) return SYS_REFCURSOR;


 
    
END;
/

CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS

    PROCEDURE AD_EMPLEADOS (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN NUMBER, xsalario in number, xemail IN varchar);
    PROCEDURE MOD_EMPLEADOS(XtID IN varchar, XnumID IN number,Xsalario IN NUMBER);
    PROCEDURE EL_EMPLEADOS (XtID IN varchar, XnumID IN number);
    PROCEDURE AD_ESPECIALIDAD(XtID IN varchar, XnumID IN number, xespecialidad in varchar);
    PROCEDURE el_ESPECIALIDAD(XtID IN varchar, XnumID IN number);

END;
/
    