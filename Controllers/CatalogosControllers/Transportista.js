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
    Obs = req.body.obs
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgTransportista('${rtn}','${nombre}','${apellido}','${Obs}')`;
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/trans')
        });
    });
};

// Modificar un registro en la base de datos
controller.Actualiza = (req,res)=>{
    rtn = req.body.rtn;
    nombre = req.body.nom;
    apellido = req.body.ape;
    Obs = req.body.obs
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        try {
            let q = `CALL SP_ModTransportista(${id},'${N}','${OBS}',${IDUB})`
            const query = conn.query(q,(err,results)=>{
            //if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan');
        });
        } catch (errno) {
            if(errno == 1062){
                alert("El registro que intenta agregar ya existe");
            }
        }
        
    });
};

// Eliminar un registro en la base de datos
controller.Elimina = (req,res)=>{
    const {rtn} = req.params;
    console.log(id);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_DelTransportista(${rtn});`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan');
        });
    });
};

controller.ModalTransportista = (req,res)=>{
    req.getConnection((err,conn) => {
        const q = `SELECT RTN, CONCAT(Nombre,' ',Apellido) AS Transportista FROM Transportistas;`
        conn.query(q,(err,results)=>{
            if(err){
                res.json(err);
            }
            res.send({data:results});
        });
    });
}
module.exports = controller;