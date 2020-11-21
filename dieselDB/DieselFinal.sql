-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-11-2020 a las 12:09:41
-- Versión del servidor: 8.0.22-0ubuntu0.20.04.2
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Diesel`
--
CREATE DATABASE IF NOT EXISTS `Diesel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Diesel`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `SP_AgAutoriza`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgAutoriza` (IN `N` VARCHAR(50), IN `OBS` TEXT)  BEGIN
	INSERT INTO Autorizan (Nombre,Observacion) VALUES (N,OBS);
END$$

DROP PROCEDURE IF EXISTS `SP_AgBomba`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgBomba` (IN `B` VARCHAR(25))  BEGIN
	INSERT INTO Bombas (Bomba) VALUES (B);
END$$

DROP PROCEDURE IF EXISTS `SP_AgBombero`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgBombero` (IN `N` VARCHAR(25), IN `A` VARCHAR(25), IN `O` TEXT)  BEGIN
	INSERT INTO Bomberos (Nombre, Apellido, Observacion) VALUES (N,A,O);
END$$

DROP PROCEDURE IF EXISTS `SP_AgCierre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgCierre` (IN `F` DATE, IN `ci` FLOAT, IN `cf` FLOAT, IN `obs` TEXT)  BEGIN
	INSERT INTO Cierres (Fecha,CantInicial,CantFinal,Observacion) VALUES (F,ci,cf,obs);
END$$

DROP PROCEDURE IF EXISTS `SP_AgEntrada`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgEntrada` (IN `IdUbi` INT, IN `IdMot` INT, IN `Cant` FLOAT, IN `OBS` TEXT, IN `HL` TIME, IN `Ex` FLOAT, IN `F` DATE)  BEGIN
	INSERT INTO Entradas(IdUbicacion,IdMotorista,Cantidad,Observacion,HoraLlegada,Existecia,Fecha) VALUES (IdUbi,IdMot,Cant,Obs,HL,Ex,F);
END$$

DROP PROCEDURE IF EXISTS `SP_AgMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgMarca` (IN `Marca` VARCHAR(50))  BEGIN
	Insert into Marcas (Marca) Values (Marca);
END$$

DROP PROCEDURE IF EXISTS `SP_AgMotorista`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgMotorista` (IN `Id` CHAR(13), IN `Nombre` VARCHAR(25), IN `Apellido` VARCHAR(25), IN `Obs` TEXT, IN `RTNTrans` CHAR(14))  BEGIN
	Insert into Motoristas (IdMotorista,Nombre,Apellido,Observacion,RTN_Transportista) Values (Id,Nombre,Apellido,Obs,RTNTrans);
END$$

DROP PROCEDURE IF EXISTS `SP_AgOrden`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgOrden` (IN `F` DATE, IN `IDA` INT, IN `IDB` INT, IN `P` CHAR(7), IN `B` VARCHAR(12), IN `C` CHAR(11), IN `CH` VARCHAR(10), IN `PL` VARCHAR(15), IN `IDTS` INT, IN `IDBO` INT, IN `G` FLOAT, IN `DES` TEXT, IN `KMT` INT, IN `IMP` INT, IN `ANUL` INT, IN `CXC` INT, IN `EX` FLOAT, IN `R` INT)  BEGIN
	INSERT INTO Ordenes (Fecha,IdAutoriza,Placa,Boleta,Contenedor,Chasis,Planta,IdTipoSalida,
	IdBombero,Galones,Descripcion,Kilometraje,Impresa,Anulada,CxC,Existencia,Reimpresion)
    VALUES (F,IDA,P,B,C,CH,PL,IDTS,IDBO,G,DES,KMT,IMP,ANUL,CXC,EX,R);
END$$

DROP PROCEDURE IF EXISTS `SP_AgTipoSalida`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTipoSalida` (IN `TIPO` VARCHAR(30))  BEGIN
	INSERT INTO TiposSalidas (TipoSalida) VALUES (TIPO);
END$$

DROP PROCEDURE IF EXISTS `SP_AgTipoVehiculo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTipoVehiculo` (IN `T` VARCHAR(50))  BEGIN
	INSERT INTO TiposVehiculos (Tipo) VALUES (T);
END$$

DROP PROCEDURE IF EXISTS `SP_AgTransportista`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgTransportista` (IN `rtn` CHAR(14), IN `Nombre` VARCHAR(25), IN `Apellido` VARCHAR(25), IN `Obs` TEXT)  BEGIN
	Insert into Transportistas (RTN,Nombre,Apellido,Observacion) Values (Rtn,Nombre,Apellido,Obs);
END$$

DROP PROCEDURE IF EXISTS `SP_AgUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgUsuario` (IN `Nombre` VARCHAR(50), IN `Username` VARCHAR(25), IN `Pass` VARCHAR(256), IN `Permi` CHAR(3))  BEGIN
	INSERT INTO Usuarios (Nombre,Username,Contrasena,Permisos) Values (Nombre,Username,Pass,Permi);
END$$

DROP PROCEDURE IF EXISTS `SP_AgVehiculo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgVehiculo` (IN `PLACA` CHAR(7), IN `IDM` INT, IN `IDT` INT, IN `OBS` TEXT, IN `IDMOT` CHAR(13))  BEGIN
	INSERT INTO Vehiculos (Placa,IdMarca,IdTipo,Observacion,IdMotorista)
    VALUES (PLACA,IDM,IDT,OBS,IDMOT);
END$$

DROP PROCEDURE IF EXISTS `SP_DelAutoriza`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DelAutoriza` (IN `id` INT)  NO SQL
DELETE FROM Autorizan WHERE IdAutoriza = id$$

DROP PROCEDURE IF EXISTS `SP_ModAutoriza`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModAutoriza` (IN `id` INT, IN `n` VARCHAR(50), IN `obs` TEXT)  NO SQL
UPDATE Autorizan SET Nombre = n, Observacion = obs WHERE IdAutoriza = id$$

DROP PROCEDURE IF EXISTS `SP_ModCierre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModCierre` (IN `F` DATE, IN `CF` FLOAT, IN `C` INT)  BEGIN
	UPDATE Cierres SET CantFinal=CF, Cerrado = C WHERE Fecha = F;
END$$

DROP PROCEDURE IF EXISTS `SP_ModEntrada`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModEntrada` (IN `Id` INT, IN `IdMot` INT, IN `Cant` FLOAT, IN `OBS` TEXT, IN `HL` TIME, IN `Ex` FLOAT, IN `F` DATE)  BEGIN
	UPDATE Entradas
    SET
    IdMotorista=IdMot, 
    Cantidad=Cant, 
    Observacion=Obs, 
    HoraLlegada=HL, 
    Existecia=Ex
    WHERE IdEntrada = Id AND Fecha = F;
END$$

DROP PROCEDURE IF EXISTS `SP_ModMotorista`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModMotorista` (IN `Id` CHAR(13), IN `Nombre` VARCHAR(25), IN `Apellido` VARCHAR(25), IN `Obs` TEXT, IN `RTNTrans` CHAR(14))  BEGIN
	UPDATE Motoristas 
    SET
    Nombre = Nombre,
    Apellido = Apellido,
    Observacion = Obs,
    RTN_TRANSPORTISTA = RTNTrans
    WHERE IdMotorista = Id;
END$$

DROP PROCEDURE IF EXISTS `SP_ModTipoVehiculo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModTipoVehiculo` (IN `Id` INT, IN `T` VARCHAR(50))  BEGIN
	UPDATE TiposVehiculos SET Tipo=T WHERE IdTipo=Id;
END$$

DROP PROCEDURE IF EXISTS `SP_ModTransportista`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModTransportista` (IN `id` CHAR(14), IN `n` VARCHAR(25), IN `a` VARCHAR(25), IN `obs` TEXT)  NO SQL
UPDATE Transportistas SET Nombre = n, Apellido = a, Observacion = obs WHERE RTN = id$$

DROP PROCEDURE IF EXISTS `SP_ModUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModUsuario` (IN `Id` INT, IN `Nom` VARCHAR(50), IN `Uname` VARCHAR(25), IN `Pass` VARCHAR(256))  BEGIN
	UPDATE Usuarios SET
    Nombre = Nom,
    Username = Uname,
    Contrasena = Pass
    WHERE IdUsuario = Id;
END$$

DROP PROCEDURE IF EXISTS `SP_ModVehiculo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModVehiculo` (IN `id` CHAR(7), IN `IDM` INT, IN `IDT` INT, IN `OBS` TEXT, IN `IDMOT` CHAR(13))  BEGIN
	UPDATE Vehiculos SET
        IdMarca = IDM,
        IdTipo = IDT,
        Observacion = OBS,
        IdMotorista = IDMOT
	WHERE Placa = id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AuditLogs`
--
-- Creación: 19-11-2020 a las 18:22:04
--

DROP TABLE IF EXISTS `AuditLogs`;
CREATE TABLE `AuditLogs` (
  `IdLog` int NOT NULL,
  `IdUsuario` int NOT NULL,
  `FechaHora` datetime NOT NULL,
  `Observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `AuditLogs`:
--   `IdUsuario`
--       `Usuarios` -> `IdUsuario`
--

--
-- Truncar tablas antes de insertar `AuditLogs`
--

TRUNCATE TABLE `AuditLogs`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autorizan`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 20-11-2020 a las 20:45:15
--

DROP TABLE IF EXISTS `Autorizan`;
CREATE TABLE `Autorizan` (
  `IdAutoriza` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Observacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Autorizan`:
--

--
-- Truncar tablas antes de insertar `Autorizan`
--

TRUNCATE TABLE `Autorizan`;
--
-- Volcado de datos para la tabla `Autorizan`
--

INSERT INTO `Autorizan` (`IdAutoriza`, `Nombre`, `Observacion`) VALUES
(4, 'Pablito', 'Despachado'),
(6, 'Onofre', 'carnitasada Anafre'),
(7, 'Tito', 'Calix'),
(8, 'Gunera', 'xD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Bomberos`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 21-11-2020 a las 18:05:54
--

DROP TABLE IF EXISTS `Bomberos`;
CREATE TABLE `Bomberos` (
  `IdBombero` int NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Observacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Bomberos`:
--

--
-- Truncar tablas antes de insertar `Bomberos`
--

TRUNCATE TABLE `Bomberos`;
--
-- Volcado de datos para la tabla `Bomberos`
--

INSERT INTO `Bomberos` (`IdBombero`, `Nombre`, `Apellido`, `Observacion`) VALUES
(2, 'Arturo', 'Braga', ':v');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cierres`
--
-- Creación: 19-11-2020 a las 18:22:03
--

DROP TABLE IF EXISTS `Cierres`;
CREATE TABLE `Cierres` (
  `Fecha` date NOT NULL,
  `CantInicial` float NOT NULL DEFAULT '0',
  `CantFinal` float NOT NULL DEFAULT '0',
  `Observacion` text,
  `Cerrado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Cierres`:
--

--
-- Truncar tablas antes de insertar `Cierres`
--

TRUNCATE TABLE `Cierres`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Entradas`
--
-- Creación: 19-11-2020 a las 18:22:04
--

DROP TABLE IF EXISTS `Entradas`;
CREATE TABLE `Entradas` (
  `IdEntrada` int NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` float NOT NULL,
  `Observaciones` text NOT NULL,
  `HoraLlegada` time NOT NULL,
  `Existencia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Entradas`:
--   `Fecha`
--       `Cierres` -> `Fecha`
--

--
-- Truncar tablas antes de insertar `Entradas`
--

TRUNCATE TABLE `Entradas`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marcas`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 21-11-2020 a las 17:18:18
--

DROP TABLE IF EXISTS `Marcas`;
CREATE TABLE `Marcas` (
  `IdMarca` int NOT NULL,
  `Marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Marcas`:
--

--
-- Truncar tablas antes de insertar `Marcas`
--

TRUNCATE TABLE `Marcas`;
--
-- Volcado de datos para la tabla `Marcas`
--

INSERT INTO `Marcas` (`IdMarca`, `Marca`) VALUES
(34, 'Audi'),
(14, 'Caterpillar'),
(19, 'Chevrolet'),
(24, 'Cummins'),
(25, 'Daihatsu'),
(10, 'Datsun'),
(8, 'Ford'),
(9, 'Freightliner'),
(20, 'GMC'),
(23, 'Grua Frontal Cortes'),
(16, 'Honda'),
(18, 'Hyundai'),
(11, 'International'),
(5, 'Isuzu'),
(28, 'Jeep'),
(3, 'John Deere'),
(15, 'Kenworth'),
(27, 'Kia'),
(21, 'Kubota'),
(13, 'Mack'),
(26, 'Massey Ferguson'),
(7, 'Mazda'),
(12, 'Mercedes Benz'),
(6, 'Mitsubishi'),
(2, 'Nissan'),
(4, 'Peterbilt'),
(1, 'Toyota'),
(22, 'Valtra'),
(17, 'Volvo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Motoristas`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 20-11-2020 a las 20:27:01
--

DROP TABLE IF EXISTS `Motoristas`;
CREATE TABLE `Motoristas` (
  `IdMotorista` char(13) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Observacion` text,
  `RTN_TRANSPORTISTA` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Motoristas`:
--   `RTN_TRANSPORTISTA`
--       `Transportistas` -> `RTN`
--

--
-- Truncar tablas antes de insertar `Motoristas`
--

TRUNCATE TABLE `Motoristas`;
--
-- Volcado de datos para la tabla `Motoristas`
--

INSERT INTO `Motoristas` (`IdMotorista`, `Nombre`, `Apellido`, `Observacion`, `RTN_TRANSPORTISTA`) VALUES
('0601199532332', 'Elver', 'Galarga', 'choferio', '08161956000744'),
('0601495656564', 'Dameciano', 'Moreno', 'xD', '06071996010488'),
('0801196532656', 'Jacinto', 'Palma', 'viejitp', '06071996010488');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ordenes`
--
-- Creación: 19-11-2020 a las 18:22:04
--

DROP TABLE IF EXISTS `Ordenes`;
CREATE TABLE `Ordenes` (
  `IdOrden` int NOT NULL,
  `Fecha` date NOT NULL,
  `IdAutoriza` int NOT NULL,
  `Placa` char(7) NOT NULL,
  `Boleta` varchar(12) NOT NULL,
  `Contenedor` char(11) DEFAULT '---',
  `Chasis` varchar(10) DEFAULT '---',
  `Planta` varchar(15) DEFAULT '---',
  `IdTipoSalida` int NOT NULL,
  `IdBombero` int NOT NULL,
  `Galones` float NOT NULL,
  `Descripcion` text,
  `Kilometraje` int DEFAULT '0',
  `Impresa` tinyint(1) NOT NULL DEFAULT '0',
  `Anulada` tinyint(1) NOT NULL DEFAULT '0',
  `CxC` tinyint(1) NOT NULL DEFAULT '0',
  `Existencia` float NOT NULL,
  `Reimpresion` tinyint(1) NOT NULL DEFAULT '0',
  `GalonesAnulados` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Ordenes`:
--   `IdAutoriza`
--       `Autorizan` -> `IdAutoriza`
--   `IdBombero`
--       `Bomberos` -> `IdBombero`
--   `Fecha`
--       `Cierres` -> `Fecha`
--   `IdTipoSalida`
--       `TiposSalidas` -> `IdTipoSalida`
--   `Placa`
--       `Vehiculos` -> `Placa`
--

--
-- Truncar tablas antes de insertar `Ordenes`
--

TRUNCATE TABLE `Ordenes`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--
-- Creación: 19-11-2020 a las 18:22:03
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `sessions`:
--

--
-- Truncar tablas antes de insertar `sessions`
--

TRUNCATE TABLE `sessions`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposSalidas`
--
-- Creación: 19-11-2020 a las 18:22:04
--

DROP TABLE IF EXISTS `TiposSalidas`;
CREATE TABLE `TiposSalidas` (
  `IdTipoSalida` int NOT NULL,
  `TipoSalida` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `TiposSalidas`:
--

--
-- Truncar tablas antes de insertar `TiposSalidas`
--

TRUNCATE TABLE `TiposSalidas`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposVehiculos`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 20-11-2020 a las 19:59:55
--

DROP TABLE IF EXISTS `TiposVehiculos`;
CREATE TABLE `TiposVehiculos` (
  `IdTipo` int NOT NULL,
  `Tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `TiposVehiculos`:
--

--
-- Truncar tablas antes de insertar `TiposVehiculos`
--

TRUNCATE TABLE `TiposVehiculos`;
--
-- Volcado de datos para la tabla `TiposVehiculos`
--

INSERT INTO `TiposVehiculos` (`IdTipo`, `Tipo`) VALUES
(10, 'Ambulancia'),
(11, 'Cabezal Alquilado'),
(12, 'Cabezal de la empresa'),
(9, 'Pick-Up'),
(8, 'Tractor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Transportistas`
--
-- Creación: 19-11-2020 a las 18:22:04
--

DROP TABLE IF EXISTS `Transportistas`;
CREATE TABLE `Transportistas` (
  `RTN` char(14) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Observacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Transportistas`:
--

--
-- Truncar tablas antes de insertar `Transportistas`
--

TRUNCATE TABLE `Transportistas`;
--
-- Volcado de datos para la tabla `Transportistas`
--

INSERT INTO `Transportistas` (`RTN`, `Nombre`, `Apellido`, `Observacion`) VALUES
('06011998007312', 'Genesis Shalon ', 'Martinez Bueso', 'Mi esposita <3'),
('06071996010488', 'Samuel Eduardo', 'Vasquez Marcia', 'yo pos kien maz?  :v xD'),
('08161956000744', 'Victor', 'Vasquez', 'sd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 20-11-2020 a las 19:46:12
--

DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE `Usuarios` (
  `IdUsuario` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Contrasena` varchar(256) NOT NULL,
  `Permisos` char(3) NOT NULL DEFAULT 'rw-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Usuarios`:
--

--
-- Truncar tablas antes de insertar `Usuarios`
--

TRUNCATE TABLE `Usuarios`;
--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`IdUsuario`, `Nombre`, `Username`, `Contrasena`, `Permisos`) VALUES
(1, 'Administrador', 'admin', 'admin123', 'rwx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vehiculos`
--
-- Creación: 19-11-2020 a las 18:22:04
-- Última actualización: 20-11-2020 a las 22:32:02
--

DROP TABLE IF EXISTS `Vehiculos`;
CREATE TABLE `Vehiculos` (
  `Placa` varchar(7) NOT NULL,
  `IdMarca` int NOT NULL,
  `IdTipo` int NOT NULL,
  `Observacion` text NOT NULL,
  `IdMotorista` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONES PARA LA TABLA `Vehiculos`:
--   `IdMarca`
--       `Marcas` -> `IdMarca`
--   `IdMotorista`
--       `Motoristas` -> `IdMotorista`
--   `IdTipo`
--       `TiposVehiculos` -> `IdTipo`
--

--
-- Truncar tablas antes de insertar `Vehiculos`
--

TRUNCATE TABLE `Vehiculos`;
--
-- Volcado de datos para la tabla `Vehiculos`
--

INSERT INTO `Vehiculos` (`Placa`, `IdMarca`, `IdTipo`, `Observacion`, `IdMotorista`) VALUES
('PAZ2037', 1, 9, ':v', '0601495656564'),
('PBJ9597', 3, 8, 'suma', '0601495656564'),
('PP14100', 5, 9, 'sdf', '0801196532656');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `V_AuditLogs`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `V_AuditLogs`;
CREATE TABLE `V_AuditLogs` (
`IdLog` int
,`Usuario` varchar(50)
,`Fecha y Hora de Acción` datetime
,`Observacion` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `V_Motoristas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `V_Motoristas`;
CREATE TABLE `V_Motoristas` (
`Identidad` char(13)
,`Nombre` varchar(25)
,`Apellido` varchar(25)
,`Observacion` text
,`Transportista` varchar(51)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `V_Ordenes`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `V_Ordenes`;
CREATE TABLE `V_Ordenes` (
`IdOrden` int
,`Fecha` date
,`AUTORIZA` varchar(50)
,`Placa` char(7)
,`Boleta` varchar(12)
,`Contenedor` char(11)
,`Chasis` varchar(10)
,`Planta` varchar(15)
,`TipoSalida` varchar(30)
,`BOMBERO` varchar(51)
,`Galones` float
,`Descripcion` text
,`Kilometraje` int
,`Impresa` tinyint(1)
,`Anulada` tinyint(1)
,`CxC` tinyint(1)
,`Existencia` float
,`Reimpresion` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `V_Vehiculos`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `V_Vehiculos`;
CREATE TABLE `V_Vehiculos` (
`Placa` varchar(7)
,`Marca` varchar(50)
,`Tipo` varchar(50)
,`MOTORISTA` varchar(51)
,`TRANSPORTISTA` varchar(51)
,`Observacion` text
);

-- --------------------------------------------------------

--
-- Estructura para la vista `V_AuditLogs`
--
DROP TABLE IF EXISTS `V_AuditLogs`;
-- Creación: 19-11-2020 a las 18:22:03
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `V_AuditLogs`  AS  select `AuditLogs`.`IdLog` AS `IdLog`,`Usuarios`.`Nombre` AS `Usuario`,`AuditLogs`.`FechaHora` AS `Fecha y Hora de Acción`,`AuditLogs`.`Observacion` AS `Observacion` from (`AuditLogs` join `Usuarios` on((`Usuarios`.`IdUsuario` = `AuditLogs`.`IdUsuario`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `V_Motoristas`
--
DROP TABLE IF EXISTS `V_Motoristas`;
-- Creación: 19-11-2020 a las 18:22:03
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `V_Motoristas`  AS  select `M`.`IdMotorista` AS `Identidad`,`M`.`Nombre` AS `Nombre`,`M`.`Apellido` AS `Apellido`,`M`.`Observacion` AS `Observacion`,concat(`T`.`Nombre`,' ',`T`.`Apellido`) AS `Transportista` from (`Motoristas` `M` join `Transportistas` `T` on((`M`.`RTN_TRANSPORTISTA` = `T`.`RTN`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `V_Ordenes`
--
DROP TABLE IF EXISTS `V_Ordenes`;
-- Creación: 21-11-2020 a las 17:31:49
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `V_Ordenes`  AS  select `O`.`IdOrden` AS `IdOrden`,`O`.`Fecha` AS `Fecha`,`AU`.`Nombre` AS `AUTORIZA`,`O`.`Placa` AS `Placa`,`O`.`Boleta` AS `Boleta`,`O`.`Contenedor` AS `Contenedor`,`O`.`Chasis` AS `Chasis`,`O`.`Planta` AS `Planta`,`TS`.`TipoSalida` AS `TipoSalida`,concat(`BOM`.`Nombre`,' ',`BOM`.`Apellido`) AS `BOMBERO`,`O`.`Galones` AS `Galones`,`O`.`Descripcion` AS `Descripcion`,`O`.`Kilometraje` AS `Kilometraje`,`O`.`Impresa` AS `Impresa`,`O`.`Anulada` AS `Anulada`,`O`.`CxC` AS `CxC`,`O`.`Existencia` AS `Existencia`,`O`.`Reimpresion` AS `Reimpresion` from (((`Ordenes` `O` join `Autorizan` `AU` on((`O`.`IdAutoriza` = `AU`.`IdAutoriza`))) join `TiposSalidas` `TS` on((`O`.`IdTipoSalida` = `TS`.`IdTipoSalida`))) join `Bomberos` `BOM` on((`O`.`IdBombero` = `BOM`.`IdBombero`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `V_Vehiculos`
--
DROP TABLE IF EXISTS `V_Vehiculos`;
-- Creación: 19-11-2020 a las 18:22:03
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `V_Vehiculos`  AS  select `V`.`Placa` AS `Placa`,`M`.`Marca` AS `Marca`,`TV`.`Tipo` AS `Tipo`,concat(`MOT`.`Nombre`,' ',`MOT`.`Apellido`) AS `MOTORISTA`,concat(`TR`.`Nombre`,' ',`TR`.`Apellido`) AS `TRANSPORTISTA`,`V`.`Observacion` AS `Observacion` from ((((`Vehiculos` `V` join `Marcas` `M` on((`V`.`IdMarca` = `M`.`IdMarca`))) join `TiposVehiculos` `TV` on((`V`.`IdTipo` = `TV`.`IdTipo`))) join `Motoristas` `MOT` on((`V`.`IdMotorista` = `MOT`.`IdMotorista`))) join `Transportistas` `TR` on((`MOT`.`RTN_TRANSPORTISTA` = `TR`.`RTN`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AuditLogs`
--
ALTER TABLE `AuditLogs`
  ADD PRIMARY KEY (`IdLog`),
  ADD KEY `IdUsuario` (`IdUsuario`);

--
-- Indices de la tabla `Autorizan`
--
ALTER TABLE `Autorizan`
  ADD PRIMARY KEY (`IdAutoriza`);

--
-- Indices de la tabla `Bomberos`
--
ALTER TABLE `Bomberos`
  ADD PRIMARY KEY (`IdBombero`);

--
-- Indices de la tabla `Cierres`
--
ALTER TABLE `Cierres`
  ADD PRIMARY KEY (`Fecha`),
  ADD UNIQUE KEY `Fecha` (`Fecha`);

--
-- Indices de la tabla `Entradas`
--
ALTER TABLE `Entradas`
  ADD PRIMARY KEY (`IdEntrada`),
  ADD KEY `FK_ENTRADAS_CIERRES` (`Fecha`);

--
-- Indices de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`IdMarca`),
  ADD UNIQUE KEY `Marca` (`Marca`);

--
-- Indices de la tabla `Motoristas`
--
ALTER TABLE `Motoristas`
  ADD PRIMARY KEY (`IdMotorista`),
  ADD KEY `RTN_TRANSPORTISTA` (`RTN_TRANSPORTISTA`),
  ADD KEY `IdxMotoristas_Transportistas` (`IdMotorista`,`RTN_TRANSPORTISTA`);

--
-- Indices de la tabla `Ordenes`
--
ALTER TABLE `Ordenes`
  ADD PRIMARY KEY (`IdOrden`,`Fecha`),
  ADD KEY `IdTipoSalida` (`IdTipoSalida`),
  ADD KEY `Fecha` (`Fecha`),
  ADD KEY `Placa` (`Placa`),
  ADD KEY `IdAutoriza` (`IdAutoriza`),
  ADD KEY `FK_Ordenes_Bomberos_idx` (`IdBombero`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `TiposSalidas`
--
ALTER TABLE `TiposSalidas`
  ADD PRIMARY KEY (`IdTipoSalida`);

--
-- Indices de la tabla `TiposVehiculos`
--
ALTER TABLE `TiposVehiculos`
  ADD PRIMARY KEY (`IdTipo`),
  ADD UNIQUE KEY `Tipo` (`Tipo`);

--
-- Indices de la tabla `Transportistas`
--
ALTER TABLE `Transportistas`
  ADD PRIMARY KEY (`RTN`),
  ADD KEY `Nombre` (`Nombre`,`Apellido`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indices de la tabla `Vehiculos`
--
ALTER TABLE `Vehiculos`
  ADD PRIMARY KEY (`Placa`),
  ADD UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  ADD KEY `IdMotorista` (`IdMotorista`),
  ADD KEY `IdMarca` (`IdMarca`),
  ADD KEY `IdTipo` (`IdTipo`),
  ADD KEY `IdxVehiculos` (`Placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `AuditLogs`
--
ALTER TABLE `AuditLogs`
  MODIFY `IdLog` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Autorizan`
--
ALTER TABLE `Autorizan`
  MODIFY `IdAutoriza` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `Bomberos`
--
ALTER TABLE `Bomberos`
  MODIFY `IdBombero` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `IdMarca` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `Ordenes`
--
ALTER TABLE `Ordenes`
  MODIFY `IdOrden` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TiposSalidas`
--
ALTER TABLE `TiposSalidas`
  MODIFY `IdTipoSalida` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `TiposVehiculos`
--
ALTER TABLE `TiposVehiculos`
  MODIFY `IdTipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `IdUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `AuditLogs`
--
ALTER TABLE `AuditLogs`
  ADD CONSTRAINT `AuditLogs_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`IdUsuario`);

--
-- Filtros para la tabla `Entradas`
--
ALTER TABLE `Entradas`
  ADD CONSTRAINT `FK_ENTRADAS_CIERRES` FOREIGN KEY (`Fecha`) REFERENCES `Cierres` (`Fecha`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Motoristas`
--
ALTER TABLE `Motoristas`
  ADD CONSTRAINT `FK_Motoristas_Transportistas` FOREIGN KEY (`RTN_TRANSPORTISTA`) REFERENCES `Transportistas` (`RTN`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Ordenes`
--
ALTER TABLE `Ordenes`
  ADD CONSTRAINT `FK_Ordenes_Autorizan` FOREIGN KEY (`IdAutoriza`) REFERENCES `Autorizan` (`IdAutoriza`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Ordenes_Bomberos` FOREIGN KEY (`IdBombero`) REFERENCES `Bomberos` (`IdBombero`),
  ADD CONSTRAINT `FK_Ordenes_Cierres` FOREIGN KEY (`Fecha`) REFERENCES `Cierres` (`Fecha`),
  ADD CONSTRAINT `FK_Ordenes_TiposSalidas` FOREIGN KEY (`IdTipoSalida`) REFERENCES `TiposSalidas` (`IdTipoSalida`),
  ADD CONSTRAINT `FK_Ordenes_Vehiculos` FOREIGN KEY (`Placa`) REFERENCES `Vehiculos` (`Placa`);

--
-- Filtros para la tabla `Vehiculos`
--
ALTER TABLE `Vehiculos`
  ADD CONSTRAINT `FK_Vehiculos_Marcas` FOREIGN KEY (`IdMarca`) REFERENCES `Marcas` (`IdMarca`),
  ADD CONSTRAINT `FK_Vehiculos_Motristas` FOREIGN KEY (`IdMotorista`) REFERENCES `Motoristas` (`IdMotorista`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_Vehiculos_TiposVehiculos` FOREIGN KEY (`IdTipo`) REFERENCES `TiposVehiculos` (`IdTipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
