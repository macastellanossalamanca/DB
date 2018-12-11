-- PRUEBA

-- Se abre una nueva tienda veterinaria, por lo que el propietario decide contratar 3 empleados

EXECUTE PA_ADMINISTRADOR.AD_EMPLEADOS ('CC', 552, 'Lutero', 9492341843, 800000,'lboffeyfb@nsw.gov.au');
EXECUTE PA_ADMINISTRADOR.AD_EMPLEADOS ('CC', 553, 'Hartwell',8173788134, 1000000, 'hantognozziifc@imgur.com');
EXECUTE PA_ADMINISTRADOR.AD_EMPLEADOS ('CC', 554, 'Brent', 9751401490, 1000000, 'bmooringfd@storify.com');

-- Dos de los usuarios eran veterinarios y uno era groomer, los veterinarios tenian las siguientes especialidades

EXECUTE PA_ADMINISTRADOR.AD_ESPECIALIDAD('CC', 552, 'Felinos');
EXECUTE PA_ADMINISTRADOR.AD_ESPECIALIDAD('CC', 553, 'General');

-- En su primer dia iniciaron recibiendo sus clientes, llegaron dos personas para tomar diferentes servicios en la clinica
-- por lo que se les pidio primero hacer su registro, con lo cual un empleado les iba a colaborar

EXECUTE pa_empleado.ad_responsables('CC', 1, 'Kerr', 5612476204, 'kridewood0@sourceforge.net');
EXECUTE pa_empleado.ad_responsables('CC', 2, 'Wilbur', 4491040584, 'whatto1@over-blog.com');

--luego se les pidio hacer el registro de sus mascotas a cada uno de los nuevos clientes

EXECUTE PA_EMPLEADO.AD_MASCOTAS(2, 'Janetta', 'CC', 1);
EXECUTE PA_EMPLEADO.AD_MASCOTAS(3, 'Valeda', 'CC', 2);

