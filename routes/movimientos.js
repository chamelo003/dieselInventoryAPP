/************************************************************************
 *  CREATED BY: Chamelo ON Sept/15/2020                                 *
 *  En este archivo de urls se van a manejar todas las URI que tengan   *
 *  que ver con todo lo que involucra movimientos en la BD (Crear dia,  *
 *  cerrar dia, crear Ordenes, crear entradas y modificar todo lo antes *
 *  mencionado).                                                        *
 *  todos los links de las rutas aquí encontradas                       *
 *  se encuentran en: /views/Layouts/Login/Header.ejs
 ***********************************************************************/
//var express = require('express');
//var router = express.Router();
const { Router } = require('express');
const router = Router();
//meta las rutas aqui lince

//#region CIERRES
// Acciones para APERTURA Y CIERRE DE DIAS 16/sept/2020
// Ruta para ver los días creados y cerrados 16/sept/2020
// Link en la vista: ('/movimientos/cierres')
router.get('/cierres',(req,res,next)=>{
    //res.send('Listado de cierres')
    res.render('./OrdenesViews/movimientosViews/Cierres',{title:'Cierres'});
});
//#endregion

//#region ENTRADAS
// Acciones para ENTRADAS 16/sept/2020
// Ruta para ver lista de entradas 16/sept/2020
// Link en la vista: ('/movimientos/entradas')
router.get('/entradas',(req,res,next)=>{
    //res.send('lista de entradas');
    res.render('./OrdenesViews/movimientosViews/Entradas',{title:'Entradas'})
});
//#endregion

//#region ORDENES
// Acciones para ORDENES 16/sept/2020
// Ruta para ver listado de ordenes 16/sept/2020
// Link en la vista: ('/movimientos/cierres')
router.get('/ordenes',(req,res,next)=>{
    //res.send('lista de ordenes');
    res.render('./OrdenesViews/movimientosViews/Ordenes',{title:'Ordenes'});
});
//#endregion

module.exports = router;