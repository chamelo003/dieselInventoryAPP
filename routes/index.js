var express = require('express');
var router = express.Router();
var username = 'Usuario de ejemplo'
/* GET home page. */
router.get('/', function(req, res, next) {
  var user = req.session.userdata;
  delete req.session.userdata;
  console.log(user);
  res.render('Index', { title: 'Sistema de combustible', greeting:`Bienvenid@ ${user}`});
});

module.exports = router;
