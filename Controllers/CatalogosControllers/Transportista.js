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
            if(err){  //we make sure theres an error (error obj)
                if(err.errno==1062){   
                req.flash('message','The entry already exist.'); //we send the flash msg
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
controller.Editar =  (req,res)=>{
    const { id } = req.params;
    req.getConnection((err, conn) => {
        conn.query("SELECT * FROM Transportista WHERE id = ?", [id], (err, rows) => {
        res.render('customers_edit', {
            data: rows[0]
        })
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

        let q = `CALL SP_ModTransportista(${rtn},'${nombre}','${apellido}',${Obs})`;
        const query = conn.query(q,(err,results)=>{
        console.log(results);
            res.redirect('/catalogos/autorizan');
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
            res.redirect('/catalogos/autorizan');
        });
    });
};

// Llenar la tabla de la ventana modal de transportistas. 
// Esta se va a usar para seleccionar el transportista al momento de registrar un motorista
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