/************************************************************************
 *  CREATED BY: Chamelo ON Sept/15/2020                                 *
 *  En este archivo de urls se van a manejar todas las URI que tengan   *
 *  que ver con todo lo que involucra Reporteria (Reporte diario,       *
 *  Reporte por vehiculo, reporte por rango de fechas, Ordenes por      *
 *  cobrar, Reportes por tipo de salida)                                *                                                       *
 ***********************************************************************/
//var express = require('express');
//var router = express.Router();
const { Router } = require('express');
const router = Router();
//meta las rutas aqui lince

//#region REPORTE DIARIO
// Acciones para reporte diario 16/sept/2020
// Ruta para hacer el reporte diario 16/sept/2020
// Link en la vista: ('/reportes/diario')
router.get('/diario',(req,res,next)=>{
    res.send('reporte diario');
});
//#endregion

//#region REPORTE POR FECHAS
// Acciones para GENERAR reportes por fechas 16/sept/2020
// Ruta para hacer el reporte por fecha 16/sept/2020
// Link en la vista: ('/reportes/xfecha')
router.get('/xfechas',(req,res,next)=>{
    res.send('reporte por fechas');
});
//#endregion

//#region REPORTE POR VEHICULO
// Acciones para REPORTES POR VEHICULOS 16/sept/2020
// Ruta para hacer el reporte por vehiculo 16/sept/2020
// Link en la vista: ('/reportes/xvehiuclo')
router.get('/xvehiculo',(req,res,next)=>{
    res.send('reporte por vehiculo');
});
//#endregion

//#region REPORTE CUENTAS POR COBRAR
// Acciones para rCUENTAS POR COBRAR 16/sept/2020
// Ruta para hacer el reporte de cuentas por cobrar 16/sept/2020
// Link en la vista: ('/reportes/CxC')
router.get('/CxC',(req,res,next)=>{
    res.send('reporte CxC');
});
//#endregion

//#region REPORTE POR TIPOS DE SALIDAS
// Acciones para Tipos de salidas 16/sept/2020
// Ruta para hacer el reporte por tipo de salida 16/sept/2020
// Link en la vista: ('/reportes/cierres')
router.get('/ts',(req,res,next)=>{
    res.send('reporte por tipo de salida');
});
//#endregion

module.exports = router;