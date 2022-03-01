<?php

	// Heredamos la clase: Controllers
	class Widgets extends Controllers
	{
		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
			getPermisos(20);
		}


		public function widgets()
		{
			// Se calcula numero de registros para:
			// * Aula Virtual
			// * Notificaciones
			// * Ficha Social
			// * Ficha Medica
			// Los numeros de registros se muestran em el WIDGET
			$vschtod = $this->model->num_vschedul_today();
            $vsoctod = $this->model->num_hsocial_today();
            $vhistod = $this->model->num_hclinica_today(); 
			$vschyes = $this->model->num_vschedul_yesterday();
            $vsocyes = $this->model->num_hsocial_yesterday();
            $vhisyes = $this->model->num_hclinica_yesterday(); 

            // Se incluye el arreglo DATA, que tiene informacion de la pagina ...
			$data['page_tag'] 	= 'Appi';
			$data['page_title'] = 'Widgets';
			$data['page_name'] 	= 'widgets';
			$data['reg_vschtod'] = $vschtod['COUNT(*)'];
			$data['reg_vsoctod'] = $vsoctod['COUNT(*)'];
			$data['reg_vhistod'] = $vhistod['COUNT(*)'];
			$data['reg_vschyes'] = $vschyes['COUNT(*)'];
			$data['reg_vsocyes'] = $vsocyes['COUNT(*)'];
			$data['reg_vhisyes'] = $vhisyes['COUNT(*)'];
			
			$this->views->getView($this,"widgets",$data);
		}


		public function barRptStdAsp()
		{
			$data = $this->model->countStdAsp();
            echo json_encode($data,JSON_UNESCAPED_UNICODE);
            die();
		}


		public function barRptStdAct()
		{
			$arrData = $this->model->countStdAct();
			for ($i=0; $i < count($arrData); $i++) 
			{
				// SWICTH de Opciones:
				$opcion = $arrData[$i]['ESTATU'];
				switch($opcion)
				{
				case 1:  // Admitido
					$arrData[$i]['ESTATU'] = 'Admitido';
					break;
				case 2:
					$arrData[$i]['ESTATU'] = 'Matriculado';
					break;
				case 3:
					$arrData[$i]['ESTATU'] = 'Retirado';
					break;
				case 4:
					$arrData[$i]['ESTATU'] = 'Con Pase';
					break;
				case 5:
					$arrData[$i]['ESTATU'] = 'Egresado';
					break;
				case 6:
					$arrData[$i]['ESTATU'] = 'Desertor';
					break;
				case 7:
					$arrData[$i]['ESTATU'] = 'NEE Discapacitado';
					break;
				case 8:
					$arrData[$i]['ESTATU'] = 'NEE No discapacitado';
					break;
				case 9:
					$arrData[$i]['ESTATU'] = 'Sin documentos';
					break;
				case 10:
					$arrData[$i]['ESTATU'] = 'No matriculado';
					break;
				}
			}
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		public function pieRptStdGen()
		{
			$arrData = $this->model->countStdGen();
			for ($i=0; $i < count($arrData); $i++) 
			{
				// SWICTH de Opciones:
				$opcion = $arrData[$i]['STDGEN'];
				switch($opcion)
				{
					case 0:  // Admitido
						$arrData[$i]['STDGEN'] = 'Sin Definir';
						break;
					case 1:
						$arrData[$i]['STDGEN'] = 'Masculino';
						break;
					case 2:
						$arrData[$i]['STDGEN'] = 'Fenenino';
						break;
				}
			}
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();	
		}


		public function barRptEmpProfile()
		{
			$arrData = $this->model->countEmpProfile();
			for ($i=0; $i < count($arrData); $i++) 
			{
				// SWICTH de Opciones:
				$opcion = $arrData[$i]['PROFIL'];
				switch($opcion)
				{
					case 1:
						$arrData[$i]['PROFIL'] = 'System Manager';
						break;
					case 2:
						$arrData[$i]['PROFIL'] = 'Gerencial';
						break;
					case 3:
						$arrData[$i]['PROFIL'] = 'Coordinación';
						break;
					case 4:
						$arrData[$i]['PROFIL'] = 'Secretarial';
						break;
					case 5:
						$arrData[$i]['PROFIL'] = 'Docencia';
						break;
					case 6:
						$arrData[$i]['PROFIL'] = 'Inspección';
						break;
				}
			}
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		public function Reportes()
		{
			$catalogo = $_POST['Catalogo'];
			$fecha = $_POST['Fecha'];
			
			switch($catalogo)
			{
				case 'AulaVirtual':
					$arrData = $this->model->countRegAulaVirtual($fecha);
					break;
				case "Notificacion":
					$arrData = $this->model->countRegNotificacion($fecha);
					break;
				case 'FichaSocial':
					$arrData = $this->model->countRegFchSocial($fecha);
					break;
			   	case 'FichaMedica':
					$arrData = $this->model->countRegFchMedica($fecha);
					break;
		    }
	    
		    $arrResponse = array('Catalogo' => $catalogo, 'data' => $arrData);
		    
		    echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die();
		}

	}