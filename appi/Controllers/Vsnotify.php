<?php

	// Heredamos la clase: Controllers
	class Vsnotify extends Controllers{

		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
			getPermisos(7);
		}


		public function Vsnotify()
		{
			// Se incluye el arreglo DATA, que tiene informacion de la pagina ...
			$data['page_id'] 	= 7;
			$data['page_tag'] 	= 'Notificaciones';
			$data['page_name'] 	= 'notificacion';
			$data['page_title'] = 'Notificaciones';
			$this->views->getView($this,"vsnotify",$data);
		}

		
		// OBTIENE UN REGISTRO
		public function getVsnotify(int $secId)
		{
			$intSTD = intval($secId);
			if($intSTD > 0)
			{
				$arrData = $this->model->oneVsnotify($intSTD);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Notificación no encontrada.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}


		public function getVsnotifys()
		{
			$arrData = $this->model->selectVsnotify();
			for ($i=0; $i < count($arrData); $i++) 
			{
				$btnVieVsnotify  	= "";
				$btnEdiVsnotify  	= "";
				$btnDelVsnotify  	= "";
				$color_boton_task	= 'class="btn btn-info btn-sm btnEditVsnotify"';

				if($_SESSION['permisosMod']['r'])
				{
					$btnVieVsnotify = '<button '.$color_boton_tstd.' onClick="fntViewVsnotify('.$arrData[$i]['SEC_ID'].')" title="Consultar"><i class="fas fa-eye"></i></button>';
				}

				if($_SESSION['permisosMod']['u'])
				{
					$btnEdiVsnotify = '<button '.$color_boton_task.' onClick="fntEditVsnotify('.$arrData[$i]['SEC_ID'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
				}

				if($_SESSION['permisosMod']['d'])
				{
					$btnDelVsnotify = '<button class="btn btn-danger btn-sm btnDelVsnotify" onClick="fntDelVsnotify('.$arrData[$i]['SEC_ID'].')" title="Eliminar"><i class="fas fa-trash-alt"></i></button>';
				}

				$arrData[$i]['options'] = '<div class="text-center"> '.$btnVieVsnotify.' '.$btnEdiVsnotify.' '.$btnDelVsnotify.'</div>';
				$arrData[$i]['LAS_NM'] 	= $arrData[$i]['LAS_NM'].' '.$arrData[$i]['FIR_NM'];
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		public function setVsnotify()
		{
			$intSec_id        = intval($_POST['idSec_id']);
			$intPerios        = intval($_POST['listPerios']);
			$strFecreg        = strClean($_POST['datFecreg']);
			$strHorreg        = strClean($_POST['txtHorreg']);
			$intSec_no        = intval($_POST['listSec_no']);
			$intMat_no        = intval($_POST['listMat_no']);
			$intStd_no        = intval($_POST['listStd_no']);
			$intEmp_no        = intval($_POST['listEmp_no']);
			$strSchedu        = strClean($_POST['txtSchedu']);

			if($intSec_id == 0)
			{
				// Crea una Notificación
				$request_Vsnotify = $this->model->insertVsnotify($intPerios, $strFecreg, $strHorreg, $intSec_no, $intMat_no, $intStd_no, $intEmp_no, $strSchedu);
				$opcion = 1;
			}else{
				$request_Vsnotify = $this->model->updateVsnotify($intSec_id, $intPerios, $strFecreg, $strHorreg, $intSec_no, $intMat_no, $intStd_no, $intEmp_no, $strSchedu);
				$opcion = 2;
			}

			if($request_Vsnotify > 0)
			{
				switch($opcion)
				{
					case 1:
						$arrResponse = array('status' => true, 'msg' => 'Notificación guardada con éxito.');
						break;
					case 2:
						$arrResponse = array('status' => true, 'msg' => 'Notificación actualizada con éxito.');
						break;
				}
			}else if($request_Vsnotify == -1){
				$arrResponse = array('status' => false, 'msg' => '!!! ATENCIÓN. Notificación ya existe.');
			}else if($request_Vsnotify == -2){
				$arrResponse = array('status' => false, 'msg' => '!!! ATENCIÓN. Reparto: Sección Asignatura es incorrecto.');
			}else{
				$arrResponse = array('status' => false, 'msg' => 'Información escogida para almacenar no es coincidente.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die(); 
		}
	}
