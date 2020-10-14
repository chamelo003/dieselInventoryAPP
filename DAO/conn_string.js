/************************************************
 * Created by chamelo ON Aug 13 2020            * 
 * Esta es la cadena de conexion con la DB      *
 * Aquí se agregan los datos del servidor,      *
 * puerto, nombre de la DB, usuario y contra.   *
 * Luego requerimos el conector de mysql y le   *
 * pasamos los parametros de la cadena.         *
 ***********************************************/

// Datos del server mysql
let dbString = {
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'H@ck3r$h0w',
    database: 'Diesel'
}

// Requerimos el conector
const mysql = require('mysql');

// Abrimos la conexion
conn = mysql.createConnection(dbString);

// Verificamos que la conexion funcione, de no ser así lanzamos el error.
conn.connect(err=>{
    // Operador ternario si hay error lanza el codigo de error sino lanza mensaje de todo bien todo correcto
    return (err) ? console.log('Error al conectar con la DB: '+err.stack) : console.log('Connected to DB!');
});

