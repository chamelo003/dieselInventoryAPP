/************************************************************
*   Created by: chamelo on Sept 15 2020                     *
*   En este archivo van todos los scripts necesarios para   *
*   interactuar con el DOM.                                 *
************************************************************/
$(document).ready( function (){

    // funcion para llenar el transportista al ingresar un motorista.
    $('.RTN').dblclick(function(){
        // Asignamos el RTN seleccionado EN LA TABLA DE LA MODAL a la variable RtnTrans
        RtnTrans = $(this).text();
        // Quitamos todos los espacios que tenga la cadena de texto.
        RtnTrans = RtnTrans.replace(/\s/g,'');
        //alert(RtnTrans);
        // Asignamos el RTN seleccionado y sin espacios a la textbox correspondiente.
        $('#rtnTrans').val(RtnTrans);        
        $('#modalExtData').modal('hide');
    });

    // Validar que no se modifiquen los inputs que obtienen los id de una modal
    $('.openModal4Id').keydown(function(e){
        e.preventDefault();
    });


    $('.listado').DataTable({
        "language":{
            "url":"/javascripts/Spanish.json"
        }
    });
});