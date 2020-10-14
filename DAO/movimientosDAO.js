/********************************************************
*Created by Chamelo ON Aug 8 2020.                      * 
*En este Data Access Object vamos a ejectutar todas las *  
* consultas que tengan que ver con:                     *
*1. Cierres                                             *      
*2. Entradas                                            *  
*3. Ordenes                                             *  
********************************************************/

const movimientoDAO = require('./conn_string');

function getEntradas(req,res,next){
    movimientoDAO.query(`Select * FROM Entradas WHERE Fecha = ?`,req.fecha,(err,rows)=>{
        next(err,rows[0]);
    });
}

module.exports = {
    getEntradas
}