const controller = {};

// Seleccionar la data de la BD para mostrar en tablas
controller.Lista = (req,res)=>{
    req.getConnection((err,conn) => {
        if(err) throw err;
        q = `SELECT * FROM V_Motoristas; SELECT RTN, CONCAT(Nombre,' ',Apellido) AS 'Transportista' FROM Transportistas;`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            res.render('./OrdenesViews/catalogosViews/Motorista',{motoristas:results[0],transportistas:results[1],title:'Motoristas'});
        });
    });
};

// Agregar un registro a la base de datos
controller.Agrega = (req,res)=>{
    Id = req.body.id;
    Nombre = req.body.nombre;
    Apellido = req.body.apellido;
    Obs = req.body.obs;
    RTNTrans = req.body.rtnTrans;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgMotorista('${Id}','${Nombre}','${Apellido}','${Obs}','${RTNTrans}');`;
        conn.query(q,(err,results)=>{
            if(err){  //we make sure theres an error (error obj)
                if(err.errno==1062){   
                req.flash('message','La identidad que intenta agregar ya se encuentra registrada.'); //we send the flash msg
                return res.redirect('/catalogos/mot');
                conn.end();
                }
                else{
                    throw err;
                conn.end();
                }
            }
            res.redirect('/catalogos/mot');
        });
    });
};

// Seleccionar un motorista para editar sus datos
controller.selectEdit =  (req,res)=>{
    const { id } = req.params;
    req.getConnection((err, conn) => {
        if(err) throw err;
        q = `SELECT * FROM Motoristas WHERE IdMotorista = '${id}';SELECT RTN, CONCAT(Nombre,' ',Apellido) AS 'Transportista' FROM Transportistas;`;
        conn.query(q, (err, results) => {
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/EditForms/MotoristaEdit', {motoristas:results[0],transportistas:results[1],title:"Motoristas"});
        });
    });
};

// Modificar los datos del motorista seleccionado
controller.Edit = (req,res)=>{
    const {id} = req.params;
    Nombre = req.body.nombre;
    Apellido = req.body.apellido;
    Obs = req.body.obs;
    RTNTrans = req.body.rtnTrans;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_ModMotorista('${id}','${Nombre}','${Apellido}','${Obs}','${RTNTrans}');`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos actualizados satisfactoriamente!');
            res.redirect('/catalogos/mot');
        });
    }); 
};

controller.Elimina = (req,res)=>{
    const {id} = req.params;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `DELETE FROM Motoristas WHERE IdMotorista = '${id}';`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos eliminados satisfactoriamente!');
            res.redirect('/catalogos/mot');
        });
    });
}

module.exports = controller;