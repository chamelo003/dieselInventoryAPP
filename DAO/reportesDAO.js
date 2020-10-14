/********************************************************
*Created by Chamelo ON Sep 22 2020.                     * 
*En este Data Access Object vamos a ejectutar todas las *  
* consultas que tengan que ver con:                     *
*1. Cierres                                             *      
*2. Entradas                                            *  
*3. Ordenes                                             *  
********************************************************/

const reportesDAO = require('./conn_string');

function getDiario(next){
    reportesDAO.query(`Select * FROM V_Ordenes`,(err,rows)=>{
        next(err,rows[0]);
    });
};


module.exports = {
    getDiario
}