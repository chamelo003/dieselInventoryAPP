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
const { promisify }= require('util');

const { database } = require('./keys');

const pool = mysql.createPool(database);

pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.');
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has to many connections');
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused');
    }
  }

  if (connection) connection.release();
  console.log('DB is Connected');

  return;
});

// Promisify Pool Querys
pool.query = promisify(pool.query);

module.exports = pool;