/*
  Este modulo se encarga de encriptar las contraseñas, comparar la contraseña que se ingresa al momento de login
  con la que tiene guardada en la BD. Son usadas en la ruta de users. para iniciar sesion en 
  /users/login y registro de usuarios /users/signup
*/
const bcrypt = require('bcryptjs');

const helpers = {};

helpers.encryptPassword = async (password) => {
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  return hash;
};

helpers.matchPassword = async (password, savedPassword) => {
  try {
    return await bcrypt.compare(password, savedPassword);
  } catch (e) {
    console.log(e);
  }
};

module.exports = helpers;