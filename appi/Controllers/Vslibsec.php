<?php

	// Heredamos la clase: Controllers
	class Vslibsec extends Controllers{

		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
		}

		public function Vslibsec()
		{
			// Se incluye el arreglo DATA, que tiene informacion de la pagina ...
			$data['page_id'] = 14;
			$data['page_tag'] = 'Boletines por Sección';
			$data['page_name'] = 'boletines_por_seccion';
			$data['page_title'] = 'Boletines por Sección';
			$this->views->getView($this,"vslibsec",$data);
		}

		public function getVslibsecs()
		{
			$arrData = $this->model->selectVslibsec();
			// Se barre todo el array $arrData ..
			for ($i=0; $i < count($arrData); $i++) 
			{
				// SWITCH de Opciones:
				$opcion = $arrData[$i]['JOR_NO'];
				switch($opcion){
				case 1:  // Matutina
					$arrData[$i]['JOR_NO'] = '<span class="badge badge-success">Matutina</span>';
					break;
				case 2:  // Vespertina
					$arrData[$i]['JOR_NO'] = '<span class="badge badge-warning">Vespertina</span>';
					break;
				case 3:  // Nocturna
					$arrData[$i]['JOR_NO'] = '<span class="badge badge-danger">Nocturna</span>';
					break;
					}

				$arrData[$i]['options'] = '<div class="text-center">
				<button class="btn btn-success btn-sm btnEditVslibsec" onClick="fntEditVslibsec('.$arrData[$i]['SEC_NO'].')" title="Boletín"><i class="fas fa-print"></i></button>
				</div>';  
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		// Extrae la informacion de una seccion .....
		public function getVslibsec(int $idSec)
		{
			$intSec_no = intval(strClean($idSec));
			if($intSec_no > 0)
			{
				$arrData = $this->model->oneVslibsec($intSec_no);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados');
				}else {
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}


		public function setVslibsec()
		{
			$intNiv_no        = intval($_POST['listNiv_no']);
			$strParale        = strClean($_POST['txtParale']);
			$strCur_nm        = strClean($_POST['txtCur_nm']);
			$intPabell        = intval($_POST['listPabell']);
			$intModoes        = intval($_POST['listModoes']);
			$intRegime        = intval($_POST['listRegime']);
			$intJor_no        = intval($_POST['listJor_no']);
			$request_Vslibsec = $this->model->insertVslibsec($intNiv_no, $strParale, $strCur_nm, $intPabell, $intModoes, $intRegime, $intJor_no);
			
			if($request_Vslibsec > 0)
			{
				$arrResponse = array('status' => true, 'msg' => 'Sección guardado con éxito.');
			}else if($request_Vslibsec == 'existe'){
				$arrResponse = array('status' => false, 'msg' => 'Sección ya existe.');
			}else{
				$arrResponse = array('status' => false, 'msg' => 'No es posible almacenar la información.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die(); 
		}
    }
