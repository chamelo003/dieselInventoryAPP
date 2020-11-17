const controller = {};

/** ZAMPAR AQUI TODO EL MIERDERO DE CIERRES NADA MAS OCUPO CREAR DIA (INSERT) Y CERRAR DIA (UPDATE)*/

/** Abrir el pinshi dia :v */
controller.Crear = (req,res)=>{
    
    const q = `CALL SP_AgCierre()`;
}

controller.Cerrar = (req,res)=>{
    
    const q = `CALL SP_ModCierre()`;
}
module.exports = controller;
