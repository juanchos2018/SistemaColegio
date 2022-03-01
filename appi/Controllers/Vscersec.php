<?php

	// Heredamos la clase: Controllers
	class Vscersec extends Controllers{

		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
		}

		public function Vscersec()
		{
			// Se incluye el arreglo DATA, que tiene informacion de la pagina ...
			$data['page_id'] = 12;
			$data['page_tag'] = 'Certificados por Sección';
			$data['page_name'] = 'certificados_por_seccion';
			$data['page_title'] = 'Certificados por Sección';
			$this->views->getView($this,"vscersec",$data);
		}

		public function getVscersecs()
		{
			$arrData = $this->model->selectVscersec();
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
				<button class="btn btn-success btn-sm btnEditVscersec" onClick="fntEditVscersec('.$arrData[$i]['SEC_NO'].')" title="Certificado"><i class="fas fa-print"></i></button>
				</div>';  
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}

		// Extrae la informacion de una seccion .....
		public function getVscersec(int $idSec)
		{
			$intSec_no = intval(strClean($idSec));
			if($intSec_no > 0)
			{
				$arrData = $this->model->oneVscersec($intSec_no);
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


		public function setVscersec()
		{
			
		}
    }
