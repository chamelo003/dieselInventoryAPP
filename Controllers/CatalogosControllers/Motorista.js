const { InsufficientStorage } = require("http-errors");
const { connect } = require("../../routes/catalogos");

const controller = {};

controller.Lista = (req,res)=>{
    req.getConnection((err,res)=>{
        if(err){
            res.json(err);
        }
        q = `SELECT * FROM V_Motoristas;`;
        connect.query(q,(err,results)=>{
            if(err){
                res.json(err);
            }
            res.render('./OrdenesViews/catalogosViews/Motorista',{data:results,title:'Motoristas'});
        });
    });
};


// Agregar un registro a la base de datos
controller.Agrega = (req,res)=>{
    Id = req.body.N;
    OBS = req.body.OBS;
    console.log(req.body);
    req.getConnection((err,conn)=>{
        if(err) throw err;
        let q = `CALL SP_AgAutoriza('${N}','${OBS}')`;
        const query = conn.query(q,(err,results)=>{
            if(err) throw err;
            console.log(results);
            res.redirect('/catalogos/autorizan')
        });
    });
};
