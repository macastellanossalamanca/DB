--Elimina los datos de cada tabla
/* Creacion de Tablas
*/

Delete from Mascotas;
Delete from ServiciosSpa;
Delete from Productos;
Delete from ProductosBaño;
Delete from Empleados;
Delete from ServiciosMedicos;
Delete from InsumosMedicos;
Delete from TomaServicioMedico;
Delete from TomaServicioSpa;
Delete from Especialidades;
Delete from Historias;
Delete from Responsables;
Delete from Facturas;



--Borrado de la base de datos
/*
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