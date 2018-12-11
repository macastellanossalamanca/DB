-- Paquetes

-- Paquete para mascotas

CREATE OR REPLACE PACKAGE PC_MASCOTAS IS

    PROCEDURE AD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    PROCEDURE MOD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    PROCEDURE AD_HISTORIAS (XhID IN number, XmID IN number, Xraza IN varchar, Xalergias IN varchar, XfechaNacimiento IN Date, XclaseAnimal IN varchar, Xsexo IN varchar, Xpeso IN number);
    PROCEDURE MOD_HISTORIAS (XhID IN number, Xalergias IN varchar, Xpeso IN number);
    
    FUNCTION CO_MASCOTA (xRESPONSABLETID in VARCHAR, xRESPONSABLENUMID IN NUMBER) return SYS_REFCURSOR;
END;
/

-- Paquete para Servicios Medicos

CREATE OR REPLACE PACKAGE PC_SERVICIOSMEDICOS IS

    PROCEDURE AD_SERVICIOSMEDICOS (XtipoServicio IN varchar, Xcosto in number, XveterinarioTID in varchar, XveterinarioNumID in number, Xestado in varchar);
    PROCEDURE AD_TOMA_SERVICIOMEDICO(XSMID IN NUMBER, XMID IN NUMBER);
    PROCEDURE EL_SERVICIOSMEDICOS (XSMID number);
    
    FUNCTION CO_SERVICIOSMEDICOS (XMID IN NUMBER) return SYS_REFCURSOR;
END;
/

-- Paquete para Servicios SPA

CREATE OR REPLACE PACKAGE PC_SERVICIOSSPA IS

    PROCEDURE AD_SERVICIOSSPA (XtipoSpa IN varchar, Xcosto IN number,Xestado IN varchar, Xfecha IN Date);
    PROCEDURE AD_TOMA_SERVICIOSPA(XSSID IN NUMBER, XMID IN NUMBER);
    PROCEDURE EL_SERVICIOSSPA (XSSID number);
    
    FUNCTION CO_SERVICIOSSPA (XMID IN NUMBER) return SYS_REFCURSOR;
END;
/

-- Paquete para Empleados de la clinica

CREATE OR REPLACE PACKAGE PC_EMPLEADOS IS

    PROCEDURE AD_EMPLEADOS (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN number, xsalario in number, xemail IN varchar);
    PROCEDURE MOD_EMPLEADOS(XtID IN varchar, XnumID IN number,Xsalario IN NUMBER);
    PROCEDURE EL_EMPLEADOS (XtID IN varchar, XnumID IN number);
    
END;
/

-- Paquete para Responsables por las mascotas

CREATE OR REPLACE PACKAGE PC_RESPONSABLES IS

    PROCEDURE AD_RESPONSABLES (XtID IN varchar, XnumID IN number, Xnombre IN varchar, XnumTelefono IN number, Xsalario in number, Xemail IN varchar);
    PROCEDURE EL_RESPONSABLES (XtID IN varchar, XnumID IN number);
    
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

