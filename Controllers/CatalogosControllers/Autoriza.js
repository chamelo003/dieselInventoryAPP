const controller = {};

// Seleccionar un registro en la base de datos
controller.Lista = (req,res)=>{
    req.getConnection((err,conn) => {
        conn.query('SELECT * FROM Autorizan;',(err,results)=>{
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
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgAutoriza('${N}','${OBS}')`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos guardados satisfactoriamente!');
            res.redirect('/catalogos/autorizan')
        });
    });
};

// Seleccionar un registro para modificar
controller.selectEdit = (req,res)=>{
    const {id} = req.params;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `Select * FROM Autorizan WHERE IdAutoriza = ${id};`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/EditForms/AutorizaEdit',{results, title:"Editar Autorizador"});
        });
    });
};

// Modificar un registro en la base de datos
controller.Edita = (req,res)=>{
    const {id} = req.params;
    N = req.body.N;
    OBS = req.body.OBS;
    IDUB = req.body.IDUB;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_ModAutoriza(${id},'${N}','${OBS}')`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos actualizados satisfactoriamente!');
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
            req.flash('success','Datos eliminados satisfactoriamente!');
            res.redirect('/catalogos/autorizan');
        });
    });
};
module.exports = controller;