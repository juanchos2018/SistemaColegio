var TablaVstudent;

$(document).ready(function() {

        TablaVstudent = $('#TableVstudent').DataTable({

        initComplete: function () {
            // Apply the search
            this.api().columns().every( function () {
                var that = this;
 
                $( 'input', this.footer() ).on( 'keyup change clear', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );
        },

    	"language":{
			"url": "//cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json"	
		},
    	"ajax": {
    		"url": base_url+"Vstudent/getVstudents",
    		"dataSrc":""
    	},
        "columns":[
            {"data": "options"},   
            {"data": "LAS_NM"},
            {"data": "FIR_NM"},
            {"data": "PERIOS"},
            {"data": "ESTATU"},
            {"data": "SEC_NM"},
            {"data": "PARALE"}
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

            { 'className': "anchofecha", "targets": [ 0 ]},
            { 'className': "anchocelda", "targets": [ 1 ]},
            { 'className': "anchocelda", "targets": [ 2 ]},
            { 'className': "anchofecha", "targets": [ 3 ]},
            { 'className': "anchocelda", "targets": [ 4 ]},
            { 'className': "anchocelda", "targets": [ 5 ]},
            { 'className': "anchocelda", "targets": [ 6 ]}
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

    
    // Evento click del boton: Promover Estudiante
    $('#btnStdPromot').on('click',function()
    {
        let codPerios = document.getElementById('listPerios').value;
        let codStd_no = document.getElementById('idStd').value;
        let codSec_no = document.getElementById('listSec_no').value;

        let strData = "codPerios="+codPerios+"&codStd_no="+codStd_no+"&codSec_no="+codSec_no;
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url+'Vstudent/getStdPromot'; 
        
        request.open("POST",ajaxUrl,true);
        request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        request.send(strData);
    
        request.onreadystatechange = function()
        {
			let objData = JSON.parse(request.responseText);			
			if(objData.status)
			{
    			swal('Estudiante',objData.msg,'success');
				$('#modalformVstudent').modal('hide');
				TablaVstudent.ajax.reload(null,false);
            }else{
        		swal('ERROR: ',objData.msg,'error');
            }
        }
    });


    // Evento click del boton: Imprime Lista de Estudiantes
    $('#btnPrnStdLis').on('click',function()
    {
        let request  = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');     
        let ajaxUrl  = base_url+"Vstudent/prnStdPrn";
        let formData = new FormData(formVsstdlis);

        request.open("POST",ajaxUrl,true);
        request.send(formData); 
        request.onreadystatechange = function()
        {
            if(request.readyState == 4 && request.status == 200)
            {
                $('#modalformVsstdlis').modal('hide');
                $('.modal-body').html(request.responseText);
                $('#modvsStdPrn').modal('show');
            }
        }
    });


    // AGREGAR ESTUDIANTE
    var formVstudent = document.querySelector("#formVstudent");    
   	formVstudent.onsubmit = function(e)
    {
   		e.preventDefault(); //previene que se recargue el formulario o pagina...
      
		var request  = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');	
   		var ajaxUrl  = base_url+"Vstudent/setVstudent";
   		var formData = new FormData(formVstudent);

   		request.open("POST",ajaxUrl,true);
		request.send(formData);
			
        request.onreadystatechange = function(){
		if(request.readyState == 4 && request.status == 200)
		{					 
			let objData = JSON.parse(request.responseText);			

			if(objData.status)
			{
				$('#modalformVstudent').modal('hide');
				formVstudent.reset();
    			swal('Estudiante',objData.msg,'success');
				TablaVstudent.ajax.reload(null,false);
			}else{
        		swal('ERROR: ',objData.msg,'error');
   			}
   		}    			
   	}
}
});



// ESTUDIANTE
function openModalStd()
{
    document.querySelector('#idStd').value = 0;
    document.querySelector('#listStatus').value = 0;
    $('#listStatus').selectpicker('render');
    document.querySelector('#listSec_no').value = "";
    $('#listSec_no').selectpicker('render');
    document.querySelector('#listStdgen').value = "";
    $('#listStdgen').selectpicker('render');
    document.querySelector('#listTt_who').value = "";
    $('#listTt_who').selectpicker('render');
    document.querySelector('#listFacwho').value = "";
    $('#listFacwho').selectpicker('render');
    
    document.querySelector('#titleModal').innerHTML = 'Nuevo Estudiante';
    document.querySelector('.modal-header').classList.replace('headerUpdate','headerRegister');
    document.querySelector('#btnActionForm').classList.replace('btn-info','btn-primary');
    document.querySelector('#btnText').innerHTML = 'Guardar';

    document.querySelector("#formVstudent").reset();
    fntGetPerios();
	$("#modalformVstudent").modal('show');
}


// INFORME ESTUDIANTES
function openModalLst()
{
    document.querySelector("#formVsstdlis").reset();    
    fntGetPerios();
	$("#modalformVsstdlis").modal('show');
}


// EDITAR ESTUDIANTE
function fntEditVstudent(idSTD)
{
    document.querySelector('#titleModal').innerHTML = 'Editar Estudiante';
    document.querySelector('.modal-header').classList.replace('headerRegister','headerUpdate');
    document.querySelector('#btnActionForm').classList.replace('btn-primary','btn-info');
    document.querySelector('#btnText').innerHTML = 'Actualizar';

    var stdID = idSTD;
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = base_url+"Vstudent/getVstudent/"+stdID;

    request.open("GET",ajaxUrl,true);
    request.send();

    request.onreadystatechange = function()
    {
        if(request.readyState == 4 && request.status == 200)
        {
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {  
                // ID del Estudiante .....
                document.querySelector('#idStd').value = objData.data.STD_NO;

                // COMBO: Condicion Estudiante .....
                $opcion = objData.data.ESTATU;
                document.querySelector('#listStatus').value = $opcion;
                $('#listStatus').selectpicker('render');

                // Año Lectivo .....
                document.querySelector('#listPerios').value = objData.data.PERIOS;

                // Número Matrícula
                document.querySelector('#listMatnum').value = objData.data.MATNUM;

                // Número Folio
                document.querySelector('#listFolnum').value = objData.data.FOLNUM;

                // Fecha Matrícula
                document.querySelector('#datFecmat').value = objData.data.FECMAT;

                // COMBO: Sección .....
                $opcion = objData.data.SEC_NO;
                document.querySelector('#listSec_no').value = $opcion;
                $('#listSec_no').selectpicker('render');

                // Apellidos y Nombres del Estudiante .....
                document.querySelector('#txtLas_nm').value = objData.data.LAS_NM;
                document.querySelector('#txtFir_nm').value = objData.data.FIR_NM;
               
                // Dirección y Teléfonos del Estudiante .....
                document.querySelector('#txtAddres').value = objData.data.ADDRES;
                document.querySelector('#txtTphone').value = objData.data.TPHONE;

                // COMBO: Tipo Identificacion ....
                $opcion = objData.data.IDTYPE;
                document.querySelector('#listIdtype').value = $opcion;
                $('#listIdtype').selectpicker('render');

                // Numero de Identificación ....
                document.querySelector('#txtIde_no').value = objData.data.IDE_NO;

                // Genero ......
                $opcion = objData.data.STDGEN;
                document.querySelector('#listStdgen').value = $opcion;
                $('#listStdgen').selectpicker('render');

                // Fecha de Nacimiento ......
                document.querySelector('#datFecbir').value = objData.data.FECBIR;

                // Emal del Estudiante ...
                document.querySelector('#txtStdmai').value = objData.data.STDMAI;

                // Apellidos y Nombres del Padre ....
                document.querySelector('#txtFatlas').value = objData.data.FATLAS;
                document.querySelector('#txtFatnam').value = objData.data.FATNAM;

                // Direcccion y Telefonos del Padre .....
                document.querySelector('#txtFatadr').value = objData.data.FATADR;
                document.querySelector('#txtFatfon').value = objData.data.FATFON;

                // Tipo Identificacion Padre ....
                $opcion = objData.data.FATYPE;
                document.querySelector('#listFatype').value = $opcion;
                $('#listFatype').selectpicker('render');

                // NUmero Idemtificacion Padre ....
                document.querySelector('#txtFatced').value = objData.data.FATCED;

                // Trabajo-Ocupacion del Padre ...
                document.querySelector('#txtFatjob').value = objData.data.FATJOB;

                // Fecha Nacimiento del Padre ....
                document.querySelector('#datFatbir').value = objData.data.FATBIR;

                // Email del Padre ....
                document.querySelector('#txtFatmai').value = objData.data.FATMAI;

                // Apellidos y Nombres de la Madre ....
                document.querySelector('#txtMotlas').value = objData.data.MOTLAS;
                document.querySelector('#txtMotnam').value = objData.data.MOTNAM;

                // Direcccion y Telefonos de la Madre .....
                document.querySelector('#txtMotadr').value = objData.data.MOTADR;
                document.querySelector('#txtMotfon').value = objData.data.MOTFON;

                // Tipo Identificacion Madre ....
                $opcion = objData.data.MOTYPE;
                document.querySelector('#listMotype').value = $opcion;
                $('#listMotype').selectpicker('render');

                // Numero Idemtificacion Madre ....
                document.querySelector('#txtMotced').value = objData.data.MOTCED;

                // Trabajo-Ocupacion de la Madre...
                document.querySelector('#txtMotjob').value = objData.data.MOTJOB;

                // Fecha Nacimiento de la Madre ....
                document.querySelector('#datMotbir').value = objData.data.MOTBIR;

                // Email de la Madre ....
                document.querySelector('#txtMotmai').value = objData.data.MOTMAI;

                // Representado por: ....
                $opcion = objData.data.TT_WHO;
                document.querySelector('#listTt_who').value = $opcion;
                $('#listTt_who').selectpicker('render');

                // Apellidos y Nombres del Representante ....
                document.querySelector('#txtReplas').value = objData.data.REPLAS;
                document.querySelector('#txtRepnam').value = objData.data.REPNAM;

                // Direcccion y Telefonos del Representante .....
                document.querySelector('#txtRepadr').value = objData.data.REPADR;
                document.querySelector('#txtRepfon').value = objData.data.REPFON;

                // Tipo Identificacion Representante ....
                $opcion = objData.data.RETYPE;
                document.querySelector('#listRetype').value = $opcion;
                $('#listRetype').selectpicker('render');

                // Numero Idemtificacion Representante ....
                document.querySelector('#txtRepced').value = objData.data.REPCED;

                // Trabajo-Ocupacion del Representante...
                document.querySelector('#txtRepjob').value = objData.data.REPJOB;

                // Fecha Nacimiento del Representante ....
                document.querySelector('#datRepbir').value = objData.data.REPBIR;

                // Email del Representante ....
                document.querySelector('#txtRepmai').value = objData.data.REPMAI;

                // Apellidos y Nombres OTRO CONTACTO ....
                document.querySelector('#txtPerson').value = objData.data.PERSON;

                // Direcccion y Telefonos OTRO CONTACTO .....
                document.querySelector('#txtPeradr').value = objData.data.PERADR;
                document.querySelector('#txtPerfon').value = objData.data.PERFON;

                // FACTURACION asumida por: .....
                $opcion = objData.data.FACWHO;
                document.querySelector('#listFacwho').value = $opcion;
                $('#listFacwho').selectpicker('render');

                // RAZON SOCIAL FACTURACION .....
                document.querySelector('#txtRazons').value = objData.data.RAZONS;

                // Direcccion y Telefonos del Cliente .....
                document.querySelector('#txtDirecc').value = objData.data.DIRECC;
                document.querySelector('#txtTlf_no').value = objData.data.TLF_NO;

                // Tipo Identificacion Cliente ....
                $opcion = objData.data.CLTYPE;
                document.querySelector('#listCltype').value = $opcion;
                $('#listCltype').selectpicker('render');

                // Numero Idemtificacion Cliente ....
                document.querySelector('#txtRuc_no').value = objData.data.RUC_NO;

                // Correo para Facturacion .....
                document.querySelector('#txtEmails').value = objData.data.EMAILS;

                // Institucion de Procedencia .....
                document.querySelector('#txtLassch').value = objData.data.LASSCH;

                // Observaciones .....
                document.querySelector('#txtRemark').value = objData.data.REMARK;

                $('#modalformVstudent').modal('show');
            }else{
                swal("Error",objData.msg,"error");
            }
        }
    }
}
