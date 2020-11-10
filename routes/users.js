/**************************************************
 * AQUI SE MANEJAN TODO LO QUE TENGA QUE VER CON: *
 * INICIO DE SESION Y GESTION DE USUARIOS         *
 * CREATED BY: CHAMELO ON 16/SEPT/2020            *
 **************************************************/

const { Router } = require('express');
const router = Router();

// Traigo mi conexion a la DB
const pool = require('../DAO/conn_string');
// instancio passport para poder loggear usuarios
const passport = require('passport');
// cjalo mi guachi de sesiones xD
const { isLoggedIn } = require('../lib/auth');

// URI DEL LOGIN PARA AUTENTICARSE Y PROCEDER AL SISTEMA DE ORDENES.
router.get('/login', function(req, res, next) {
  res.render('./LoginViews/Login.ejs',{title:'Log in!',infor:''});
});
// procesamos la data del form de inicio de sesion
router.post('/login',(req,res,next)=>{
  req.check('usuario', 'Es obligatorio ingresar el nombre de usuario').notEmpty();
  req.check('contra', 'Se requiere la contraseña').notEmpty();
  const errors = req.validationErrors();
  if (errors.length > 0) {
    req.flash('message', errors[0].msg);
    res.redirect('/');
  }
  passport.authenticate('local.signin', {
    successRedirect: '/home/',
    failureRedirect: '/',
    failureFlash: true
  })(req, res, next);
  /*
  console.log(req.body);
  req.session.user = req.body
  res.redirect('/home/');
  //res.send('Si funca login xD')*/
});

// URI DEL LOGIN PARA INGRESAR A LA GESTION DE USUARIOS.
router.get('/signup',(req,res,next)=>{
  res.render('./LoginViews/Login.ejs',{title:'Acceso Administrador',infor:'Bienvenido al panel de gestión de usuarios, favor ingresa con tu cuenta de administrador.'})
});

//URI PARA PROCESAR LA DATA DEL FORM DE LOGIN ADMIN
router.post('/signup',(req,res,next)=>{
  console.log(req.body);
  //res.send('si funca signup xD');
});

router.get('/users',(req,res,next)=>{
  res.render('./GestionUsuariosViews/users.ejs',{title:'Ususarios'});
})

router.get('/logout',(req,res,next)=>{
  // kill session
  req.logOut();
  res.redirect('/');
});

module.exports = router;
