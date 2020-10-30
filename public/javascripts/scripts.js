/************************************************************
*   Created by: chamelo on Sept 15 2020                     *
*   En este archivo van todos los scripts necesarios para   *
*   interactuar con el DOM.                                 *
************************************************************/
$(document).ready( function (){

//#region misc functions for CATALOGOS VIEWS

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

    // Funcion para ocultar y mostrar elementos en la modal.
    // Esperamos ocultar y mostrar info (titulo y body) de acuerdo a lo que se elija
    // en las views que requieren uso de la ventana modal.
    $('#idMot').click(function(){
        $('.marca').hide();
        $('.tv').hide();
        $('.mot').show();    
        $('.mottdselector').dblclick(function (){
            nombre = $(this).text();
            console.log("nombreItem:"+nombre);
            iditem = $(this).prev('td').text();
            console.log(iditem)
            $('#idMot').val(iditem);
        });   
    })
    $('#tv').click(function(){
        $('.marca').hide();
        $('.mot').hide();
        $('.tv').show();    
        $('.tvtdselector').dblclick(function (){
            nombre = $(this).text();
            console.log("nombreItem:"+nombre);
            iditem = $(this).prev('td').text();
            console.log(iditem)
            $('#tv').val(iditem);
        });  
    });
    $('#marca').click(function(){
        $('.tv').hide();
        $('.mot').hide();
        $('.marca').show();
        $('.mtdselector').dblclick(function (){
            nombre = $(this).text();
            console.log("nombreItem:"+nombre);
            iditem = $(this).prev('td').text();
            console.log(iditem)
            $('#marca').val(iditem);
        });
    });
    //tdselector();
    // funcion para elegir los id si se seleccionan los nombres de motoristas, o marcas, o tipos de vehiculos
    // y colocarlos en el input correspondiente en el dom los tags td tienen una clase llamada tdselector
        $('.tdselector').dblclick(function (){
            nombre = $(this).text();
            console.log("nombreItem:"+nombre);
            iditem = $(this).prev('td').text();
            console.log(iditem)
        });
//#endregion
$('#fecha').change(function(){
    alert($(this).val());
})

//#region MISC FUNCTIONS FOR MOVIMIENTOS VIEWS

//#endregion
//#region data tables
    // Poner lenguage en español las tablas y darles formato data tables
    $('.listado').DataTable({
        "language":{
            "url":"/javascripts/Spanish.json"
        }
    });
//#endregion
});