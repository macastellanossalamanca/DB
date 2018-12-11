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

-- Despues de indicar al empleado el servicio que deseaban, se procede a guardar la informacion

EXECUTE pa_empleado.ad_historias(1, 2, 'Squirrel, palm', 'Ondansetron', '19/10/2018', 'Pez', 'Macho', 4);
EXECUTE pa_empleado.ad_historias(2, 3, 'Shelduck, european', 'Phenylephrine HCl', '12/3/2018', 'Ave', 'Macho', 17);

-- Se procede a agregar los servicios solicitados a la base de datos

EXECUTE pc_serviciosmedicos.ad_serviciosmedicos('Consulta', 10000, 'CC', 552, 'Pendiente');
EXECUTE pc_serviciosmedicos.ad_serviciosmedicos('Cirugia', 10000, 'CC', 552, 'Pendiente');

-- Se asigna cada servicio a cada mascota

EXECUTE pc_serviciosmedicos.ad_toma_serviciomedico(2,1);
EXECUTE pc_serviciosmedicos.ad_toma_serviciomedico(3,2);

-- Nuestros nuevos clientes despues de tomar el servicio generan un reporte con quejas sobre el veterinario Wilbur, 
--por lo que se toman medidas y debe dejar la veterinaria

execute pa_administrador.el_empleados('CC',2);
