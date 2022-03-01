var TablaVstables;

$(document).ready(function() {
        TablaVstables = $('#TableVstables').DataTable({
    	"language":{
			"url": "//cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json"	
		},
    	"ajax": {
    		"url": base_url+"Vstables/getVstables",
    		"dataSrc":""
    	},
        "columns":[
            {"data": "options"},
            {"data": "TAB_NM"},
            {"data": "SUB_NO"},
            {"data": "SUB_NM"},
            {"data": "ESTATU"}
        ],
        searchPanes:{
            cascadePanes: true,
            dtOpts: {
                dom:'tp',
                searching:false
            }
        },
        columnDefs: [
            {
                searchPanes: {
                show: false
                },
                targets: [2,3]
            },

            { 'className': "anchocelda", "targets": [ 0 ]},
            { 'className': "anchocelda", "targets": [ 1 ]},
            { 'className': "anchocelda", "targets": [ 2 ]},
            { 'className': "anchocelda", "targets": [ 3 ]},
            { 'className': "anchocelda", "targets": [ 4 ]}
        ],
        dom: 'BlfrtipP',
        buttons: [
            {
                "extend": "excelHtml5",
                "text": "<i class='fas fa-file-excel'></i> Excel",
                "titleAttr": "Exportar a Excel",
                "className": "btn btn-success"
            },{
                "extend": "pdfHtml5",
                "text": "<i class='fas fa-file-pdf'></i> PDF",
                "titleAttr": "Exportar a PDF",
                "className": "btn btn-danger"
            }
        ],
        responsive:true,
    	destroy:true,
    	"displayLength":10,
		"order":[[0,"asc"]]
    });


    // AGREGAR TABLA
    var formVstables = document.querySelector("#formVstables");    
   	formVstables.onsubmit = function(e)
   	{
   		e.preventDefault(); //previene que se recargue el formulario o pagina...
            
		var request  = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');	
   		var ajaxUrl  = base_url+"Vstables/setVstables";
   		var formData = new FormData(formVstables);

        request.open("POST",ajaxUrl,true);
    	request.send(formData);	

		request.onreadystatechange = function()
   		{
   			if(request.readyState == 4 && request.status == 200)
   			{	
   				let objData = JSON.parse(request.responseText);	
   				if(objData.status)
   				{
                    $('#modalformVstables').modal('hide');
                    formVstables.reset();
                    swal('Tabla',objData.msg,'success');
  					TablaVstables.ajax.reload(null,false);
   				}else{
  					swal('ERROR: ',objData.msg,'error');
  				}
   			}    			
   		}
   	}
});


// TABLA
function openModalTab()
{
    document.querySelector('#idSec_id').value = 0;
    document.querySelector('#listTab_no').value = "";
    $('#listTab_no').selectpicker('render');
    
    document.querySelector('#titleModal').innerHTML = 'Nueva Tabla';
    document.querySelector('.modal-header').classList.replace('headerUpdate','headerRegister');
    document.querySelector('#btnActionForm').classList.replace('btn-info','btn-primary');
    document.querySelector('#btnText').innerHTML = 'Guardar';
    document.querySelector("#formVstables").reset();
    $("#modalformVstables").modal('show');
}


// EDITAR TABLA
function fntEditVstables(idTAB)
{
    document.querySelector('#titleModal').innerHTML = 'Editar Tabla';
    document.querySelector('.modal-header').classList.replace('headerRegister','headerUpdate');
    document.querySelector('#btnActionForm').classList.replace('btn-primary','btn-info');
    document.querySelector('#btnText').innerHTML = 'Actualizar';

    var tabID   = idTAB;
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = base_url+"Vstables/getVstable/"+tabID;

    request.open("GET",ajaxUrl,true);
    request.send();

    request.onreadystatechange = function()
    {
        if(request.readyState == 4 && request.status == 200)
        {
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {  
                // ID Tabla
                document.querySelector('#idSec_id').value = objData.data.SEC_ID;

                // COMBO: Estado
                document.querySelector('#listStatus').value = objData.data.ESTATU;
                $('#listStatus').selectpicker('render');

                // COMBO: Tabla
                document.querySelector('#listTab_no').value = objData.data.TAB_NO;
                $('#listTab_no').selectpicker('render');

                // Código
                document.querySelector('#txtSub_no').value = objData.data.SUB_NO;

                // Valor
                document.querySelector('#listValors').value = objData.data.VALORS;
                document.querySelector('#listValor2').value = objData.data.VALOR2;

                // Nombre
                document.querySelector('#txtSub_nm').value = objData.data.SUB_NM;
                
                $('#modalformVstables').modal('show');
            }else{
                swal("Error",objData.msg,"error");
            }
        }
    }
}
