/********************************************************
*Created by Chamelo ON Sep 22 2020.                     * 
*En este Data Access Object vamos a ejectutar todas las *  
* consultas que tengan que ver con:                     *
*1. Cierres                                             *      
*2. Entradas                                            *  
*3. Ordenes                                             *  
********************************************************/

const catalogosDAO = require('./conn_string');

// Obtner los registros de los encargados de autorizar las ordenes 22/Sept/2020
function getAutorizan(next){
    catalogosDAO.query(`Select * FROM Autorizan`,(err,rows)=>{
        next(err,rows[0]);
    });
};
// Insertar autorizadores
function postAutorizan(name,obs,next){
    catalogosDAO.query(`Call SP_AGAutoriza(?,?,?)`,name,obs,idub),(err,rows)=>{
        next(err,rows[0]);
    }
}

// Obtener los registros de las bombas existentes 01/Oct/2020
function getBombas(next){
    catalogosDAO.query(`Select * From V_Bombas`,(err,rows)=>{
        next(err,rows[0]);
    });
}



module.exports = {
    getAutorizan
}