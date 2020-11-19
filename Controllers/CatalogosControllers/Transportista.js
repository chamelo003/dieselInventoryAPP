const controller = {};

// Seleccionar un registro en la base de datos
controller.Lista = (req,res)=>{
    req.getConnection((err,conn) => {
        conn.query('SELECT * FROM Transportistas;',(err,results)=>{
            if(err){
                res.json(err);
            }
            res.render('./OrdenesViews/catalogosViews/Transportista',{data:results,title:'Transportistas'});
        });
    });
};

// Agregar un registro a la base de datos
controller.Agrega = (req,res)=>{
    rtn = req.body.rtn;
    nombre = req.body.nom;
    apellido = req.body.ape;
    Obs = req.body.obs;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgTransportista('${rtn}','${nombre}','${apellido}','${Obs}')`;
        const query = conn.query(q,(err,results)=>{
            if(err){  //we make sure theres an error (error obj)
                if(err.errno==1062){   
                req.flash('message','El RTN que intenta agregar ya se encuentra registrado.'); //we send the flash msg
                return res.redirect('/catalogos/trans');
                conn.end();
                }
                else{
                    throw err;
                conn.end();
                }
            }
            console.log(results);
            res.redirect('/catalogos/trans')
        });
    });
};

//Selecciona la data del registro que se quiere editar
controller.selectEdit =  (req,res)=>{
    const { id } = req.params;
    req.getConnection((err, conn) => {
        q = `SELECT * FROM Transportistas WHERE RTN =${id}`;
        conn.query(q, (err, results) => {
            if(err) throw err;
        res.render('./OrdenesViews/catalogosViews/EditForms/TransportistaEdit', {results,title:"Editar Transportista"});
        });
    });
}

// Modificar un registro en la base de datos
controller.Edit = (req,res)=>{
    rtn = req.body.rtn;
    nombre = req.body.nom;
    apellido = req.body.ape;
    Obs = req.body.obs
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_ModTransportista('${rtn}','${nombre}','${apellido}','${Obs}')`;
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
        console.log(results);
            res.redirect('/catalogos/trans');
        });
    });
};

// Eliminar un registro en la base de datos
controller.Elimina = (req,res)=>{
    const {rtn} = req.params;
    console.log(rtn);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_DelTransportista(${rtn});`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/trans');
        });
    });
};

module.exports = controller;