/************************************************
 * Created by chamelo ON Aug 13 2020            * 
 * Esta es la cadena de conexion con la DB      *
 * Aquí se agregan los datos del servidor,      *
 * puerto, nombre de la DB, usuario y contra.   *
 * Luego requerimos el conector de mysql y le   *
 * pasamos los parametros de la cadena.         *
 ***********************************************/
// Requerimos el conector
const mysql = require('mysql');
// Datos del server mysql
let dbString = {
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'H@ck3r$h0w',
    database: 'Diesel'
}
var async = require('async'); 
const { promisify } = require('util');

// Abrimos la conexion
const pool = mysql.createPool(dbString);

// Verificamos que la conexion funcione, de no ser así lanzamos el error.

pool.getConnection((err,connection)=>{
    if(err){
        if(err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.error('DATABASE CONNECTION WAS CLOSED');
        }
        if(err.code === 'ERR_CONN_COUNT_ERROR'){
            console.error('DATABASE HAS TO MANY CONNECTIONS');
        }
        if(err.code === 'ECONNREFUSED'){
            console.error('DATABASE CONNECTION WAS REFUSED');
        }
    }

    if(connection) connection.release;
    console.log('Connected to DB!')
    return;
})
/*conn.getConnection(err=>{
    // Operador ternario si hay error lanza el codigo de error sino lanza mensaje de todo bien todo correcto
    return (err) ? console.log('Error al conectar con la DB: '+err.stack) : console.log('Connected to DB!');
});*/
promisify(pool.query);
module.exports = pool;