var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

// CREAMOS VARIABLES PARA ALMACENAR LAS RUTAS CREADAS Y PODER USARLAS
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var catalogosRouter = require('./routes/catalogos');
var movimientosRouter = require('./routes/movimientos');
var reportesRouter = require('./routes/reportes');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


// Cueston para manejo de sesiones :v (CHAMBAL PERRO) 12/OCT/2020
var session = require('express-session');
const router = require('./routes/index');
var MySQLStore = require('express-mysql-session')(session);
var options = {};

app.use(session({
  secret:'Ez1S3kreTH0ktuM1r@daiLaMIA_xD',
  resave: false,
  saveUninitialized: false
}));

/*/ MIDDLEWARES 30/10/2020
const flash = require('connect-flash');
app.use(flash);

// VARIABLES GLOBALES aqui voy a guardar todo del usuario excepto la password xD me interesa mas la ubicacion y el username
app.use((req,res,next)=>{
  app.locals.user = req.flash('success');
  next();
});
*/

// USAMOS LAS RUTAS QUE HEMOS CREADO
app.use('/home', indexRouter);
app.use('/users', usersRouter);
app.use('/catalogos',catalogosRouter);
app.use('/movimientos',movimientosRouter);
app.use('/reportes',reportesRouter);

app.get('/',(req,res,next)=>{
  res.redirect('/users/');
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
