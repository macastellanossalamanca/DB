/* LLaves Primarias
*/

Alter Table Mascotas Add Constraint PK_Mascotas Primary Key(mID);
Alter Table ServiciosSpa Add Constraint PK_ServiciosSpa Primary Key(SSID);
Alter Table Productos Add Constraint PK_Productos Primary Key(PID);
Alter Table ProductosBaño Add Constraint PK_ProductosBaño Primary Key(bañoID,producto);
Alter Table ServiciosMedicos Add Constraint PK_ServiciosMedicos Primary Key(SMID);
Alter Table InsumosMedicos Add Constraint PK_InsumosMedicos Primary Key(servicioMedico, producto);
Alter Table TomaServicioMedico Add Constraint PK_TomaServicioMedico Primary Key(mascotaID, servicioMedico);
Alter Table TomaServicioSpa Add Constraint PK_TomaServicioSpa Primary Key(mascotaID, servicioSpa);
Alter Table Empleados Add Constraint PK_Empleados Primary Key(tID,numID);
Alter Table Especialidades Add Constraint PK_Especialidades Primary Key(veterinarioTID,veterinarioNumID,especialidad);
Alter Table Historias Add Constraint PK_Historias Primary Key(hID);
Alter Table Responsables Add Constraint PK_Responsable Primary Key(tID,numID);
Alter Table Facturas Add Constraint PK_Factura Primary Key(fID);

/* LLaves Foraneas 
*/

Alter Table Mascotas Add Constraint FK_Mascotas_Responsable Foreign Key (responsabletID , responsableNumID) references Responsables(tID,numID);
Alter Table ProductosBaño Add Constraint FK_ProductosBaño_Baños Foreign Key(bañoID) references ServiciosSpa(SSID) on delete cascade;
Alter Table ProductosBaño Add Constraint FK_ProductosBaño_Producto Foreign Key(producto) references Productos(PID)on delete cascade;
Alter Table ServiciosMedicos Add Constraint FK_ServiciosMedicos_V Foreign Key(veterinarioTID,veterinarioNumID) references Empleados(tID,numID)on delete cascade;
Alter Table InsumosMedicos Add Constraint FK_InsumosMedicos_S Foreign Key(servicioMedico) references ServiciosMedicos(SMID)on delete cascade;
Alter Table InsumosMedicos Add Constraint FK_InsumosMedicos_Producto Foreign Key(producto) references Productos(PID)on delete cascade;
Alter Table TomaServicioMedico Add Constraint FK_TomaServicioMedico_M Foreign Key(mascotaID) references Mascotas(mID)on delete cascade;
Alter Table TomaServicioMedico Add Constraint FK_TomaServicioMedico_S Foreign Key(servicioMedico) references ServiciosMedicos(SMID)on delete cascade;
Alter Table TomaServicioSpa Add Constraint FK_TomaServicioSpa_M Foreign Key(mascotaID) references Mascotas(mID)on delete cascade;
Alter Table TomaServicioSpa Add Constraint FK_TomaServicioSpa_S Foreign Key(servicioSpa) references ServiciosSpa(SSID)on delete cascade;
Alter Table Especialidades Add Constraint FK_Especialidades_V Foreign Key(veterinarioTID,veterinarioNumID) references Empleados(tID,numID)on delete cascade;
Alter Table Historias Add Constraint FK_Historias_Mascota Foreign Key(mID) references Mascotas(mID)on delete cascade;
Alter Table Facturas Add Constraint FK_Factura_Responsable Foreign Key(responsabletID, responsableNumID) references Responsables(tID,numID)on delete cascade;