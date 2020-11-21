const controller = {};

// Mostrar listado
controller.Lista = (req,res)=>{
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `SELECT * FROM V_Vehiculos;SELECT * FROM Marcas;SELECT * FROM TiposVehiculos;SELECT Identidad, CONCAT(Nombre,' ',Apellido) AS 'Motorista' FROM V_Motoristas;`
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/Vehiculos',{Vehiculos:results[0],Marcas:results[1],TV:results[2],Motoristas:results[3],title:'Vehiculos'});
        });
    });
};

// Agregar registro
controller.Agrega = (req,res)=>{
    Placa = req.body.placa;
    idmarca = req.body.idmarca;
    idtv = req.body.idtv;
    obs = req.body.obs;
    idmot = req.body.idmot;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgVehiculo('${Placa}',${idmarca},${idtv},'${obs}','${idmot}');`;
        conn.query(q,(err,results)=>{
            if(err){  //we make sure theres an error (error obj)
                if(err.errno==1062){   
                req.flash('message','La placa que intenta agregar ya se encuentra registrada.'); //we send the flash msg
                return res.redirect('/catalogos/veh');
                conn.end();
                }
                else{
                    throw err;
                conn.end();
                }
            }
            req.flash('success','Datos almacenados exitosamente');
            res.redirect('/catalogos/veh');
        });
    });
};

// Seleccionar para editar
controller.selectEdit = (req,res)=>{
    const {id} = req.params;
    q = `SELECT V.Placa,V.IdMarca,V.IdTipo,V.Observacion,V.IdMotorista, CONCAT(M.Nombre,' ',M.Apellido) AS 'Motorista', Ma.Marca, T.Tipo
    FROM Vehiculos V
    INNER JOIN Motoristas M ON V.IdMotorista = M.IdMotorista
    INNER JOIN TiposVehiculos T ON V.IdTipo = T.IdTipo
    INNER JOIN Marcas Ma ON V.IdMarca = Ma.IdMarca
    WHERE Placa = '${id}';
    SELECT * FROM Marcas;
    SELECT * FROM TiposVehiculos;
    SELECT Identidad, CONCAT(Nombre,' ',Apellido) AS 'Motorista' FROM V_Motoristas;`;

    req.getConnection((err,conn)=>{
        if(err) throw err;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/EditForms/VehiculoEdit',{Vehiculos:results[0],Marcas:results[1],TV:results[2],Motoristas:results[3],title:'Vehiculos'});
        });
    });
};

// Editar
controller.Edit = (req,res)=>{
    console.log(req.params);
    placa = req.body.placa;
    idmarca = req.body.idmarca;
    idtv = req.body.idtv;
    obs = req.body.obs;
    idmot = req.body.idmot;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `CALL SP_ModVehiculo('${placa}',${idmarca},${idtv},'${obs}','${idmot}');`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
        });
    });
    req.flash('success','Datos actualizados exitosamente');
    res.redirect('/catalogos/veh');
};

// Elminar
controller.Elimina = (req,res)=>{
    const {id} = req.params;
    req.getConnection((err,conn)=>{
        if(err) return err;
        q = `DELETE FROM Vehiculos WHERE Placa = '${id}';`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            req.flash('success','Datos eliminados satisfactoriamente');
            res.redirect('/catalogos/veh');
        });
    });
};

module.exports = controller;