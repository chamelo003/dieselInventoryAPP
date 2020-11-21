/****************************************************
* CREATED BY: Chamelo ON Sept-15-2020               *
*   En este modulo estarán todas las uris que       *
*   tengan que ver con gestion de tablas catalogos  *
*   todos los links de las rutas aquí encontradas   *
*   se encuentran en: /views/Layouts/Login/Header.ejs
*****************************************************/
// Requerimos las librerias necesarias para que funcione xD
const { Router } = require('express');
const router = Router();
const { isLoggedIn } = require('../lib/auth');

// Jalo mis controladores
const AutorizaCont = require('../Controllers/CatalogosControllers/Autoriza');
const TransportistaCont = require('../Controllers/CatalogosControllers/Transportista');
const MotoristaCont = require('../Controllers/CatalogosControllers/Motorista');
const TipoVehiculoCont = require('../Controllers/CatalogosControllers/TiposVehiculos');
const VehiculosCont = require('../Controllers/CatalogosControllers/Vehiculos');
const MarcasCont = require('../Controllers/CatalogosControllers/Marca');
const BombertosCont = require('../Controllers/CatalogosControllers/Bomberos');

//#region AUTORIZADORES
// Acciones para los que autorizan
// Ruta para ver listado de personas que autorizan
// Link en la vista: ('/catalogos/autorizan')
// MOSTRAR EL LISTADO DE AUTORIZADORES
router.get('/autorizan',AutorizaCont.Lista);
// AGREGAR UN AUTORIZADOR
router.post('/autorizan/new',AutorizaCont.Agrega);
//SELECCIONAR UN AUTORIZADOR PARA MODIFICAR SUS DATOS
router.get('/autorizan/:id',AutorizaCont.selectEdit);
// MODIFICAR LOS DATOS DE UN AUTORIZADOR
router.post('/autorizan/edit/:id', AutorizaCont.Edita);
// ELIMINAR A UN AUTORIZADOR
router.get('/autorizan/delete/:id', AutorizaCont.Elimina);
//#endregion

//#region TRANSPORTISTAS
// Acciones para transportistas
// Ruta para ver el listado de los transportistas
// Link en la vista: ('/catalogos/trans')
// Ver listado de transportistas
router.get('/trans',TransportistaCont.Lista);
// agregar transportista
router.post('/trans/new',TransportistaCont.Agrega);
// seleccionar un transportista para editarlo
router.get('/trans/:id',TransportistaCont.selectEdit);
// modificar un transportista
router.post('/trans/edit/:id',TransportistaCont.Edit);
// eliminar un transportista
router.get('/trans/del/:id',TransportistaCont.Elimina);
//#endregion

//#region MOTORISTAS
// Acciones para morotistas
// Ruta para ver el listado de los motoristas
// Link en la vista: ('/catalogos/mot')
// Mostrar la data de la db
router.get('/mot',MotoristaCont.Lista);
// Agregar un motorista
router.post('/mot/new',MotoristaCont.Agrega);
// Seleccionar un motorista para editar
router.get('/mot/:id',MotoristaCont.selectEdit);
// Editar los datos de un motorista
router.post('/mot/edit/:id',MotoristaCont.Edit);
// Eliminar un motorista
router.get('/mot/del/:id',MotoristaCont.Elimina);
//#endregion

//#region TIPOS DE VEHICULOS
// Acciones para los tipos de vehiculos
// Ruta para ver los tipos de vehiculos
// Link en la vista: ('/catalogos/tv')
// Ver listado
router.get('/tv',TipoVehiculoCont.Lista);
// Agregar registro
router.post('/tv/new',TipoVehiculoCont.Agrega);
// seleccionar para editar
router.get('/tv/:id',TipoVehiculoCont.selectEdit);
// editar los datos
router.post('/tv/edit/:id',TipoVehiculoCont.Edit);
// Eliminar los datos
router.get('/tv/del/:id',TipoVehiculoCont.Elimina);
//#endregion

//#region RUTAS VEHICULOS
// Acciones para vehiculos
// Ruta para ver los vehiculos
// Link en la vista: ('/catalogos/veh')
// Listado de motoristas
router.get('/veh',VehiculosCont.Lista);
// Registrar en la BD
router.post('/veh/new',VehiculosCont.Agrega);
// Seleccionar para editar
router.get('/veh/:id',VehiculosCont.selectEdit);
// Editar datos
router.post('/veh/edit/:id',VehiculosCont.Edit);
// Eliminar
router.get('/veh/del/:id',VehiculosCont.Elimina);
//#endregion

//#region BOMBEROS
// Acciones para los BOMBEROS
// Ruta para ver lsitado de bomberos
// Link en la vista: ('/catalogos/bombs')
router.get('/bombs',BombertosCont.Lista);
// Registrar
router.post('/bombs/new',BombertosCont.Agrega);
//#endregion

//#region TIPOS DE SALIDAS
// Acciones para los tipos de salidas
// Ruta para ver lista de tipos de salidas
// Link en la vista: ('/catalogos/tv')
router.get('/tps',(req,res,next)=>{
    //res.send('lista de tipos de salida');
    res.render('./OrdenesViews/catalogosViews/TiposSalidas',{title:'Tipos de salidas'});
});
//#endregion

//#region Marcas
// Acciones para los Marcas
// Ruta para ver lista de Marcas
// Link en la vista: ('/catalogos/marcas')
// listado
router.get('/marcas',MarcasCont.Lista);
// agregar
router.post('/marcas/new',MarcasCont.Agrega);
// seleccionar para editar
router.get('/marcas/:id',MarcasCont.selectEdit);
// editar
router.post('/marcas/edit/:id',MarcasCont.Edita);
// eliminar
router.get('/marcas/del/:id',MarcasCont.Elimina);
//#endregion

module.exports = router;