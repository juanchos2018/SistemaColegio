<?php

	// Heredamos la clase: Controllers
	class Usuarios extends Controllers
	{
		public function __construct()
		{
			parent::__construct();
			session_start();
			
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'Login');
			}
			getPermisos(19);
		}


		public function usuarios()
		{
			if(empty($_SESSION['permisosMod']['r']))
			{
				header("location:".base_url().'Dashboard');
			}

			$data['page_tag'] 		= "Usuarios";
			$data['page_title'] 	= "Usuarios";
			$data['page_name'] 		= 'usuarios';
			$data['page_functions_js'] = "functions_usuarios.js";
			$this->views->getView($this,"usuarios",$data);
		}


		// OBTIENE UN REGISTRO
		public function getUser(int $usuSEC)
		{
			$idUsuario = intval($usuSEC);
			if($idUsuario > 0)
			{
				$arrData = $this->model->selectUsuario($idUsuario); 
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


		// Extrae informacion de la Tabla: VSACCESS
		public function getUsuarios()
		{
			$arrData = $this->model->selectUsuarios();
			for ($i = 0; $i < count($arrData); $i++) 
			{
				$btnView = "";
				$btnEdit = "";
				$btnDel  = "";

				if($arrData[$i]['ESTADO'] == 1) 
				{
					$arrData[$i]['ESTADO'] = '<span class="badge badge-success">Activo</span>';
				}else{
					$arrData[$i]['ESTADO'] = '<span class="badge badge-danger">Inactivo</span>';
				}

				if($_SESSION['permisosMod']['r'])
				{
					$btnView = '<button class="btn btn-warning btn-sm btnViewUser" onClick="fntViewUser('.$arrData[$i]['USU_SEC'].')" title="Consultar"><i class="fas fa-eye"></i></button>';
 				}

				// Validacion del Boton Update: Solo los Superusuarios pueden hacerlo
				if($_SESSION['permisosMod']['u'])
				{
					if((($_SESSION['userData']['USU_SEC'] == 2 OR $_SESSION['userData']['USU_SEC'] == 3 ) AND $_SESSION['userData']['rol_id'] == 1) OR
					   ($_SESSION['userData']['rol_id'] == 1 AND $arrData[$i]['rol_id'] != 1))
					{
						$btnEdit= '<button class="btn btn-info btn-sm btnEditUser" onClick="fntEditUser('.$arrData[$i]['USU_SEC'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
					}else{
						$btnEdit= '<button class="btn btn-secondary btn-sm" disabled><i class="fas fa-pencil-alt"></i></button>';
					}
				}

				// Validacion del boton Eliminar Usuarios: 
				// Se restringe para todos los Admins y los SuperUsuarios, para que no se puedan eliminar asi mismos

				if($_SESSION['permisosMod']['d'])
				{
					if(((($_SESSION['userData']['USU_SEC'] == 2 OR $_SESSION['userData']['USU_SEC'] == 3 ) AND $_SESSION['userData']['rol_id'] == 1) OR
					   ($_SESSION['userData']['rol_id'] == 1 AND $arrData[$i]['rol_id'] != 1)) AND
					   ($_SESSION['userData']['USU_SEC'] != $arrData[$i]['USU_SEC']))
					{
						$btnDel = '<button class="btn btn-danger btn-sm btnDelUser" onClick="fntDelUser('.$arrData[$i]['USU_SEC'].')" title="Eliminar"><i class="fas fa-trash-alt"></i></button>';
					}else{
						$btnDel = '<button class="btn btn-secondary btn-sm" disabled><i class="fas fa-trash-alt"></i></button>';
					}
				}

				$arrData[$i]['options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDel.'</div>';
			}

			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}


		public function delUsuario()
		{
			$intSec = intval($_POST['idSec']);
			$request = $this->model->deleteUsuario($intSec);
			if($request == 'ok')
			{
				$arrResponse = array('status' => true, 'msg' => 'Se ha eliminado el Registro.');
			}else{
				$arrResponse = array('status' => false, 'msg' => 'Error al eliminar el Registro.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die();	
		}


		public function setUsuario()
		{
			$intIdSec 	  	= intval($_POST['idSec']);
			$strUsuario 	= strclean($_POST['txtUsuario']); 
			$strAlias 		= strclean($_POST['txtAlias']);
    		$strNombre 		= strclean($_POST['txtNombre']);
			$strPto_no 		= strclean($_POST['txtPto_no']);
    		$strClave 		= strclean($_POST['txtClave']);
    		$intTipousuario = intval($_POST['listRol']);
    		$intEmp 		= intval($_POST['txtEmp']);  
    		$intStatus 		= intval($_POST['listEstado']);

			if($intIdSec == 0)
			{
				// Crea un Usuario
				$opcion = 1;
				$request_user = $this->model->insertUsuario($strUsuario,$strAlias,$strNombre,$strClave,$intTipousuario,$intEmp,$strPto_no,$intStatus);
			}else{
				$opcion = 2;
				$request_user = $this->model->updateUsuario($intIdSec,$strUsuario,$strAlias,$strNombre,$strClave,$intTipousuario,$intEmp,$strPto_no,$intStatus);
			}
					
			if($request_user > 0)
			{
				switch($opcion)
				{
					case 1:
						$arrResponse = array('status' => true, 'msg' => 'Usuario guardado con éxito.');
						break;
					case 2:
						$arrResponse = array('status' => true, 'msg' => 'Usuario actualizado con éxito.');
						break;
				}
    		}else if ($request_user == "existe"){
				$arrResponse = array('status' => false, 'msg' => '!!! ATENCIÓN. Usuario ya existe.');
			}else if ($request_user == "automat"){
				$arrResponse = array('status' => false, 'msg' => '!!! ATENCIÓN. Tipo de Usuario debe ser generado automáticamente.');
			}else{
    			$arrResponse = array('status' => false, 'msg' => 'No es posible almacenar los datos.');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die();
		}


		// Actualiza VSACCESS con registros de VSEMPLOX y VSTUDENT
		public function saveUsers()
		{
			// Ir a tabla Vsemplox y traer todos los campos de los empleados
			$sql 		= 'SELECT IDE_NO,LAS_NM,FIR_NM,EMP_NO,PROFIL FROM vsemplox WHERE ESTATU = 1 AND IDE_NO != ""';
			$request 	= $this->model->searchUsers($sql);
			
			if(!empty($request))
			{
				for ($i = 0; $i < count($request); $i++) 
					{			
						$insert = 'INSERT INTO vsaccess(USU_ID,ALI_NO,USU_NM,USU_PAS,USU_ROL,USU_NO,PTO_NO,ESTADO) VALUES(?,?,?,?,?,?,?,?)';
						if ($request[$i]['PROFIL'] == 5)
						{
							$arrData = array($request[$i]['IDE_NO'],$request[$i]['LAS_NM'],$request[$i]['LAS_NM']." ".$request[$i]['FIR_NM'],hash("SHA256",$request[$i]['IDE_NO']),$request[$i]['PROFIL'],$request[$i]['EMP_NO'],"",1);
						}else{
							$arrData = array($request[$i]['IDE_NO'],$request[$i]['LAS_NM'],$request[$i]['LAS_NM']." ".$request[$i]['FIR_NM'],hash("SHA256",$request[$i]['IDE_NO']),$request[$i]['PROFIL'],0,"",1);
						}

						// Si la cedula existe como Usuario no la registra nuevamente
						$Ide_no = trim($request[$i]['IDE_NO']);
						$sql = "SELECT USU_ID FROM vsaccess WHERE USU_ID = '{$Ide_no}' ";
						$request_user = $this->model->searchUsers($sql);
						if(empty($request_user))
						{
							$request_insert = $this->model->grabarUsers($insert,$arrData);
						}
					}
			}
			$return  = $request_insert;

			// Ir a tabla Vstudent y traer todos las cedulas de los estudiantes
			$sql 		= 'SELECT IDE_NO,LAS_NM,FIR_NM,REPCED,REPLAS,REPNAM,STD_NO FROM vstudent WHERE ESTATU = 2 AND IDE_NO != ""';
			$request 	= $this->model->searchUsers($sql);
			//dep($request);
			if(!empty($request))
			{
				for ($i = 0; $i < count($request); $i++) 
				{
					// Registra Usuario de Estudiante
					$insert = "INSERT INTO vsaccess(USU_ID,ALI_NO,USU_NM,USU_PAS,USU_ROL,USU_NO,PTO_NO,ESTADO) VALUES(?,?,?,?,?,?,?,?)";
					$arrData = array($request[$i]['IDE_NO'],$request[$i]['LAS_NM'],$request[$i]['LAS_NM']." ".$request[$i]['FIR_NM'],hash("SHA256",$request[$i]['IDE_NO']),7,$request[$i]['STD_NO'],"",1);
							
					// Si la cedula existe como Usuario no la registra nuevamente
					$sql 			= "SELECT USU_ID FROM vsaccess WHERE USU_ID = '{$request[$i]['IDE_NO']}'";
					$request_user 	= $this->model->searchUsers($sql);
					if(empty($request_user))
					{
						$request_insert = $this->model->grabarUsers($insert,$arrData);
					}

					// Registra Usuario de Representante
					$insert = "INSERT INTO vsaccess(USU_ID,ALI_NO,USU_NM,USU_PAS,USU_ROL,USU_NO,PTO_NO,ESTADO) VALUES(?,?,?,?,?,?,?,?)";
					$arrData = array($request[$i]['REPCED'],$request[$i]['REPLAS'],$request[$i]['REPLAS']." ".$request[$i]['REPNAM'],hash("SHA256",$request[$i]['REPCED']),8,$request[$i]['STD_NO'],"",1);
							
					// Si la cedula existe como Usuario no la registra nuevamente
					$sql 			= "SELECT USU_ID FROM vsaccess WHERE USU_ID = '{$request[$i]['REPCED']}'";
					$request_user 	= $this->model->searchUsers($sql);
					if(empty($request_user))
					{
						$request_insert = $this->model->grabarUsers($insert,$arrData);
					}
				}
			}
			$return  = $request_insert;
			die();
		}		
	}
