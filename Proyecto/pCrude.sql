-- Paquetes

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
 






-- Paquete para Productos
/*
CREATE OR REPLACE PACKAGE PC_PRODUCTOS IS

    PROCEDURE AD_PRODUCTOS (PID IN number, costo IN number, informacion IN XMLTYPE);
    PROCEDURE MOD_PRODUCTOS(PID IN number, costo IN number, informacion IN XMLTYPE);
    PROCEDURE EL_PRODUCTOS (PID IN number, costo IN number, informacion IN XMLTYPE);
    
    FUNCTION CO_PRODUCTOS return SYS_REFCURSOR;
END;
/

