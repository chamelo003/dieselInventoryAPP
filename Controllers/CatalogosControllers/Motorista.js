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
        const query = conn.query(q,(err,results)=>{
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
        });
    });
};

module.exports = controller;