<?php

	// Heredamos la clase: Controllers
	class Vstudent extends Controllers{

		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
			getPermisos(2);
		}


		public function Vstudent()
		{
			$data['page_id'] 	= 2;
			$data['page_tag'] 	= 'Ficha Estudiantil';
			$data['page_name'] 	= 'ficha_estudiantil';
			$data['page_title'] = 'Ficha Estudiantil';
			$this->views->getView($this,"vstudent",$data);
		}


		// GESTIONA PROMOVER A UN ESTUDIANTE AL SIGUIENTE CURSO LECTIVO
		public function getStdPromot()
		{
			$codPerios 	= $_POST['codPerios'];
			$codStd_no 	= $_POST['codStd_no'];
			$codSec_no 	= $_POST['codSec_no'];
			$arrData 	= $this->model->getStdPromot($codPerios,$codStd_no,$codSec_no);

			if($arrData > 0)
			{
				$arrResponse = array('status' => true, 'msg' => 'Estudiante promovido con éxito.');
			}else if($arrData == -1){
				$arrResponse = array('status' => false, 'msg' => 'Estudiante no es promovido falta Aperturar Periodo.');
			}else{
				$arrResponse = array('status' => false, 'msg' => 'Estudiante no es promovido porque no Aprueba Periodo Lectivo.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die();
		}


		public function prnStdPrn()
		{
			$prnPerios = $_POST['listPerio2'];
			$prnSec_no = 0;

			$empresa     	= datos_empresa();
			$maestroDetalle = $this->model->getVsstdPrn($prnPerios);
				
			$data['page_tag']   	= 'Informe Estudiantes';
			$data['page_title'] 	= 'INFORME <small>Matrículas</small>';
			$data['page_name']  	= 'Informe';
			$data['perios'] 		= $prnPerios;
			$data['maestro_detalle'] = $maestroDetalle;
			$data['empresa'] 		= $empresa;
			$this->views->getView($this,"vsstdlis",$data);
		}


		public function getVstudents()
		{
			$arrData = $this->model->selectVstudent();
			for ($i = 0; $i < count($arrData); $i++) 
			{
				// SWITCH de Opciones:
				$opcion = $arrData[$i]['ESTATU'];
				switch($opcion)
				{
					case 0:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">Aspirante</span>';
						break;
					case 1:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-warning">Admitido</span>';
						break;
					case 2:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-success">Matriculado</span>';
						break;
					case 3:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">Retirado</span>';
						break;
					case 4:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-success">Viene con Pase</span>';
						break;
					case 5:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">Egresado</span>';
						break;
					case 6:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">Desertor</span>';
						break;
					case 7:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">NEE Discapacitado</span>';
						break;
					case 8:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">NEE No discapactitado</span>';
						break;
					case 9:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">Sin documentos</span>';
						break;
					case 10:
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">No matriculado</span>';
						break;
				}
				
				$btnPrnVstudent  = "";
				$btnVieVstudent  = "";
				$btnEdiVstudent  = "";
				$color_boton     = 'class="btn btn-success btn-sm"';

		
				if($_SESSION['permisosMod']['r'] AND $_SESSION['userData']['rol_id'] !=5)
				{
					$btnPrnVstudent = '<a '.$color_boton.' title= "Acta de Matrícula" href="'.base_url().'Vstudent/getActStd/'.$arrData[$i]['STD_NO'].'"><i class="fas fa-print"></i></a>';
					$btnVieVstudent = '<button class="btn btn-warning btn-sm btnQueryVstudent" onClick="fntQueryVstudent('.$arrData[$i]['STD_NO'].')" title="Consultar"><i class="fas fa-eye"></i></button>';
				}

				if($_SESSION['permisosMod']['u'])
				{
					$btnEdiVstudent = '<button class="btn btn-info btn-sm btnEditVstudent" onClick="fntEditVstudent('.$arrData[$i]['STD_NO'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
				}

				$arrData[$i]['options'] = '<div class="text-center"> '.$btnPrnVstudent.' '.$btnVieVstudent.' '.$btnEdiVstudent.'</div>';
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}

		
		// Funcion para ACTA DE MATRICULA
		public function getActStd(int $secID)
		{	
			$datosEmpresa  	= datos_empresa();
			$maestroDetalle = $this->model->getStdAct($secID,$datosEmpresa['AMI_ID']);

			$data['page_tag'] 		= 'Acta de Matrícula';
			$data['page_title'] 	= 'ACTA <small>de Matrícula</small>';
			$data['page_name'] 		= 'Acta';
			$data['maestro_detalle'] = $maestroDetalle;
			$this->views->getView($this,"vsactstd",$data);	
		}


		// OBTIENE UN REGISTRO
		public function getVstudent(int $idSTD)
		{
			$intSTD = intval(strClean($idSTD));
			if($intSTD > 0)
			{
				$arrData = $this->model->oneVstudent($intSTD);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Estudiante no encontrado.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}


		// Funcion para llenar combo de estudiantes
		public function getComboStudent()
		{
			$htmlOptions = "";
			$htmlOptions .= '<option value="" selected>'.'Seleccione Estudiante'.'</option>';

			$arrData = $this->model->selectVstudent();
			if(count($arrData) > 0)
			{
				for($i = 0; $i < count($arrData); $i++)
				{
					$htmlOptions .= '<option value="'.$arrData[$i]['STD_NO'].'">'.$arrData[$i]['LAS_NM'].' '.$arrData[$i]['FIR_NM'].'</option>';
				}
			}
			echo $htmlOptions;
			die();
		}


		public function setVstudent()
		{
			$intIdSTD 		  = intval($_POST['idStd']);
			$strLas_nm        = strClean($_POST['txtLas_nm']);
			$strFir_nm        = strClean($_POST['txtFir_nm']);
			$strAddres        = strClean($_POST['txtAddres']);
			$strTphone        = strClean($_POST['txtTphone']);
			$strIdtype        = strClean($_POST['listIdtype']);
			$strIde_no        = strClean($_POST['txtIde_no']);
			$intStdgen        = intval($_POST['listStdgen']);
			$datFecbir        = strClean($_POST['datFecbir']);
			$strStdmai        = strClean($_POST['txtStdmai']);
			$intTt_who        = intval($_POST['listTt_who']);
			$strFatlas        = strClean($_POST['txtFatlas']);
			$strFatnam        = strClean($_POST['txtFatnam']);
			$strFatadr        = strClean($_POST['txtFatadr']);
			$strFatfon        = strClean($_POST['txtFatfon']);
			$strFatype        = strClean($_POST['listFatype']);
			$strFatced        = strClean($_POST['txtFatced']);
			$strFatjob        = strClean($_POST['txtFatjob']);
			$datFatbir        = strClean($_POST['datFatbir']);
			$strFatmai        = strClean($_POST['txtFatmai']);
			$strMotlas        = strClean($_POST['txtMotlas']);
			$strMotnam        = strClean($_POST['txtMotnam']);
			$strMotadr        = strClean($_POST['txtMotadr']);
			$strMotfon        = strClean($_POST['txtMotfon']);
			$strMotype        = strClean($_POST['listMotype']);
			$strMotced        = strClean($_POST['txtMotced']);
			$strMotjob        = strClean($_POST['txtMotjob']);
			$datMotbir        = strClean($_POST['datMotbir']);
			$strMotmai        = strClean($_POST['txtMotmai']);
			$strReplas        = strClean($_POST['txtReplas']);
			$strRepnam        = strClean($_POST['txtRepnam']);
			$strRepadr        = strClean($_POST['txtRepadr']);
			$strRepfon        = strClean($_POST['txtRepfon']);
			$strRetype        = strClean($_POST['listRetype']);
			$strRepced        = strClean($_POST['txtRepced']);
			$strRepjob        = strClean($_POST['txtRepjob']);
			$datRepbir        = strClean($_POST['datRepbir']);
			$strRepmai        = strClean($_POST['txtRepmai']);
			$strPerson        = strClean($_POST['txtPerson']);
			$strPeradr        = strClean($_POST['txtPeradr']);
			$strPerfon        = strClean($_POST['txtPerfon']);
			$intFacwho        = intval($_POST['listFacwho']);
			$strRazons        = strClean($_POST['txtRazons']);
			$strDirecc        = strClean($_POST['txtDirecc']);
			$strTlf_no        = strClean($_POST['txtTlf_no']);
			$strCltype        = strClean($_POST['listCltype']);
			$strRuc_no        = strClean($_POST['txtRuc_no']);
			$strEmails        = strClean($_POST['txtEmails']);
			$intEstatu        = intval($_POST['listStatus']);
			$strLassch        = strClean($_POST['txtLassch']);
			$strRemark        = strClean($_POST['txtRemark']);
			$intPerios        = intval($_POST['listPerios']);
			$intSec_no        = intval($_POST['listSec_no']);
			$intMatnum        = intval($_POST['listMatnum']);
			$intFolnum        = intval($_POST['listFolnum']);
			$datFecmat        = strClean($_POST['datFecmat']);

			if($intIdSTD == 0)
			{
				// Crea un estudiante
				$opcion = 1;
				$request_Vstudent = $this->model->insertVstudent($strLas_nm, $strFir_nm, $strAddres, $strTphone, $strIdtype, $strIde_no, $intStdgen, $datFecbir, $strStdmai, $intTt_who, $strFatlas, $strFatnam, $strFatadr, $strFatfon, $strFatype, $strFatced, $strFatjob, $datFatbir, $strFatmai, $strMotlas, $strMotnam, $strMotadr, $strMotfon, $strMotype, $strMotced, $strMotjob, $datMotbir, $strMotmai, $strReplas, $strRepnam, $strRepadr, $strRepfon, $strRetype, $strRepced, $strRepjob, $datRepbir, $strRepmai, $strPerson, $strPeradr, $strPerfon, $intFacwho, $strRazons, $strDirecc, $strTlf_no, $strCltype, $strRuc_no, $strEmails, $intEstatu, $strLassch, $strRemark, $intPerios, $intSec_no, $intMatnum, $intFolnum, $datFecmat);
			}else{
				$opcion = 2;
				$request_Vstudent = $this->model->updateVstudent($intIdSTD, $strLas_nm, $strFir_nm, $strAddres, $strTphone, $strIdtype, $strIde_no, $intStdgen, $datFecbir, $strStdmai, $intTt_who, $strFatlas, $strFatnam, $strFatadr, $strFatfon, $strFatype, $strFatced, $strFatjob, $datFatbir, $strFatmai, $strMotlas, $strMotnam, $strMotadr, $strMotfon, $strMotype, $strMotced, $strMotjob, $datMotbir, $strMotmai, $strReplas, $strRepnam, $strRepadr, $strRepfon, $strRetype, $strRepced, $strRepjob, $datRepbir, $strRepmai, $strPerson, $strPeradr, $strPerfon, $intFacwho, $strRazons, $strDirecc, $strTlf_no, $strCltype, $strRuc_no, $strEmails, $intEstatu, $strLassch, $strRemark, $intPerios, $intSec_no, $intMatnum, $intFolnum, $datFecmat);
			}
			
			if($request_Vstudent > 0)
			{
				switch($opcion)
				{
					case 1:
						$arrResponse = array('status' => true, 'msg' => 'Estudiante guardado con éxito.');
						break;
					default:
						$arrResponse = array('status' => true, 'msg' => 'Estudiante actualizado con éxito.');
						break;
				}
			}else if($request_Vstudent == -1){
				$arrResponse = array('status' => false, 'msg' => 'Estudiante ya existe.');
			}else{
				$arrResponse = array('status' => false, 'msg' => 'No es posible almacenar la información.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die(); 
		}
	}
