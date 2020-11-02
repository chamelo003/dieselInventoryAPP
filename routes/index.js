var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  //var user = req.session.userdata;
  //delete req.session.userdata;
  //console.log(user);
  res.render('Index', { title: 'Sistema de combustible', greeting:`Bienvenid@`});
});

module.exports = router;
