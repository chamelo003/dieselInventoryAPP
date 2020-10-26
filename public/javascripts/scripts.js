/************************************************************
*   Created by: chamelo on Sept 15 2020                     *
*   En este archivo van todos los scripts necesarios para   *
*   interactuar con el DOM.                                 *
************************************************************/
$(document).ready( function (){

//#region misc functions

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

    // funcion para cambiar el titulo a la pagina y abrir la modal xD a ver si funca :v
    $('#marca').click(function(){
        document.getElementsByTagName("title").text = "marca";
    })

    // Validar que no se modifiquen los inputs que obtienen los id de una modal
    $('.openModal4Id').keydown(function(e){
        e.preventDefault();
    });

    // Funcion para ocultar y mostrar elementos en la modal.
    // Esperamos ocultar y mostrar info (titulo y body) de acuerdo a lo que se elija
    // en las views que requieren uso de la ventana modal.


//#endregion

//#region data tables
    // Poner en español las data tables
    $('.listado').DataTable({
        "language":{
            "url":"/javascripts/Spanish.json"
        }
    });
//#endregion


});