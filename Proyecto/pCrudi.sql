-- Paquetes

-- Paquete para mascotas

CREATE OR REPLACE PACKAGE PC_MASCOTAS IS

    PROCEDURE AD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    PROCEDURE MOD_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    PROCEDURE AD_HISTORIAS (XhID IN number, XmID IN number, Xraza IN varchar, Xalergias IN varchar, XfechaNacimiento IN Date, XclaseAnimal IN varchar, Xsexo IN varchar, Xpeso IN number);
    PROCEDURE MOD_HISTORIAS (XhID IN number, Xalergias IN varchar, Xpeso IN number);
    PROCEDURE EL_MASCOTAS (xmID in NUMBER, xnombre in varchar, xresponsabletID  in varchar, xresponsableNumID in number);
    
    FUNCTION CO_MASCOTA (xRESPONSABLETID in VARCHAR, xRESPONSABLENUMID IN NUMBER) return SYS_REFCURSOR;
END;
/

-- Paquete para Servicios Medicos

CREATE OR REPLACE PACKAGE PC_SERVICIOSMEDICOS IS

    PROCEDURE AD_SERVICIOSMEDICOS (XtipoServicio IN varchar, Xcosto in number, XveterinarioTID in varchar, XveterinarioNumID in number, Xestado in varchar);
    PROCEDURE MOD_SERVICIOSMEDICOS(XSMID in number, XtipoServicio in varchar, Xcosto number, XveterinarioTID in varchar, XveterinarioNumID number, Xestado IN varchar, Xfecha IN Date);
    PROCEDURE EL_SERVICIOSMEDICOS (XSMID number);
    
    FUNCTION CO_SERVICIOSMEDICOS (XMID IN NUMBER) return SYS_REFCURSOR;
END;
/

-- Paquete para Servicios SPA

CREATE OR REPLACE PACKAGE PC_SERVICIOSSPA IS

    PROCEDURE AD_SERVICIOSSPA (XtipoSpa IN varchar, Xcosto IN number,Xestado IN varchar, Xfecha IN Date);
    PROCEDURE MOD_SERVICIOSSPA(XtipoSpa IN varchar, Xcosto IN number,Xestado IN varchar, Xfecha IN Date);
    PROCEDURE EL_SERVICIOSSPA (XSSID number);
    
    FUNCTION CO_SERVICIOSSPA (XMID IN NUMBER) return SYS_REFCURSOR;
END;
/