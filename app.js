var createError = require('http-errors');
var express = require('express');
var path = require('path');
var logger = require('morgan');
var session = require('express-session');
const passport = require('passport');
const MySQLStore = require('express-mysql-session')(session);
const flash = require('connect-flash');
const validator = require('express-validator');

// jalo mi database
const { dbString } = require('./DAO/conn_string');
// creo mi server
var app = express();
// requiero la libreria que escribi para la autenticacion y creacion de usuarios
require('./lib/passport');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// MIDDLEWARES
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret:'thisisaMFsecret',
  resave:false,
  saveUninitialized: false,
  store: new MySQLStore(dbString)
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(validator());

//VARIABLES GLOBALES
//AQui mando mensajes y alertas cuando 
app.use((req, res, next) => {
  app.locals.message = req.flash('message');
  app.locals.success = req.flash('success');
  app.locals.user = req.user;
  next();
});

// CREAMOS VARIABLES PARA ALMACENAR LAS RUTAS CREADAS Y PODER USARLAS
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var catalogosRouter = require('./routes/catalogos');
var movimientosRouter = require('./routes/movimientos');
var reportesRouter = require('./routes/reportes');

// USAMOS LAS RUTAS QUE HEMOS CREADO
app.use('/home', indexRouter);
app.use('/users', usersRouter);
app.use('/catalogos',catalogosRouter);
app.use('/movimientos',movimientosRouter);
app.use('/reportes',reportesRouter);

// si se trata de ingresar a / que rediriga al login
app.get('/',(req,res,next)=>{
  res.redirect('/users/login');
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  /* Cuando está en producción se renderiza una plantilla chévere bonita xD se llama error.ejs       *
   * En desarrollo hay que cambiar por errordev.ejs si salta un error en produccion y se desea       *
   * ver el error hay que comentar la linea res.render('error') y descomentar res.render('errordev')*/
  // render the error page
  res.status(err.status || 500);
  // Plantilla para ver el error en modo desarrollo
  res.render('errordev');
  // Plantilla chévere bonita pues xD
  //res.render('error');
});

module.exports = app;
