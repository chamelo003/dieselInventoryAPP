/**************************************************
 * AQUI SE MANEJAN TODO LO QUE TENGA QUE VER CON: *
 * INICIO DE SESION Y GESTION DE USUARIOS         *
 * CREATED BY: CHAMELO ON 16/SEPT/2020            *
 **************************************************/

 // LLAMAMOS LAS LIBRERIAS REQUERIDAS
//var express = require('express');
//var router = express.Router();

const { Router } = require('express');
const router = Router();

// URI DEL LOGIN PARA AUTENTICARSE Y PROCEDER AL SISTEMA DE ORDENES.
router.get('/login', function(req, res, next) {
  res.render('./LoginViews/Login.ejs',{title:'Log in!',message:''});
});
// procesamos la data del form de inicio de sesion
router.post('/login',(req,res,next)=>{
  console.log(req.body);
  req.session.user = req.body
  res.redirect('/home/');
  //res.send('Si funca login xD')
})

// URI DEL LOGIN PARA INGRESAR A LA GESTION DE USUARIOS.
router.get('/signup',(req,res,next)=>{
  res.render('./LoginViews/Login.ejs',{title:'Acceso Administrador',message:'Bienvenido al panel de gestión de usuarios, favor ingresa con tu cuenta de administrador.'})
});

//URI PARA PROCESAR LA DATA DEL FORM DE REGISTRO DE USUARIOS
router.post('/signup',(req,res,next)=>{
  console.log(req.body);
  res.send('si funca signup xD');
});

module.exports = router;
