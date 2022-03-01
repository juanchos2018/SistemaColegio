var TablaVsabsent;

$(document).ready(function() {
        TablaVsabsent = $('#TableVsabsent').DataTable({
    	"language":{
			"url": "//cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json"	
		},
    	"ajax": {
    		"url": base_url+"Vsabsent/getVsabsents",
    		"dataSrc":""
    	},
        "columns":[
            {"data": "options"},
			{"data": "FECREG"},
            {"data": "SEC_NM"},
            {"data": "PARALE"},
            {"data": "MAT_NM"},
            {"data": "LAS_NM"}
        ],
        "columnDefs": [
            { 'className': "anchocelda", "targets": [ 0 ]},
            { 'className': "anchocelda", "targets": [ 1 ]},
            { 'className': "anchocelda", "targets": [ 2 ]},
            { 'className': "anchocelda", "targets": [ 3 ]},
            { 'className': "anchocelda", "targets": [ 4 ]},
            { 'className': "anchocelda", "targets": [ 5 ]}
          ],
        responsive:true,
    	destroy:true,
    	"displayLength":10,
		"order":[[0,"asc"]]
    });


    // AGREGAR ASISTENCIA
    var formVsabsent = document.querySelector("#formVsabsent");    
   	formVsabsent.onsubmit = function(e)
   	{
		e.preventDefault(); //previene que se recargue el formulario o pagina...
			
		var request  = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');		
   		var ajaxUrl  = base_url+"Vsabsent/setVsabsent";
		var formData = new FormData(formVsabsent);
			
   		request.open("POST",ajaxUrl,true);
		request.send(formData);	
		request.onreadystatechange = function()
   		{
   			if(request.readyState == 4 && request.status == 200)
   			{					 
   				var objData = JSON.parse(request.responseText);			
							
  				if(objData.status)
   				{
                    $("#modalformVsabsent").modal('hide');
                    formVsabsent.reset();
                    swal('Asistencia',objData.msg,'success');
  					TablaVsabsent.ajax.reload(null,false);
   				}else{
  					swal('ERROR: ',objData.msg,'error');
   				}
   			}    			
   		}
   	}
});


// ASISTENCIA
function openModalAbs()
{
    document.querySelector('#idSec_id').value = 0;

    document.querySelector('#listSec_no').value = "";
    $('#listSec_no').selectpicker('render');
    document.querySelector('#listMat_no').value = "";
    $('#listMat_no').selectpicker('render');
    $('#listStd_n2').selectpicker('destroy');
    document.querySelector('#listStd_n2').title = "Escoger Estudiantes";
    document.querySelector('#listStd_n2').value = "";
    $('#listStd_n2').selectpicker('render');
    $('#listStd_n2').selectpicker('refresh');

    document.querySelector('#listParcia').value = "";
    $('#listParcia').selectpicker('render');
    document.querySelector('#listAbstip').value = "";
    $('#listAbstip').selectpicker('render');
    
    document.querySelector('#titleModal').innerHTML = 'Nueva Asistencia';
    document.querySelector('.modal-header').classList.replace('headerUpdate','headerRegister');
    document.querySelector('#btnActionForm').classList.replace('btn-info','btn-primary');
    document.querySelector('#btnText').innerHTML = 'Guardar';

    document.querySelector("#formVsabsent").reset();
    fntGetPerios();

    var fecha   = new Date(); //Fecha actual
    var dia     = fecha.getDate(); //obteniendo dia
    var mes     = fecha.getMonth()+1; //obteniendo mes
    var ano     = fecha.getFullYear(); //obteniendo año

    if(dia<10)
      dia='0'+dia; //agrega cero si el menor de 10
    if(mes<10)
      mes='0'+mes //agrega cero si el menor de 10
    document.getElementById('datFecreg').value = ano + "-" + mes + "-" + dia;

    $("#modalformVsabsent").modal('show');
}


// EDITAR ASISTENCIA
function fntEditVsabsent(idSEC)
{
    document.querySelector('#titleModal').innerHTML = 'Editar Asistencia';
    document.querySelector('.modal-header').classList.replace('headerRegister','headerUpdate');
    document.querySelector('#btnActionForm').classList.replace('btn-primary','btn-info');
    document.querySelector('#btnText').innerHTML = 'Actualizar';

    var secID   = idSEC;
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = base_url+"Vsabsent/getVsabsent/"+secID;

    request.open("GET",ajaxUrl,true);
    request.send();

    request.onreadystatechange = function()
    {
        if(request.readyState == 4 && request.status == 200)
        {
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {  
                // ID Asistencia
                document.querySelector('#idSec_id').value = objData.data.SEC_ID;

                // COMBO: Sección
                document.querySelector('#listSec_no').value = objData.data.SEC_NO;
                $('#listSec_no').selectpicker('render');

                // COMBO: Asignatura
                document.querySelector('#listMat_no').value = objData.data.MAT_NO;
                $('#listMat_no').selectpicker('render');

                // COMBO: Estudiante
                $('#listStd_n2').selectpicker('destroy');
                document.querySelector('#listStd_n2').title = objData.data.LAS_NM + ' ' + objData.data.FIR_NM;
                document.querySelector('#listStd_n2').innerHTML = objData.data.HTMLOptions;
                $('#listStd_n2').selectpicker('refresh');

                // Año Lectivo
                document.querySelector('#listPerios').value = objData.data.PERIOS;

                // Fecha de Registro
                document.querySelector('#datFecreg').value = objData.data.FECREG;

                // COMBO: Parcial
                document.querySelector('#listParcia').value = objData.data.PARCIA;
                $('#listParcia').selectpicker('render');

                // COMBO: Tipo de Falta
                $opcion = objData.data.ABSTIP;
                $('#listAbstip').selectpicker('val',$opcion);

                // Justificación
                document.querySelector('#txtSchedu').value = objData.data.SCHEDU;

                $('#modalformVsabsent').modal('show');
            }else{
                swal("Error",objData.msg,"error");
            }
        }
    }
}


// ELIMINAR ASISTENCIA
function fntDelVsabsent(secID)
{
    let idSec = secID;
          
    swal({
        title: "Eliminar Registro",
        text: "¿Realmente quiere eliminar el Registro ?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Sì, Eliminar!",
        cancelButtonText: "No, Cancelar",
        closeOnConfirm: false,
        closeOnCancel: true
        }, function(isConfirm) {
            if(isConfirm)
            {
                let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                let ajaxUrl = base_url+'Vsabsent/delVsabsent/';
                let strData = "idSec="+idSec;
                request.open("POST",ajaxUrl,true);
                request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                request.send(strData);
                request.onreadystatechange = function()
                {
                    if(request.readyState == 4 && request.status == 200)
                    {
                        var objData = JSON.parse(request.responseText);
                        if(objData.status)
                        {
                            swal("Eliminar",objData.msg,"success");
                            TablaVsabsent.ajax.reload(null,false);
                        }else{
                            swal("Atenciòn!",objData.msg,"error");
                        }
                    }
                }
            }
    });
}
