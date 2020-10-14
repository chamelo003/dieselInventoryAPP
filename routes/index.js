var express = require('express');
var router = express.Router();
var username = 'Usuario de ejemplo'
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('Index', { title: 'Sistema de combustible', greeting:`Bienvenid@ ${username}`});
});

module.exports = router;
