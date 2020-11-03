//var express = require('express');
//var router = express.Router();
const { Router } = require('express');
const router = Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  user = req.session.user;
  //delete req.session.user;
  console.log(user.usuario + 'desde index');
  res.render('Index', { title: 'Sistema de combustible', user});
});

module.exports = router;
