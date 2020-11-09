-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Diesel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Diesel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Diesel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Diesel` ;

-- -----------------------------------------------------
-- Table `Diesel`.`Ubicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Ubicaciones` (
  `IdUbicacion` INT NOT NULL AUTO_INCREMENT,
  `LugarUbicacion` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`IdUbicacion`),
  UNIQUE INDEX `LugarUbicacion` (`LugarUbicacion` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Usuarios` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Username` VARCHAR(25) NOT NULL,
  `Contrasena` VARCHAR(256) NOT NULL,
  `IdUbicacion` INT NOT NULL,
  `Permisos` CHAR(3) NOT NULL DEFAULT 'rw-',
  PRIMARY KEY (`IdUsuario`),
  UNIQUE INDEX `Username` (`Username` ASC) VISIBLE,
  INDEX `IdUbicacion` (`IdUbicacion` ASC) VISIBLE,
  CONSTRAINT `FK_Usuarios_Ubicaciones`
    FOREIGN KEY (`IdUbicacion`)
    REFERENCES `Diesel`.`Ubicaciones` (`IdUbicacion`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`AuditLogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`AuditLogs` (
  `IdLog` INT NOT NULL AUTO_INCREMENT,
  `IdUsuario` INT NOT NULL,
  `FechaHora` DATETIME NOT NULL,
  `Observacion` TEXT NOT NULL,
  PRIMARY KEY (`IdLog`),
  INDEX `IdUsuario` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `AuditLogs_ibfk_1`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `Diesel`.`Usuarios` (`IdUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Autorizan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Autorizan` (
  `IdAutoriza` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Observacion` TEXT NULL DEFAULT NULL,
  `IdUbicacion` INT NOT NULL,
  PRIMARY KEY (`IdAutoriza`),
  INDEX `IdUbicacion` (`IdUbicacion` ASC) VISIBLE,
  CONSTRAINT `Autorizan_ibfk_1`
    FOREIGN KEY (`IdUbicacion`)
    REFERENCES `Diesel`.`Ubicaciones` (`IdUbicacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Bombas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Bombas` (
  `IdBomba` INT NOT NULL AUTO_INCREMENT,
  `Bomba` VARCHAR(25) NOT NULL,
  `IdUbicacion` INT NOT NULL,
  PRIMARY KEY (`IdBomba`),
  INDEX `IdUbicacion` (`IdUbicacion` ASC) VISIBLE,
  CONSTRAINT `Bombas_ibfk_2`
    FOREIGN KEY (`IdUbicacion`)
    REFERENCES `Diesel`.`Ubicaciones` (`IdUbicacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Bomberos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Bomberos` (
  `IdBombero` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(25) NULL DEFAULT NULL,
  `Apellido` VARCHAR(25) NOT NULL,
  `Observacion` TEXT NULL DEFAULT NULL,
  `IdBomba` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdBombero`),
  INDEX `IdBomba` (`IdBomba` ASC) VISIBLE,
  CONSTRAINT `Bomberos_ibfk_1`
    FOREIGN KEY (`IdBomba`)
    REFERENCES `Diesel`.`Bombas` (`IdBomba`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Cierres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Cierres` (
  `Fecha` DATE NOT NULL,
  `IdUbicacion` INT NOT NULL,
  `CantInicial` FLOAT NOT NULL DEFAULT '0',
  `CantFinal` FLOAT NOT NULL DEFAULT '0',
  `Observacion` TEXT NULL DEFAULT NULL,
  `Cerrado` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Fecha`, `IdUbicacion`),
  UNIQUE INDEX `Fecha` (`Fecha` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Transportistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Transportistas` (
  `RTN` CHAR(14) NOT NULL,
  `Nombre` VARCHAR(25) NOT NULL,
  `Apellido` VARCHAR(25) NOT NULL,
  `Observacion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`RTN`),
  INDEX `Nombre` (`Nombre` ASC, `Apellido` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Motoristas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Motoristas` (
  `IdMotorista` CHAR(13) NOT NULL,
  `Nombre` VARCHAR(25) NOT NULL,
  `Apellido` VARCHAR(25) NOT NULL,
  `Observacion` TEXT NULL DEFAULT NULL,
  `RTN_TRANSPORTISTA` CHAR(14) NOT NULL,
  PRIMARY KEY (`IdMotorista`),
  INDEX `RTN_TRANSPORTISTA` (`RTN_TRANSPORTISTA` ASC) VISIBLE,
  INDEX `IdxMotoristas_Transportistas` (`IdMotorista` ASC, `RTN_TRANSPORTISTA` ASC) VISIBLE,
  CONSTRAINT `FK_Motoristas_Transportistas`
    FOREIGN KEY (`RTN_TRANSPORTISTA`)
    REFERENCES `Diesel`.`Transportistas` (`RTN`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Entradas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Entradas` (
  `IdEntrada` INT NOT NULL,
  `IdUbicacion` INT NOT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `IdMotorista` CHAR(13) NOT NULL,
  `Cantidad` FLOAT NOT NULL,
  `Observaciones` TEXT NOT NULL,
  `HoraLlegada` TIME NOT NULL,
  `Existencia` FLOAT NOT NULL,
  PRIMARY KEY (`IdEntrada`, `IdUbicacion`),
  INDEX `IdMotorista` (`IdMotorista` ASC) VISIBLE,
  INDEX `FK_ENTRADAS_CIERRES` (`Fecha` ASC) VISIBLE,
  CONSTRAINT `FK_ENTRADAS_CIERRES`
    FOREIGN KEY (`Fecha`)
    REFERENCES `Diesel`.`Cierres` (`Fecha`),
  CONSTRAINT `FK_Entradas_Motoristas`
    FOREIGN KEY (`IdMotorista`)
    REFERENCES `Diesel`.`Motoristas` (`IdMotorista`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Marcas` (
  `IdMarca` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdMarca`),
  UNIQUE INDEX `Marca` (`Marca` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`TiposSalidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`TiposSalidas` (
  `IdTipoSalida` INT NOT NULL AUTO_INCREMENT,
  `TipoSalida` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  PRIMARY KEY (`IdTipoSalida`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`TiposVehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`TiposVehiculos` (
  `IdTipo` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdTipo`),
  UNIQUE INDEX `Tipo` (`Tipo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Vehiculos` (
  `Placa` VARCHAR(7) NOT NULL,
  `IdMarca` INT NOT NULL,
  `IdTipo` INT NOT NULL,
  `Observacion` TEXT NOT NULL,
  `IdMotorista` CHAR(13) NOT NULL,
  PRIMARY KEY (`Placa`),
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC) VISIBLE,
  INDEX `IdMotorista` (`IdMotorista` ASC) VISIBLE,
  INDEX `IdMarca` (`IdMarca` ASC) VISIBLE,
  INDEX `IdTipo` (`IdTipo` ASC) VISIBLE,
  INDEX `IdxVehiculos` (`Placa` ASC) VISIBLE,
  CONSTRAINT `FK_Vehiculos_Marcas`
    FOREIGN KEY (`IdMarca`)
    REFERENCES `Diesel`.`Marcas` (`IdMarca`),
  CONSTRAINT `FK_Vehiculos_Motristas`
    FOREIGN KEY (`IdMotorista`)
    REFERENCES `Diesel`.`Motoristas` (`IdMotorista`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_Vehiculos_TiposVehiculos`
    FOREIGN KEY (`IdTipo`)
    REFERENCES `Diesel`.`TiposVehiculos` (`IdTipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Diesel`.`Ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`Ordenes` (
  `IdOrden` INT NOT NULL AUTO_INCREMENT,
  `IdUbicacion` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `IdAutoriza` INT NOT NULL,
  `IdBomba` INT NOT NULL,
  `Placa` CHAR(7) NOT NULL,
  `IdTemporada` INT NOT NULL,
  `Boleta` VARCHAR(12) NOT NULL,
  `Contenedor` CHAR(11) NULL DEFAULT '---',
  `Chasis` VARCHAR(10) NULL DEFAULT '---',
  `Planta` VARCHAR(15) NULL DEFAULT '---',
  `IdTipoSalida` INT NOT NULL,
  `IdBombero` INT NOT NULL,
  `Galones` FLOAT NOT NULL,
  `Descripcion` TEXT NULL DEFAULT NULL,
  `Kilometraje` INT NULL DEFAULT '0',
  `Impresa` TINYINT(1) NOT NULL DEFAULT '0',
  `Anulada` TINYINT(1) NOT NULL DEFAULT '0',
  `CxC` TINYINT(1) NOT NULL DEFAULT '0',
  `Existencia` FLOAT NOT NULL,
  `Reimpresion` TINYINT(1) NOT NULL DEFAULT '0',
  `GalonesAnulados` FLOAT NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdOrden`, `Fecha`, `IdUbicacion`),
  INDEX `IdTipoSalida` (`IdTipoSalida` ASC) VISIBLE,
  INDEX `Fecha` (`Fecha` ASC) VISIBLE,
  INDEX `IdBomba` (`IdBomba` ASC) VISIBLE,
  INDEX `Placa` (`Placa` ASC) VISIBLE,
  INDEX `IdAutoriza` (`IdAutoriza` ASC) VISIBLE,
  INDEX `FK_Ordenes_Bomberos_idx` (`IdBombero` ASC) VISIBLE,
  INDEX `FK_Ordenes_Ubicacion_idx` (`IdUbicacion` ASC) VISIBLE,
  CONSTRAINT `FK_Ordenes_Autorizan`
    FOREIGN KEY (`IdAutoriza`)
    REFERENCES `Diesel`.`Autorizan` (`IdAutoriza`)
    ON UPDATE RESTRICT,
  CONSTRAINT `FK_Ordenes_Bomberos`
    FOREIGN KEY (`IdBombero`)
    REFERENCES `Diesel`.`Bomberos` (`IdBombero`),
  CONSTRAINT `FK_Ordenes_Cierres`
    FOREIGN KEY (`Fecha`)
    REFERENCES `Diesel`.`Cierres` (`Fecha`),
  CONSTRAINT `FK_Ordenes_TiposSalidas`
    FOREIGN KEY (`IdTipoSalida`)
    REFERENCES `Diesel`.`TiposSalidas` (`IdTipoSalida`),
  CONSTRAINT `FK_Ordenes_Ubicaciones`
    FOREIGN KEY (`IdUbicacion`)
    REFERENCES `Diesel`.`Ubicaciones` (`IdUbicacion`),
  CONSTRAINT `FK_Ordenes_Vehiculos`
    FOREIGN KEY (`Placa`)
    REFERENCES `Diesel`.`Vehiculos` (`Placa`),
  CONSTRAINT `FK_OrdenesBombas`
    FOREIGN KEY (`IdBomba`)
    REFERENCES `Diesel`.`Bombas` (`IdBomba`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `Diesel` ;

-- -----------------------------------------------------
-- Placeholder table for view `Diesel`.`V_AuditLogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`V_AuditLogs` (`IdLog` INT, `Usuario` INT, `Fecha y Hora de Acción` INT, `Observacion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Diesel`.`V_Vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Diesel`.`V_Vehiculos` (`PLACA` INT, `MARCA` INT, `TIPO DE VEHICULO` INT, `MOTORISTA` INT, `TRANSPORTISTA` INT, `Observacion` INT);

-- -----------------------------------------------------
-- procedure GetCorrelativo
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCorrelativo`(IN ubi int, OUT id int)
BEGIN
DECLARE idOrd INT;
SELECT max(IdOrden) INTO idOrd FROM Ordenes WHERE IdUbicacion = ubi;
IF idOrd = 0 THEN
	SET idOrd = 1;
ELSE
	set idOrd = idOrd + 1;
END IF;
SET id = idOrd;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgAutoriza
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgAutoriza`(IN N VARCHAR(50), IN OBS TEXT, IN IDUB INT)
BEGIN
	INSERT INTO Autorizan (Nombre,Observacion,IdUbicacion) VALUES (N,OBS,IDUB);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgBomba
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgBomba`(IN B VARCHAR(25), IN IDE INT, IN IDUB INT)
BEGIN
	INSERT INTO Bombas (Bomba, IdEmpresa, IdUbicacion) VALUES (B,IDE,IDUB);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgBombero
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgBombero`(IN N VARCHAR(25), IN A VARCHAR(25), IN O TEXT, IN IDB INT)
BEGIN
	INSERT INTO Bomberos (Nombre, Apellido, Observacion, IdBomba) VALUES (N,A,O,IDB);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgCierre
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgCierre`(IN F DATE, IN IdUbi INT, IN ci FLOAT, IN cf FLOAT, IN obs TEXT)
BEGIN
	INSERT INTO Cierres (Fecha,IdUbicacion,CantInicial,CantFinal,Observacion) VALUES (F,IdUbi,ci,cf,obs);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgEntrada
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgEntrada`(IN IdUbi INT, IN IdMot INT, IN Cant FLOAT, IN OBS TEXT, IN HL TIME, IN Ex FLOAT, IN F DATE)
BEGIN
	INSERT INTO Entradas(IdUbicacion,IdMotorista,Cantidad,Observacion,HoraLlegada,Existecia,Fecha) VALUES (IdUbi,IdMot,Cant,Obs,HL,Ex,F);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgMarca
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgMarca`(IN Marca varchar(50))
BEGIN
	Insert into Marcas (Marca) Values (Marca);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgMotorista
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgMotorista`(IN Id char(13), IN Nombre varchar(25), IN Apellido varchar(25), IN Obs TEXT, IN RTNTrans char(14))
BEGIN
	Insert into Motoristas (IdMotorista,Nombre,Apellido,Observacion,RTN_Transportista) Values (Id,Nombre,Apellido,Obs,RTNTrans);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgOrden
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgOrden`(IN IDU INT, IN F DATE, IN IDA INT, IN IDB INT, IN P CHAR(7), 
IN IDT INT, IN B VARCHAR(12),IN C CHAR(11), IN CH VARCHAR(10), IN PL VARCHAR(15), IN IDTS INT, IN IDBO INT, IN G FLOAT,
IN DES TEXT, IN KMT INT, IN IMP BOOL, IN ANUL BOOL, IN CXC BOOL, IN EX FLOAT, IN R BOOL)
BEGIN
	INSERT INTO Ordenes (IdUbicacion,Fecha,IdAutoriza,IdBomba,Placa,IdTemporada,Boleta,Contenedor,Chasis,Planta,IdTipoSalida,
	IdBombero,Galones,Descripcion,Kilometraje,Impresa,Anulada,CxC,Existencia,Reimpresion)
    VALUES (IDU,F,IDA,IDB,P,IDT,B,C,CH,PL,IDTS,IDBO,G,DES,KMT,IMP,ANUL,CXC,EX,R);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgTemporada
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTemporada`(IN T VARCHAR(20))
BEGIN
	INSERT INTO Temporadas (Temporada) VALUES (T);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgTipoSalida
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTipoSalida`(IN TIPO VARCHAR(30))
BEGIN
	INSERT INTO TiposSalidas (TipoSalida) VALUES (TIPO);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgTipoVehiculo
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTipoVehiculo`(IN T VARCHAR(50))
BEGIN
	INSERT INTO TiposVehiculos (Tipo) VALUES (T);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgTransportista
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTransportista`(IN rtn char(14), IN Nombre varchar(25), IN Apellido varchar(25), IN Obs TEXT)
BEGIN
	Insert into Transportistas (RTN,Nombre,Apellido,Observacion) Values (Rtn,Nombre,Apellido,Obs);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgUbicacion
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgUbicacion`(IN U VARCHAR(35))
BEGIN
	INSERT INTO Ubicaciones (LugarUbicacion) VALUES (U);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgUsuario`(IN Nombre VARCHAR(50), IN Username VARCHAR(25), IN Pass VARCHAR(256), IN IdUbic INT, Permi char(3))
BEGIN
	INSERT INTO Usuarios (Nombre,Username,Contrasena,IdUbicacion,Permisos) Values (Nombre,Username,Pass,IdUbic,Permi);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_AgVehiculo
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgVehiculo`(IN PLACA CHAR(7), IN IDM INT, IN IDT INT, IN OBS TEXT, IN IDMOT CHAR(13))
BEGIN
	INSERT INTO Vehiculos (Placa,IdMarca,IdTipo,Observacion,IdMotorista)
    VALUES (PLACA,IDM,IDT,OBS,IDMOT);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ModCierre
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModCierre`(IN F DATE, IN IDUBI INT, IN CF FLOAT, IN C BOOL)
BEGIN
	UPDATE Cierres SET CantFinal=CF, Cerrado = C WHERE Fecha = F AND IdUbicacion = IDUBI;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ModEntrada
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModEntrada`(IN Id INT,IN IdUbi INT, IN IdMot INT, IN Cant FLOAT, IN OBS TEXT, IN HL TIME, IN Ex FLOAT, IN F DATE)
BEGIN
	UPDATE Entradas
    SET IdUbicacion=IdUbi, 
    IdMotorista=IdMot, 
    Cantidad=Cant, 
    Observacion=Obs, 
    HoraLlegada=HL, 
    Existecia=Ex
    WHERE IdEntrada = Id AND IdUbicacion = IdUbi AND Fecha = F;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ModMotorista
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
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

-- -----------------------------------------------------
-- procedure SP_ModTipoVehiculo
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModTipoVehiculo`(IN Id INT, IN T VARCHAR(50))
BEGIN
	UPDATE TiposVehiculos SET Tipo=T WHERE IdTipo=Id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ModTransportista
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
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

-- -----------------------------------------------------
-- procedure SP_ModUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModUsuario`(IN Id INT, IN Nom VARCHAR(50), IN Uname VARCHAR(25), IN Pass VARCHAR(256), IN IdUbic INT)
BEGIN
	UPDATE Usuarios SET
    Nombre = Nom,
    Username = Uname,
    Contrasena = Pass,
    IdUbicacion = IdUbic
    WHERE IdUsuario = Id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ModVehiculo
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
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

-- -----------------------------------------------------
-- procedure SP_VerCorrelativo
-- -----------------------------------------------------

DELIMITER $$
USE `Diesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VerCorrelativo`(OUT cor INT)
BEGIN
	DECLARE correlativo INT;
    
    Select last IdAutoriza into correlativo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `Diesel`.`V_AuditLogs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Diesel`.`V_AuditLogs`;
USE `Diesel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Diesel`.`V_AuditLogs` AS select `Diesel`.`AuditLogs`.`IdLog` AS `IdLog`,`Diesel`.`Usuarios`.`Nombre` AS `Usuario`,`Diesel`.`AuditLogs`.`FechaHora` AS `Fecha y Hora de Acción`,`Diesel`.`AuditLogs`.`Observacion` AS `Observacion` from (`Diesel`.`AuditLogs` join `Diesel`.`Usuarios` on((`Diesel`.`Usuarios`.`IdUsuario` = `Diesel`.`AuditLogs`.`IdUsuario`)));

-- -----------------------------------------------------
-- View `Diesel`.`V_Vehiculos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Diesel`.`V_Vehiculos`;
USE `Diesel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Diesel`.`V_Vehiculos` AS select `V`.`Placa` AS `PLACA`,`M`.`Marca` AS `MARCA`,`TV`.`Tipo` AS `TIPO DE VEHICULO`,concat(`MOT`.`Nombre`,' ',`MOT`.`Apellido`) AS `MOTORISTA`,concat(`TR`.`Nombre`,' ',`TR`.`Apellido`) AS `TRANSPORTISTA`,`V`.`Observacion` AS `Observacion` from ((((`Diesel`.`Vehiculos` `V` join `Diesel`.`Marcas` `M` on((`V`.`IdMarca` = `M`.`IdMarca`))) join `Diesel`.`TiposVehiculos` `TV` on((`V`.`IdTipo` = `TV`.`IdTipo`))) join `Diesel`.`Motoristas` `MOT` on((`V`.`IdMotorista` = `MOT`.`IdMotorista`))) join `Diesel`.`Transportistas` `TR` on((`MOT`.`RTN_TRANSPORTISTA` = `TR`.`RTN`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
