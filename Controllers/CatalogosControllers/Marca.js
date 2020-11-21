const controller = {};

// Listado
controller.Lista = (req,res)=>{
    q = `SELECT * FROM Marcas Order By IdMarca ASC;`
    req.getConnection((err,conn) => {
        conn.query(q,(err,results)=>{
            if(err) throw err;
            res.render('./OrdenesViews/catalogosViews/Marcas',{data:results,title:'Marcas'});
        });
    });
};

// Agregar un registro
controller.Agrega = (req,res)=>{
    m = req.body.marca;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgMarca('${m}');`;
        conn.query(q,(err,results)=>{
            if(err){  //we make sure theres an error (error obj)
                if(err.errno==1062){   
                req.flash('message','La marca que intenta agregar ya se encuentra registrada.'); //we send the flash msg
                return res.redirect('/catalogos/marcas');
                conn.end();
                }
                else{
                    throw err;
                conn.end();
                }
            }
            req.flash('success','Datos almacenados exitosamente!');
            res.redirect('/catalogos/marcas');
        });
    });
};

// seleccionar para editar registro
controller.selectEdit = (req,res)=>{
    const {id} = req.params;
    console.log(id);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `SELECT * FROM Marcas WHERE IdMarca = ${id};`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/EditForms/MarcaEdit',{results,title:'Editar Marca'});
        });
    });
};

// editar el registro
controller.Edita = (req,res)=>{
    const {id} = req.params;
    m = req.body.marca;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `UPDATE Marcas SET Marca = '${m}' WHERE IdMarca = ${id};`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos actualizados satisfactoriamente');
            res.redirect('/catalogos/marcas');
        })
    });
};

// Eliminar
controller.Elimina = (req,res)=>{
    const {id} = req.params;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `DELETE FROM Marcas WHERE IdMarca = ${id};`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('Datos eliminados satisfactoriamente');
            res.redirect('/catalogos/marcas');
        });
    });
};

module.exports = controller;
