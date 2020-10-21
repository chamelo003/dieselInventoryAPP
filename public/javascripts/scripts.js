/************************************************************
*   Created by: chamelo on Sept 15 2020                     *
*   En este archivo van todos los scripts necesarios para   *
*   interactuar con el DOM.                                 *
************************************************************/
$(document).ready( function (){

    // funcion para llenar el transportista al ingresar un motorista.
    $('.RTN').dblclick(function(){
        // Asignamos el RTN seleccionado a la variable RtnTrans
        RtnTrans = $(this).text();
        // Quitamos todos los espacios que tenga la cadena de texto.
        RtnTrans = RtnTrans.replace(/\s/g,'');
        //alert(RtnTrans);
        // Asignamos el RTN seleccionado y sin espacios a la textbox correspondiente.
        $('#Transportista').val(RtnTrans);
        $('#modalTransportistas').modal('hide');
    });

    $('#listado').DataTable({
        "language":{
            "url":"//Spanish.json"
        }
    });
});

