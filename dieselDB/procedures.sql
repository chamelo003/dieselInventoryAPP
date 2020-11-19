DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgBombero`(IN N VARCHAR(25), IN A VARCHAR(25), IN O TEXT, IN IDB INT)
BEGIN
	INSERT INTO Bomberos (Nombre, Apellido, Observacion, IdBomba) VALUES (N,A,O,IDB);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgAutoriza`(IN `N` VARCHAR(50), IN `OBS` TEXT)
BEGIN
	INSERT INTO Autorizan (Nombre,Observacion) VALUES (N,OBS);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgCierre`(IN `F` DATE, IN `ci` FLOAT, IN `cf` FLOAT, IN `obs` TEXT)
BEGIN
	INSERT INTO Cierres (Fecha,CantInicial,CantFinal,Observacion) VALUES (F,ci,cf,obs);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgEntrada`(IN IdUbi INT, IN IdMot INT, IN Cant FLOAT, IN OBS TEXT, IN HL TIME, IN Ex FLOAT, IN F DATE)
BEGIN
	INSERT INTO Entradas(IdUbicacion,IdMotorista,Cantidad,Observacion,HoraLlegada,Existecia,Fecha) VALUES (IdUbi,IdMot,Cant,Obs,HL,Ex,F);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgMarca`(IN Marca varchar(50))
BEGIN
	Insert into Marcas (Marca) Values (Marca);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgMotorista`(IN Id char(13), IN Nombre varchar(25), IN Apellido varchar(25), IN Obs TEXT, IN RTNTrans char(14))
BEGIN
	Insert into Motoristas (IdMotorista,Nombre,Apellido,Observacion,RTN_Transportista) Values (Id,Nombre,Apellido,Obs,RTNTrans);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTipoSalida`(IN TIPO VARCHAR(30))
BEGIN
	INSERT INTO TiposSalidas (TipoSalida) VALUES (TIPO);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTipoVehiculo`(IN T VARCHAR(50))
BEGIN
	INSERT INTO TiposVehiculos (Tipo) VALUES (T);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTransportista`(IN rtn char(14), IN Nombre varchar(25), IN Apellido varchar(25), IN Obs TEXT)
BEGIN
	Insert into Transportistas (RTN,Nombre,Apellido,Observacion) Values (Rtn,Nombre,Apellido,Obs);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgUsuario`(IN `Nombre` VARCHAR(50), IN `Username` VARCHAR(25), IN `Pass` VARCHAR(256), IN `Permi` CHAR(3))
BEGIN
	INSERT INTO Usuarios (Nombre,Username,Contrasena,Permisos) Values (Nombre,Username,Pass,Permi);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgVehiculo`(IN PLACA CHAR(7), IN IDM INT, IN IDT INT, IN OBS TEXT, IN IDMOT CHAR(13))
BEGIN
	INSERT INTO Vehiculos (Placa,IdMarca,IdTipo,Observacion,IdMotorista)
    VALUES (PLACA,IDM,IDT,OBS,IDMOT);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModCierre`(IN `F` DATE, IN `CF` FLOAT, IN `C` INT)
BEGIN
	UPDATE Cierres SET CantFinal=CF, Cerrado = C WHERE Fecha = F;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModMotorista`(IN Id char(13), IN Nombre varchar(25), IN Apellido varchar(25), IN Obs TEXT, IN RTNTrans char(14))
BEGIN
	UPDATE Motoristas 
    SET IdMotorista = Id,
    Nombre = Nombre,
    Apellido = Apellido,
    Observacion = Obs,
    RTNTrans = RTNTrans
    WHERE Id = Id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModTipoVehiculo`(IN Id INT, IN T VARCHAR(50))
BEGIN
	UPDATE TiposVehiculos SET Tipo=T WHERE IdTipo=Id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModTransportista`(IN rtn char(14), IN Nombre varchar(25), IN Apellido varchar(25), IN Obs TEXT)
BEGIN
	UPDATE Transportistas 
    SET RTN = rtn,
    Nombre = Nombre,
    Apellido = Apellido,
    Observacion = Obs
    WHERE RTN = rtn;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModUsuario`(IN `Id` INT, IN `Nom` VARCHAR(50), IN `Uname` VARCHAR(25), IN `Pass` VARCHAR(256))
BEGIN
	UPDATE Usuarios SET
    Nombre = Nom,
    Username = Uname,
    Contrasena = Pass
    WHERE IdUsuario = Id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModVehiculo`(IN PLACA CHAR(7), IN IDM INT, IN IDT CHAR(13), IN OBS TEXT, IN IDMOT CHAR(13), IN IDINT INT)
BEGIN
	UPDATE Vehiculos SET
		Placa = PLACA,
        IdMarca = IDM,
        IdTipo = IDT,
        Observacion = OBS,
        IdMotorista = IDMOT
	WHERE IdInterno = IDINT;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModEntrada`(IN `Id` INT, IN `IdMot` INT, IN `Cant` FLOAT, IN `OBS` TEXT, IN `HL` TIME, IN `Ex` FLOAT, IN `F` DATE)
BEGIN
	UPDATE Entradas
    SET
    IdMotorista=IdMot, 
    Cantidad=Cant, 
    Observacion=Obs, 
    HoraLlegada=HL, 
    Existecia=Ex
    WHERE IdEntrada = Id AND Fecha = F;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgOrden`(IN `F` DATE, IN `IDA` INT, IN `IDB` INT, IN `P` CHAR(7), IN `B` VARCHAR(12), IN `C` CHAR(11), IN `CH` VARCHAR(10), IN `PL` VARCHAR(15), IN `IDTS` INT, IN `IDBO` INT, IN `G` FLOAT, IN `DES` TEXT, IN `KMT` INT, IN `IMP` INT, IN `ANUL` INT, IN `CXC` INT, IN `EX` FLOAT, IN `R` INT)
BEGIN
	INSERT INTO Ordenes (Fecha,IdAutoriza,IdBomba,Placa,IdTemporada,Boleta,Contenedor,Chasis,Planta,IdTipoSalida,
	IdBombero,Galones,Descripcion,Kilometraje,Impresa,Anulada,CxC,Existencia,Reimpresion)
    VALUES (F,IDA,IDB,P,B,C,CH,PL,IDTS,IDBO,G,DES,KMT,IMP,ANUL,CXC,EX,R);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgBomba`(IN `B` VARCHAR(25))
BEGIN
	INSERT INTO Bombas (Bomba) VALUES (B);
END$$
DELIMITER ;
