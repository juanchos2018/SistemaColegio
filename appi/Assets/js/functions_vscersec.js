$(document).ready(function() {
    $('#TableVscersec').DataTable({
    	"language":{
			"url": "//cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json"	
		},
    	"ajax": {
    		"url": ""+base_url+"Vscersec/getVscersecs",
    		"dataSrc":""
    	},
        "columns":[
            {"data": "options"},
            {"data": "SEC_NM"},
            {"data": "PARALE"},
            {"data": "JOR_NO"}
        ],
    	responsive:true,
    	destroy:true,
    	"displayLength":10,
		"order":[[0,"asc"]]
    });

    // Nueva Sección
    var formVscersec = document.querySelector("#formVscersec");
    
    	formVscersec.onsubmit = function(e)
    	{
    		e.preventDefault(); //previene que se recargue el formulario o pagina...

			var request  = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');		
    		var ajaxUrl  = base_url+"Vscersec/setVscersec";
			var formData = new FormData(formVscersec);
			
    		request.open("POST",ajaxUrl,true);
			request.send(formData);	
			request.onreadystatechange = function()
    		{
    			if(request.readyState == 4 && request.status == 200)
    			{					 
    				var objData = JSON.parse(request.responseText);			
					//var recibido =$.parseJSON(data);
							
    				if(objData.status)
    				{
    					$('#modalFormVscersec').modal('hide');
    					formVscersec.reset();
    					swal('Sección',objData.msg,'success');
    					TableVscersec.api().ajax.reload(function(){});
    				}else {
    					swal('ERROR: ',objData.msg,'error');
    				}
    			}    			
    		}
    	}
});


function openModalCSec()
{
	$("#modalformVscersec").modal('show');
}


function fntEditVscersec(idSTD)
{
    document.querySelector('#titleModal').innerHTML = 'Certificado Sección';
    document.querySelector('.modal-header').classList.replace('headerRegister','headerUpdate');
    document.querySelector('#btnActionForm').classList.replace('btn-primary','btn-info');
    document.querySelector('#btnText').innerHTML = 'Aceptar';

    var stdID   = idSTD;
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = base_url+"Vscersec/getVscersec/"+stdID;

    request.open("GET",ajaxUrl,true);
    request.send();

    request.onreadystatechange = function()
    {
        if(request.readyState == 4 && request.status == 200)
        {
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {  
               // COMBO: Sección
               $opcion = objData.data.SEC_NO;
               document.querySelector('#listSec_no').value = $opcion;
               $('#listSec_no').selectpicker('render');
                
                document.querySelector("#formVscersec").reset();
                fntGetPerios();      
                $('#modalformVscersec').modal('show');
            }else {
                swal("Error",objData.msg,"error");
            }
        }
    }
}
