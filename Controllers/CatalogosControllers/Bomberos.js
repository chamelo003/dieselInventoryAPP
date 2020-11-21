const controller = {};

// Lsitado
controller.Lista = (req,res)=>{
    q = `SELECT * FROM Bomberos;`;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/Bomberos.ejs',{data:results,title:'Bomberos'});
        });
    });
};

// agregar
controller.Agrega = (req,res)=>{
    n = req.body.nombre;
    a = req.body.apellido;
    obs = req.body.obs;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `CALL SP_AgBombero('${n}','${a}','${obs}');`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos almacenados exitosamente');
        });
        res.redirect('/catalogos/bombs');
    });
};

// seleccionar para editar
controller.selectEdit = (req,res)=>{
    const {id} = req.params;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `SELECT * FROM Bomberos WHERE IdBombero = ${id};`;
        console.log(results);
    });
    res.render('./');
};
module.exports = controller;