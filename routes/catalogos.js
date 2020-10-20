/****************************************************
* CREATED BY: Chamelo ON Sept-15-2020               *
*   En este modulo estarán todas las uris que       *
*   tengan que ver con gestion de tablas catalogos  *
*   todos los links de las rutas aquí encontradas   *
*   se encuentran en: /views/Layouts/Login/Header.ejs
*****************************************************/
// Requerimos las librerias necesarias para que funcione xD
var express = require('express');
var catalogosRouter = express.Router();
var catalogosController = require('../controllers/catalogosController');

//meta las rutas aqui lince

//#region AUTORIZADORES
// Acciones para los que autorizan 15/Sept/2020
// Ruta para ver listado de personas que autorizan 15/Sept/2020
// Link en la vista: ('/catalogos/autorizan')
catalogosRouter.get('/autorizan',(req,res,next)=>{
    //res.send('aqui vas a ver despues la lista de los que autorizan xD');
    res.render('./OrdenesViews/catalogosViews/Autoriza',{title:'Autorizadores',data:'data de ejemplo autoriza'})
});
//#endregion

//#region TRANSPORTISTAS
// Acciones para transportistas 16/Sept/2020
// Ruta para ver el listado de los transportistas 16/SEPT/2020
// Link en la vista: ('/catalogos/trans')
catalogosRouter.get('/trans',(req,res,next)=>{
    //res.send('lista de los transportistas');
    res.render('./OrdenesViews/catalogosViews/Transportista',{title:'Transportistas',data:'data de ejemplo transportistas :v'})
});
//#endregion

//#region MOTORISTAS
// Acciones para morotistas 16/sept/2020
// Ruta para ver el listado de los motoristas 16/sept/2020
// Link en la vista: ('/catalogos/mot')
catalogosRouter.get('/mot',(req,res,next)=>{
    //res.send('lista de los motoristas');
    res.render('./OrdenesViews/catalogosViews/Motorista',{title:'Motoristas',data:'data de ejemplo motorista :v'})
});
//#endregion

//#region TIPOS DE VEHICULOS
// Acciones para los tipos de vehiculos 16/sept/2020
// Ruta para ver los tipos de vehiculos 16/sept/2020
// Link en la vista: ('/catalogos/tv')
catalogosRouter.get('/tv',(req,res,next)=>{
    res.send('lista de tipos de vehiculos');
});
//#endregion

//#region RUTAS VEHICULOS
// Acciones para vehiculos 16/sept/2020
// Ruta para ver los vehiculos 16/sept/2020
// Link en la vista: ('/catalogos/veh')
catalogosRouter.get('/veh',(req,res,next)=>{
    res.send('lista de vehiculos');
});
//#endregion

//#region UBICACIONES
// Acciones para las Ubicaciones 16/sept/2020
// Ruta para ver las ubicaciones 16/sept/2020
// Link en la vista: ('/catalogos/loc')
catalogosRouter.get('/loc',(req,res,next)=>{
    res.send('lista de tipos de ubicaciones');
});
//#endregion

//#region BOMBAS
// Acciones para las bombas de combustible 16/sept/2020
// Ruta para ver listado de bombas 16/sept/2020
// Link en la vista: ('/catalogos/bomb')
catalogosRouter.get('/bomb',(req,res,next)=>{
    res.send('lista de bombas');
});
//#endregion

//#region BOMBEROS
// Acciones para los BOMBEROS 16/sept/2020
// Ruta para ver lsitado de bomberos 16/sept/2020
// Link en la vista: ('/catalogos/bombs')
catalogosRouter.get('/bombs',(req,res,next)=>{
    res.send('lista de bomberos');
});
//#endregion

//#region TIPOS DE SALIDAS
// Acciones para los tipos de salidas 16/sept/2020
// Ruta para ver lista de tipos de salidas 16/sept/2020
// Link en la vista: ('/catalogos/tv')
catalogosRouter.get('/tps',(req,res,next)=>{
    res.send('lista de tipos de salida');
});
//#endregion

module.exports = catalogosRouter;