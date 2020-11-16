const controller = {};

// Seleccionar un registro en la base de datos
controller.Lista = (req,res)=>{
    req.getConnection((err,conn) => {
        conn.query('SELECT * FROM V_Autorizan;',(err,results)=>{
            if(err){
                res.json(err);
            }
            res.render('./OrdenesViews/catalogosViews/Autoriza',{data:results,title:'Autorizadores'});
        });
    });
};

// Agregar un registro a la base de datos
controller.Agrega = (req,res)=>{
    N = req.body.N;
    OBS = req.body.OBS;
    IDUB = req.body.IDUB;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgAutoriza('${N}','${OBS}',${IDUB})`;
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan')
        });
    });
};

// SELECCIONAR UN REGISTRO PARA MODIFICARLO
controller.Edita = (req,res)=>{
    const {id} = req.params;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `SELECT * FROM Autorizan WHERE IdAutoriza = ${id}`;
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan');
        });
    });
};

// Modificar un registro en la base de datos
controller.Actualiza = (req,res)=>{
    const {id} = req.params;
    N = req.body.N;
    OBS = req.body.OBS;
    IDUB = req.body.IDUB;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_ModAutoriza(${id},'${N}','${OBS}',${IDUB})`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan');
        });
    });
};

// Eliminar un registro en la base de datos
controller.Elimina = (req,res)=>{
    const {id} = req.params;
    console.log(id);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_DelAutoriza(${id});`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan');
        });
    });
};
module.exports = controller;