const controller = {};

// Mostrar lista de registros de la DB
controller.Lista = (req,res)=>{
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `SELECT * From TiposVehiculos;`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/TiposVehiculos',{data:results,title:'Tipos de vehiculos'});
        });
    });
};

// Agregar un registro
controller.Agrega = (req,res)=>{
    tv = req.body.tv;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgTipoVehiculo('${tv}');`;
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos almacenados exitosamente!');
            res.redirect('/catalogos/tv');
        });
    });
};

// seleccionar un registro para editar
controller.selectEdit = (req,res)=>{
    const {id} = req.params;
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `Select * FROM TiposVehiculos WHERE IdTipo = ${id};`
        conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.render('./OrdenesViews/catalogosViews/EditForms/TipoVehiculoEdit',{results, title:"Tipos de Vehiculos"});
        });
    });
};

// Modificar un registro en la base de datos
controller.Edit = (req,res)=>{
    const {id} = req.params;
    T = req.body.tv;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_ModTipoVehiculo(${id},'${T}')`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos actualizados satisfactoriamente!');
            res.redirect('/catalogos/tv');
        });
    });
};

// Eliminar un registro en la base de datos
controller.Elimina = (req,res)=>{
    const {id} = req.params;
    console.log(id);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `DELETE FROM TiposVehiculos WHERE IdTipo = ${id};`
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            req.flash('success','Datos eliminados satisfactoriamente!');
            res.redirect('/catalogos/tv');
        });
    });
};
module.exports = controller;