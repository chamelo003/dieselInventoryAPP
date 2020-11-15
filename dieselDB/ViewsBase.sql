CREATE VIEW V_Autorizan AS 
	SELECT A.IdAutoriza, A.Nombre, U.LugarUbicacion AS 'Ubicacion' , A.Observacion
    FROM Autorizan A
    INNER JOIN Ubicaciones U
    ON U.IdUbicacion = A.IdUbicacion
