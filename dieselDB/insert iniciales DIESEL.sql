use Diesel;
INSERT INTO Marcas (IdMarca, Marca) VALUES
	(1, 'Toyota'),
	(2, 'Nissan'),
	(3, 'John Deere'),
	(4, 'Peterbilt'),
	(5, 'Isuzu'),
	(6, 'Mitsubishi'),
	(7, 'Mazda'),
	(8, 'Ford'),
	(9, 'Freightliner'),
	(10, 'Datsun'),
	(11, 'International'),
	(12, 'Mercedes Benz'),
	(13, 'Mack'),
	(14, 'Caterpillar'),
	(15, 'Kenworth'),
	(16, 'Honda'),
	(17, 'Volvo'),
	(18, 'Hyundai'),
	(19, 'Chevrolet'),
	(20, 'GMC'),
	(21, 'Kubota'),
	(22, 'Valtra'),
	(23, 'Grua Frontal Cortes'),
	(24, 'Cummins'),
	(25, 'Daihatsu'),
	(26, 'Massey Ferguson'),
	(27, 'Kia'),
	(28, 'Jeep');

INSERT INTO Ubicaciones (IdUbicacion, LugarUbicacion) VALUES
	(1, 'Cuarto Frio'),
	(2, 'San Lorenzo'),
	(3, 'Lavaderos'),
	(4, 'Santa Rosa'),
	(5, 'Ojo de Agua'),
	(6, 'La Granja');

-- Estructura de la tabla ID,Nombre,Usuario,Contraseña,Permisos
-- Los permisos de administrador deben ser 'rwx', para usuario simple mortal debe ser 'rw-'
INSERT INTO Usuarios VALUES (1, 'Administrador', 'admin', 'admin123', 1, 'rwx');
