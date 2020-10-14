/*************************************
**** VISTAS DE TABLAS IMPORTANTES ****
*************************************/
DELIMITER $$
-- VISTA DE VEHICULOS
CREATE VIEW V_Vehiculos AS
SELECT V.Placa AS 'PLACA', M.Marca AS 'MARCA', TV.Tipo AS 'TIPO DE VEHICULO', 
		CONCAT(MOT.Nombre,' ',MOT.Apellido) AS 'MOTORISTA', CONCAT(TR.Nombre,' ',TR.Apellido) AS 'TRANSPORTISTA',V.Observacion
FROM Vehiculos V
INNER JOIN Marcas M
ON V.IdMarca = M.IdMarca
INNER JOIN TiposVehiculos TV
ON V.IdTipo = TV.IdTipo
INNER JOIN Motoristas MOT
ON V.IdMotorista = MOT.IdMotorista
INNER JOIN Transportistas TR
ON MOT.RTN_TRANSPORTISTA = TR.RTN;

-- VISTA DE ORDENES
CREATE VIEW V_Ordenes AS
	SELECT O.IdOrden, U.LugarUbicacion,O.Fecha,AU.Nombre AS 'AUTORIZA',B.Bomba,O.Placa,O.Boleta,O.Contenedor,O.Chasis,O.Planta,TS.TipoSalida,
	concat(BOM.Nombre,' ',BOM.Apellido) AS 'BOMBERO',O.Galones,O.Descripcion,O.Kilometraje,O.Impresa,O.Anulada,O.CxC,O.Existencia,O.Reimpresion
	FROM Ordenes O
	INNER JOIN Ubicaciones U ON O.IdUbicacion = U.IdUbicacion
	INNER JOIN Autorizan AU ON O.IdAutoriza = AU.IdAutoriza
	INNER JOIN Bombas B ON O.IdBomba = O.IdBomba
	INNER JOIN TiposSalidas TS ON O.IdTipoSalida = TS.IdTipoSalida
	INNER JOIN Bomberos BOM ON O.IdBombero = BOM.IdBombero;
