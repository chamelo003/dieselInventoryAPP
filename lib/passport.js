const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
// Jalo mi ocnexion a la base de datos
const pool = require('../DAO/conn_string');
// Jalo mi libreria de ayuda
const helpers = require('./helpers');

// comparar la data recibida por el form de login con la data de la DB
passport.use('local.signin', new LocalStrategy({
  usernameField: 'username',
  passwordField: 'password',
  passReqToCallback: true
}, async (req, username, password, done) => {
  const rows = await pool.query('SELECT * FROM Usuarios WHERE Username = ?', [username]);
  if (rows.length > 0) {
    const user = rows[0];
    const validPassword = await helpers.matchPassword(password, user.password)
    if (validPassword) {
      done(null, user, req.flash('success', 'Welcome ' + user.username));
    } else {
      done(null, false, req.flash('message', 'Incorrect Password'));
    }
  } else {
    return done(null, false, req.flash('message', 'The Username does not exists.'));
  }
}));


// registrar un nuevo usuario
passport.use('local.signup', new LocalStrategy({
  usernameField: 'username',
  passwordField: 'password',
  passReqToCallback: true
}, async (req, username, password, done) => {

  const { fullname } = req.body;
  let newUser = {
    fullname,
    username,
    password,
    idlocation
  };
  newUser.password = await helpers.encryptPassword(password);
  // Saving in the Database
  //const result = await pool.query('INSERT INTO Usuarios () SET ? ', newUser);
  const result = await pool.query('Call SP_AgUsuario(?)', newUser);
  newUser.id = result.insertId;
  return done(null, newUser);
}));

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM Usuarios WHERE IdUsuario = ?', [id]);
  done(null, rows[0]);
});