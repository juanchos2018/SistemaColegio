var TablaVsactsav;

$(document).ready(function() {
    TablaVsactsav = $('#TableVsactsav').DataTable({
    	"language":{
			"url": "//cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json"	
		},
    	"ajax": {
    		"url": base_url+"Vsactsav/getVsactsavs",
    		"dataSrc":""
    	},
        "columns":[
            {"data": "options"},
            {"data": "SEC_NM"},
            {"data": "PARALE"},
            {"data": "MAT_NM"},
            {"data": "REGIME"},
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


    // Evento click del boton: Imprime Acta por Asignatura
    $('#btnPrnActSav').on('click',function()
    {
        let request  = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');     
        let ajaxUrl  = base_url+"Vsactsav/prnActSav";
        let formData = new FormData(formVsactsav);

        request.open("POST",ajaxUrl,true);
        request.send(formData); 

        request.onreadystatechange = function()
        {
            if(request.readyState == 4 && request.status == 200)
            {   
                $('#modalformVsactsav').modal('hide');
                $('.modal-body').html(request.responseText);
                $('#modvsActSav').modal('show');
            }
        }
    });
});


function fntEditVsactsav(idSTD)
{
    let stdID   = idSTD;
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+"Vsactsav/getVsactsav/"+stdID;

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
			    document.querySelector('#listSec_no').value = objData.data.SEC_NO;
			    $('#listSec_no').selectpicker('render');

			    // COMBO: Asignatura
			    document.querySelector('#listMat_no').value = objData.data.MAT_NO;
			    $('#listMat_no').selectpicker('render');
		  
                fntGetPerios();
                
                $('#modalformVsactsav').modal('show');
            }else{
                swal("Error",objData.msg,"error");
            }
        }
    }
}
