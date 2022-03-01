<?php

	// Heredamos la clase: Controllers
	class Vsactmat extends Controllers{

		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
			getPermisos(11);
		}


		public function Vsactmat()
		{
			$data['page_id'] 	= 11;
			$data['page_tag'] 	= 'Actas de Calificaciones';
			$data['page_name'] 	= 'actas';
			$data['page_title'] = 'Actas de Calificaciones';
			$this->views->getView($this,"vsactmat",$data);
		}


		public function prnActMat()
		{
			$prnPerios = $_POST['listPerios'];
			$prnSec_no = $_POST['listSec_no'];
			$prnMat_no = $_POST['listMat_no'];
			$prnParcia = $_POST['listParci2'];	

			$datosEmpresa 	= datos_empresa();
			$maestroDetalle = $this->model->getVsactdet($prnPerios,$prnSec_no,$prnMat_no,$prnParcia,$datosEmpresa['AMI_ID']);
			
			$data['page_tag']   		= 'Acta Calificaciones';
			$data['page_title'] 		= 'ACTA <small>Calificaciones</small>';
			$data['page_name']  		= 'Acta';
			$data['maestro_detalle'] 	= $maestroDetalle;
			$this->views->getView($this,"vsactone",$data);
		}


		public function getVsactmats()
		{
			$arrData = $this->model->selectVsactmat();
			for ($i = 0; $i < count($arrData); $i++) 
			{
				switch($arrData[$i]['REGIME'])
				{
					case 1:  // Malla
						$arrData[$i]['REGIME'] = '<span class="badge badge-success">Malla</span>';
						break;
					case 2:  // Interno
						$arrData[$i]['REGIME'] = '<span class="badge badge-warning">Interno</span>';
						break;
				}

				$arrData[$i]['options'] = '<div class="text-center">
				<button class="btn btn-success btn-sm btnEditVsactmat" onClick="fntEditVsactmat('.$arrData[$i]['SEC_ID'].')" title="Actas"><i class="fas fa-print"></i></button>
				</div>';  
				$arrData[$i]['LAS_NM'] 	= $arrData[$i]['LAS_NM'].' '.$arrData[$i]['FIR_NM'];
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		// OBTIENE UN REGISTRO
        public function getVsactmat(int $secID)
        {
         	$intSec_id = intval(strClean($secID));
			if($intSec_id > 0)
			{
				$arrData = $this->model->oneVsactmat($intSec_id);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Reparto no encontrado.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
        }  
           

		public function setVsactmat()
		{
		}
	}
