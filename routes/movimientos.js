/************************************************************************
 *  CREATED BY: Chamelo ON Sept/15/2020                                 *
 *  En este archivo de urls se van a manejar todas las URI que tengan   *
 *  que ver con todo lo que involucra movimientos en la BD (Crear dia,  *
 *  cerrar dia, crear Ordenes, crear entradas y modificar todo lo antes *
 *  mencionado).                                                        *
 *  todos los links de las rutas aquí encontradas                       *
 *  se encuentran en: /views/Layouts/Login/Header.ejs
 ***********************************************************************/
const { Router } = require('express');
const router = Router();
//meta las rutas aqui lince

//#region CIERRES
// Acciones para APERTURA Y CIERRE DE DIAS 
// Ruta para ver los días creados y cerrados 
// Link en la vista: ('/movimientos/cierres')
router.get('/cierres',(req,res,next)=>{
    //res.send('Listado de cierres')
    res.render('./OrdenesViews/movimientosViews/Cierres',{title:'Cierres'});
});
//#endregion

//#region ENTRADAS
// Acciones para ENTRADAS 
// Ruta para ver lista de entradas 
// Link en la vista: ('/movimientos/entradas')
router.get('/entradas',(req,res,next)=>{
    //res.send('lista de entradas');
    res.render('./OrdenesViews/movimientosViews/Entradas',{title:'Entradas'})
});
//#endregion

//#region ORDENES
// Acciones para ORDENES 
// Ruta para ver listado de ordenes 
// Link en la vista: ('/movimientos/cierres')
router.get('/ordenes',(req,res,next)=>{
    //res.send('lista de ordenes');
    res.render('./OrdenesViews/movimientosViews/Ordenes',{title:'Ordenes'});
});
//#endregion

module.exports = router;