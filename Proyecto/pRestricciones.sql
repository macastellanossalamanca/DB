/* Restricciones
*/


ALTER TABLE Responsables ADD Constraint CK_Responsable_numID CHECK (numID > 0);
ALTER TABLE Responsables ADD Constraint CK_Responsable_tID CHECK (tID = 'CC' OR tID = 'CE' or tID = 'TI');
ALTER TABLE Responsables ADD Constraint CK_Responsable_telefono CHECK (numTelefono > 0);
ALTER TABLE Responsables Add Constraint CK_Responsable_Correo Check(email like '%_@_%._%');

ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_numID CHECK (numID > 0);
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_salario CHECK (salario > 0);
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_telefono CHECK (numTelefono > 0);
ALTER TABLE Empleados ADD CONSTRAINT CK_Empleados_tID CHECK (tID = 'CC' OR tID = 'CE');
ALTER TABLE Empleados Add Constraint CK_Empleados_Correo Check(email like '%_@_%._%');

ALTER TABLE ServiciosMedicos Add Constraint CK_ServiciosMedicos Check(tipoServicio = 'Consulta' or tipoServicio = 'Cirugia' or tipoServicio = 'Imagen Diagnostica' or tipoServicio = 'Odontologia' or tipoServicio = 'Hospitalizacion');
ALTER TABLE ServiciosMedicos Add Constraint CK_ServiciosMedicos_Estado Check(estado = 'Pendiente' or estado = 'Despachado');
ALTER TABLE ServiciosSpa Add Constraint CK_ServiciosSpa Check (tipoSpa = 'Baño' or tipoSpa = 'Peluqueria');
ALTER TABLE ServiciosSpa Add Constraint CK_ServiciosSpa_Estado Check(estado = 'Pendiente' or estado = 'Despachado');

ALTER TABLE Historias ADD CONSTRAINT CK_Historias_ClaseAnimal CHECK (claseAnimal = 'Canino' OR claseAnimal = 'Felino' OR claseAnimal = 'Pez' OR claseAnimal = 'Roedor' OR claseAnimal = 'Ave');
ALTER TABLE Historias ADD CONSTRAINT CK_Historias_sexo CHECK (sexo = 'Macho' OR sexo = 'Hembra');
ALTER TABLE Historias ADD CONSTRAINT CK_Historias_peso CHECK (peso > 0 AND peso < 100);

ALTER TABLE Especialidades ADD CONSTRAINT CK_Especialidades_especialidad CHECK (especialidad = 'Caninos' OR especialidad = 'Felinos');