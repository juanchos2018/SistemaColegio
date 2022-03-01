<?php

	// Heredamos la clase: Controllers
	class Vstables extends Controllers{

		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
			getPermisos(18);
		}


		public function Vstables()
		{
			$data['page_id'] 	= 18;
			$data['page_tag'] 	= 'Tablas Generales';
			$data['page_name'] 	= 'tablas';
			$data['page_title'] = 'Tablas Generales';
			$this->views->getView($this,"vstables",$data);
		}


		// LLENA COMBO ENTIDADES FINANCIERAS Internas
		public function getBank()
		{
			$htmlOptions = "";
			$htmlOptions .= '<option value="" selected>'.'Seleccione Entidad Financiera'.'</option>';

			$arrData = $this->model->selectBank();
			if(count($arrData) > 0)
			{
				for($i = 0; $i < count($arrData); $i++)
				{
					$htmlOptions .= '<option value="'.trim($arrData[$i]['BAN_NO']).'">'.trim($arrData[$i]['BAN_NM']).' - '.trim($arrData[$i]['CTANUM']).'</option>';
				}
			}
			echo $htmlOptions;
			die();
		}


		// LLENA COMBO TABLAS 
		public function getTable()
		{
			$strIdIns = $_POST['tab_no'];

			$htmlOptions = "";
			$htmlOptions .= '<option value="" selected>'.'Seleccione'.'</option>';

			$arrData = $this->model->selectTable($strIdIns);
			if(count($arrData) > 0)
			{
				for($i = 0; $i < count($arrData); $i++)
				{
					$htmlOptions .= '<option value="'.trim($arrData[$i]['SUB_NO']).'">'.trim($arrData[$i]['SUB_NM']).'</option>';
				}
			}
			echo $htmlOptions;
			die();
		}


		// LLENA COMBO CABECERAS DE TABLAS
		public function getTabhea()
		{
			$htmlOptions = "";
			$htmlOptions .= '<option value="" selected>'.'Seleccione'.'</option>';

			$arrData = $this->model->selectTabhea();
			if(count($arrData) > 0)
			{
				for($i = 0; $i < count($arrData); $i++)
				{
					$htmlOptions .= '<option value="'.$arrData[$i]['TAB_NO'].'">'.$arrData[$i]['TAB_NM'].'</option>';
				}
			}
			echo $htmlOptions;
			die();
		}


		public function getVstables()
		{
			$arrData = $this->model->selectVstables();
			for ($i = 0; $i < count($arrData); $i++) 
			{
				switch($arrData[$i]['ESTATU'])
				{
					case 1:  // Activo
						$arrData[$i]['ESTATU'] = '<span class="badge badge-success">Activo</span>';
						break;
					case 0:  // Inactivo
						$arrData[$i]['ESTATU'] = '<span class="badge badge-danger">Inactivo</span>';
						break;
				}
				
				$arrData[$i]['options'] = '<div class="text-center">
				<button class="btn btn-info btn-sm btnEditVstables" onClick="fntEditVstables('.$arrData[$i]['SEC_ID'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>
				</div>';  
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		// EXTRAE UNA TABLA
		public function getVstable(int $idSec)
		{
			$intSec_no = intval(strClean($idSec));
			if($intSec_no > 0)
			{
				$arrData = $this->model->oneVstable($intSec_no);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}


		// TABLAS
		public function setVstables()
		{
			$intSec_id        = intval($_POST['idSec_id']);
			$strTab_no		  = strClean($_POST['listTab_no']);
			$strSub_no        = strClean($_POST['txtSub_no']);
			$strSub_nm        = strClean($_POST['txtSub_nm']);
			$intEstatu        = intval($_POST['listStatus']);
			$intValors        = $_POST['listValors'];
			$intValor2        = $_POST['listValor2'];

			if($intSec_id == 0)
			{
				// Crea una Tabla
				$request_Vstables = $this->model->insertVstables($strTab_no, $strSub_no, $strSub_nm, $intEstatu, $intValors, $intValor2);
				$opcion = 1;
			}else{
				$request_Vstables = $this->model->updateVstables($intSec_id, $strTab_no, $strSub_no, $strSub_nm, $intEstatu, $intValors, $intValor2);
				$opcion = 2;
			}

			if($request_Vstables > 0)
			{
				switch($opcion)
				{
					case 1:
						$arrResponse = array('status' => true, 'msg' => 'Tabla guardado con éxito.');
						break;
					case 2:
						$arrResponse = array('status' => true, 'msg' => 'Tabla actualizado con éxito.');
						break;
				}
			}else if($request_Vstables == -1){
				$arrResponse = array('status' => false, 'msg' => '!!! ATENCIÓN. Tabla ya existe.');
			}else{
				$arrResponse = array('status' => false, 'msg' => 'No es posible almacenar la información.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die(); 
		}
	}
