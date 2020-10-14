/**************************************************
 * AQUI SE MANEJAN TODO LO QUE TENGA QUE VER CON: *
 * INICIO DE SESION Y GESTION DE USUARIOS         *
 * CREATED BY: CHAMELO ON 16/SEPT/2020            *
 **************************************************/

 // LLAMAMOS LAS LIBRERIAS REQUERIDAS
var express = require('express');
var router = express.Router();

// URI DEL LOGIN PARA AUTENTICARSE Y PROCEDER AL SISTEMA DE ORDENES.
router.get('/', function(req, res, next) {
  res.render('./LoginViews/Login.ejs',{title:'Log in!',message:''});
});

// URI DEL LOGIN PARA INGRESAR A LA GESTION DE USUARIOS.
router.get('/register',(req,res,next)=>{
  res.render('./LoginViews/Login.ejs',{title:'Acceso Administrador',message:'Bienvenido al panel de gestión de usuarios, favor ingresa con tu cuenta de administrador.'})
})

module.exports = router;
