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
    req.getConnection((err,conn)=>{
        if(err) throw err;
        q = `Select * From Marcas Where IdMarca = ${id};`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
        });
    });
    res.render('./OrdenesViews/catalogosViews/MarcaEdit',{results,title:'Editar Marca'});
};
module.exports = controller;
