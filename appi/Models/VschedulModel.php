 <?php

	class VschedulModel extends Mysql
	{
		public $intSec_id;
		public $intStd_id;
		public $intStd_perios;
		public $intPerios;
		public $strFecreg;
		public $intSec_no;
		public $intMat_no;
		public $intStd_no;
		public $intEmp_no;
		public $strFecmax;
		public $strParcia;
		public $intPuntaj;
		public $strSchedu;
		public $strVdlink;
		public $strFlname;
		public $strFltask;
		public $intProptj;
		public $strMessag;


		public function __construct()
		{
			//echo "Mensaje desde el Modelo Home";
			parent::__construct();
		}


		public function selectVschedul()
		{
			$usu = $_SESSION['userData']['USU_NO']; // Codigo Registro en Vsexplox o Vstudent ...
			$ced = $_SESSION['idUser']; 			// cedula en vsaccess .....
			$rol = $_SESSION['userData']['rol_id'];

			$sql     = "SELECT PERIOS FROM vsdefaul";
			$request = $this->select($sql);
			$perios  = $request['PERIOS'];

			$sql = "";
			$fieldSelect = 'a.SEC_ID, a.PERIOS, a.FECREG, a.HORREG, s.SEC_NM, s.PARALE,
			    	        m.MAT_NM, m.REGIME, a.SCHEDU, a.PARCIA, a.INSUMO, a.PUNTAJ,
							v.LAS_NM, v.FIR_NM, e.LAS_NM as ELAS_NM, e.FIR_NM as EFIR_NM,a.FLNAME,a.FLTASK
							FROM vschedul a
		        			INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
		        			INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
		        			INNER JOIN vstudent v ON a.STD_NO = v.STD_NO
		        			INNER JOIN vsemplox e ON a.EMP_NO = e.EMP_NO ';

			// SWITCH de Opciones:
			switch($rol)
			{
				case 5:  // Docente
						$sql = "SELECT ".$fieldSelect."WHERE a.EMP_NO = $usu AND a.PERIOS = $perios ORDER BY a.FECREG DESC";
						break;
				case 7:  // Estudiante
						$sql = "SELECT ".$fieldSelect."WHERE a.STD_NO = $usu AND a.PERIOS = $perios ORDER BY a.FECREG DESC";
						break;
				case 8:  // Representante
						$sql = "SELECT 	a.SEC_ID,
						               	a.PERIOS,
							           	a.FECREG,
							           	a.HORREG,
			        			       	s.SEC_NM,
			            	   			s.PARALE,
				    	    	       	m.MAT_NM,
				        	    	   	m.REGIME,
										a.SCHEDU,
										a.PARCIA,
										a.INSUMO,
										a.PUNTAJ,
										v.LAS_NM,
						              	v.FIR_NM,
										e.LAS_NM as ELAS_NM,
			            	  			e.FIR_NM as EFIR_NM
				        FROM vschedul a
				        INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
				        INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
				        INNER JOIN vstudent v ON a.STD_NO = v.STD_NO
			    	    INNER JOIN vsemplox e ON a.EMP_NO = e.EMP_NO
						WHERE a.STD_NO = $usu
						ORDER BY a.FECREG DESC";
						break;
				default:
						$sql = "SELECT ".$fieldSelect."ORDER BY a.FECREG DESC";
			}
			$request = $this->select_all($sql);
			return $request;
		}


		// Obtiene Data para la Impresion de Actividades
		public function selectDetalle(int $secID, string $codigoAMIE)
		{
			$request = array();

			$sql 			= "SELECT RAZONS,ADDRES,TPHONE,RUC_NO,EMAILS FROM vsdefaul WHERE AMI_ID = '$codigoAMIE'";
			$request_empresa = $this->select($sql);

			// Aqui se extrae el registro de Actividad con el secID enviado
			$secActividad = intval($secID);
			$sql = "SELECT a.PERIOS,
						   a.FECREG,
						   a.HORREG,
						   s.SEC_NO,
						   s.SEC_NM,
						   s.PARALE,
						   m.MAT_NO,
						   m.MAT_NM,
						   a.EMP_NO,
						   e.LAS_NM,
						   e.FIR_NM,
						   a.PARCIA,
						   a.INSUMO
					FROM vschedul a
					INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
					INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
					INNER JOIN vsemplox e ON e.EMP_NO = a.EMP_NO
					WHERE a.SEC_ID = $secActividad";
			$request_actividad = $this->select($sql);

			// Aqui se extrae todos los estudiantes por Docente, Seccion y Materia
			$sql = "SELECT a.STD_NO,
			               v.LAS_NM,
						   v.FIR_NM,
						   a.PUNTAJ,
						   a.SCHEDU
			        FROM vschedul a
                    INNER JOIN vstudent v ON v.STD_NO = a.STD_NO
                    WHERE a.EMP_NO = $request_actividad[EMP_NO]
                    AND   a.PERIOS = $request_actividad[PERIOS]
                    AND   a.FECREG = '$request_actividad[FECREG]'
                    AND   a.HORREG = '$request_actividad[HORREG]'
                    AND   a.SEC_NO = $request_actividad[SEC_NO]
                    AND   a.MAT_NO = $request_actividad[MAT_NO]";
                    //AND   a.INSUMO = '$request_actividad[INSUMO]'";
            $request_alumnos = $this->select_all($sql);

            $request = array('empresa' => $request_empresa,
            	             'actividad' => $request_actividad,
            	             'alumnos' => $request_alumnos
           					);
			return $request; 
		}


		public function oneVschedul(int $idSec)
		{
			$this->intSec_id = $idSec;
			$sql 		= "SELECT * FROM vschedul WHERE SEC_ID = {$this->intSec_id}";
			$request 	= $this->select($sql);
			return $request;
		}

		
		// Extrae registro individual de Actividad a mostrar en el Modal: ViewActivity
		public function viewSchedul(int $idSec)
		{
			$request = array();
			
			// Se obtiene la actividad por el secuencial enviado ...
			$sql = "SELECT a.PERIOS,
						   a.FECREG,
						   a.HORREG,
						   s.SEC_NM,
						   s.PARALE,
						   m.MAT_NM,
						   v.LAS_NM,
						   v.FIR_NM,
						   a.FECMAX,
						   substring(a.PARCIA,1,4) as PARCIAL,
						   a.INSUMO,
						   a.PUNTAJ,
						   a.SCHEDU,
						   a.VDLINK,
						   a.FLNAME,
						   a.FLTASK
					FROM vschedul a
					INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
					INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
					INNER JOIN vstudent v ON a.STD_NO = v.STD_NO
					WHERE a.SEC_ID = $idSec";
			$request_schedul = $this->select($sql);

			// Se obtiene el nombre del insumo .....
			$sql = "SELECT SUB_NM as insumo 
			        FROM vstables 
			        WHERE TAB_NO = 'INS' AND SUB_NO = '$request_schedul[INSUMO]' AND ESTATU = 1";
			$request_insumo = $this->select($sql);

			$request = array('actividad' => $request_schedul,
							 'insumo' => $request_insumo
							);
			return $request;
		}


		// Actualiza la Tarea del Estudiante
		public function	updateTaskStd(int $secTaskStd, string $strFlname)
		{
			$this->intSec_id = $secTaskStd;
			$this->strFlname = $strFlname;

			$sql   	  = "UPDATE vschedul SET FLTASK = ? WHERE SEC_ID = {$this->intSec_id}";
			$arrData  = array($this->strFlname);
			$request  = $this->update($sql,$arrData);
			return	$request;
		}


		public function deleteVschedul(int $idSec)
		{
			$this->intSec_id = $idSec;
			$sql 		= "DELETE FROM vschedul WHERE SEC_ID = {$this->intSec_id}";
			$request 	= $this->delete($sql);
			if($request)
			{
				$request = 'ok';
			}else{
				$request = 'error';
			}
			return $request;
		}

		
		public function insertVschedul(int $perios, string $fecreg, string $horreg, int $sec_no, int $mat_no, int $std_no, int $emp_no, string $fecmax, string $parcia, string $insumo, float $puntaj, string $schedu, string $vdlink, string $flname, string $fltask, string $messag)
		{
   			$return = "";
			$this->intPerios = $perios;
			$this->strFecreg = $fecreg;
			$this->strHorreg = date("H:i:s");
			$this->intSec_no = $sec_no;
			$this->intMat_no = $mat_no;
			$this->intStd_no = $std_no;
			$this->intEmp_no = $emp_no;
			$this->strFecmax = $fecmax;
			$this->strParcia = $parcia;
			$this->strInsumo = $insumo;
			$this->intPuntaj = $puntaj;
			$this->strSchedu = $schedu;
			$this->strVdlink = $vdlink;
			$this->strFlname = $flname;
			$this->strFltask = $fltask;
			$this->strMessag = $messag;

			if(substr($this->strParcia,0,4) == 'Q1P4' OR substr($this->strParcia,0,4) == 'Q2P4')
			{
				// Valida en VSDEFAUL que la calificación no sobrepase el valor de la tabla
				$sql              = "SELECT BASCAL FROM vsdefaul";
				$request_vsdefaul = $this->select($sql);
				if(!empty($request_vsdefaul))
				{
					if($this->intPuntaj > $request_vsdefaul['BASCAL'])
					{
						// PUNTAJE MAYOR
						$return = -2;
						return $return;
					}
				}
			}else{
				// Valida en VSTABLES que la calificación no sobrepase el valor de la tabla
				$sql              = "SELECT VALORS FROM vstables WHERE TAB_NO = 'INS' AND SUB_NO = '{$this->strInsumo}'";
				$request_vstables = $this->select($sql);
				if(!empty($request_vstables))
				{
					if($this->intPuntaj > $request_vstables['VALORS'])
					{
						// PUNTAJE MAYOR
						$return = -2;
					return $return;
					}
				}
			}


			// Valida en VSSECMAT si existe la malla escogida
			$sql              = "SELECT EMP_NO FROM vssecmat WHERE SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
			$request_vssecmat = $this->select($sql);
			if(empty($request_vssecmat))
			{
				// REPARTO INCORRECTO
				$return = -3;
				return $return;
			}
			$this->intEmp_no = $request_vssecmat['EMP_NO'];


			$sql 				= "SELECT * FROM vschedul WHERE PERIOS = {$this->intPerios} AND FECREG = '{$this->strFecreg}' AND HORREG = '{$this->strHorreg}' AND SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
			$request_vschedul 	= $this->select_all($sql);
			if(empty($request_vschedul))
			{
				// Si array ESTUDIANTES viene vacio seleccionamos todos los ESTUDIANTES
				if($this->intStd_no == 0)
				{
					// Busca en VSTUDENT los estudiantes que coinciden con PERIOS y SEC_NO
					$sql    = "SELECT STD_NO FROM vstudent WHERE PERIOS = {$this->intPerios} AND SEC_NO = {$this->intSec_no}";
					$arrSTD = $this->select_all($sql);
				}else{
					// Busca en VSTUDENT los estudiantes que coinciden con escogido
					$sql    = "SELECT STD_NO FROM vstudent WHERE STD_NO = {$this->intStd_no}";
					$arrSTD = $this->select($sql);
				}

				foreach ($arrSTD as $std)
				{
					if($this->intStd_no == 0)
					{
						$this->intStd = $std['STD_NO'];
					}else{
						$this->intStd = $std;
					}
					$insert          = "INSERT INTO vschedul(perios,fecreg,horreg,sec_no,mat_no,std_no,emp_no,fecmax,parcia,insumo,puntaj,schedu,vdlink,flname,fltask) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$arrData         = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$this->intStd,$this->intEmp_no,$this->strFecmax,$this->strParcia,$this->strInsumo,$this->intPuntaj,$this->strSchedu,$this->strVdlink,$this->strFlname,$this->strFltask);
					$request_insert  = $this->insert($insert,$arrData);

					// Actualiza VSNOTIFY mensaje enviado a ESTUDIANTES
					if($this->strMessag != "")
					{
						$insert          = "INSERT INTO vsnotify(perios,fecreg,horreg,sec_no,mat_no,std_no,emp_no,schedu) VALUES(?,?,?,?,?,?,?,?)";
						$arrData         = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$this->intStd,$this->intEmp_no,$this->strMessag);
						$request_insert  = $this->insert($insert,$arrData);
					}

					// Actualiza VSMATSTD
					if($this->intPuntaj >= 0)
					{
						// Suma todos los puntajes del Estudiante en la Asinatura el Parcial e Insumo y agrupa en VSMATSTD
						$sql    		 = "SELECT truncate(avg(PUNTAJ),2) as promedio FROM vschedul WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd} AND MAT_NO = {$this->intMat_no} AND PARCIA = '{$this->strParcia}' AND PUNTAJ > 0";
						$arrPuntajes 	 = $this->select($sql);
						$this->intProptj = 0;
					
						if($arrPuntajes['promedio'] != "")
						{
				   			$this->intProptj = $arrPuntajes['promedio'];			
						} 	

						// Examina si existe el registro en VSMATSTD por Año Estudiante y Asignatura
						$sql     			= "SELECT * FROM vsmatstd WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd} AND MAT_NO = {$this->intMat_no}";
						$request_vsmatstd 	= $this->select($sql);
						if(empty($request_vsmatstd))
						{
							// Inserta VSMATSTD
							$insert   = "INSERT INTO vsmatstd(perios,std_no,mat_no,sec_no,emp_no) VALUES(?,?,?,?,?)";
							$arrData  = array($this->intPerios,$this->intStd,$this->intMat_no,$this->intSec_no,$this->intEmp_no);
							$request  = $this->insert($insert,$arrData);

							$sql     			= "SELECT * FROM vsmatstd WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd} AND MAT_NO = {$this->intMat_no}";
							$request_vsmatstd 	= $this->select($sql);
						}

						// Busca en VSMATTER el TIPO DE CALCULO DE INSUMOS
						$sql              = "SELECT MAT_NM,PROMED FROM vsmatter WHERE MAT_NO = {$this->intMat_no}";
						$request_vsmatter = $this->select($sql);
						if(!empty($request_vsmatter))
						{
							$this->strMat_nm = $request_vsmatter['MAT_NM'];
							$this->intCaltyp = $request_vsmatter['PROMED'];

							// Busca en VSDEFAUL el parametro de Ponderación
							$sql              = "SELECT PARPOR,EXAPOR FROM vsdefaul";
							$request_vsdefaul = $this->select($sql);
							if(!empty($request_vsdefaul))
							{
								$this->intParpor = $request_vsdefaul['PARPOR'];
								$this->intExapor = $request_vsdefaul['EXAPOR'];
							}
				
							$mQ1p1pr = 0;
							$mQ1p2pr = 0;
							$mQ1p3pr = 0;
							$mQ1p4pr = 0;
							$mQ1_pro = 0;
							$mQ2p1pr = 0;
							$mQ2p2pr = 0;
							$mQ2p3pr = 0;
							$mQ2p4pr = 0;
							$mQ2_pro = 0;
							$mProfin = 0;

							if($this->strParcia == 'SUPLET')
							{
								$mSuplet = $this->intProptj;
							}else{
								$mSuplet = $request_vsmatstd['SUPLET'];
							}
	
							// QUIMESTRE
							for ($q = 1; $q <= 2; $q++) 
							{
								// PARCIAL
								$parnum = 0;
								$parsum = 0;
								$exasum = 0;
								for ($p = 1; $p <= 4; $p++) 
								{
									// INSUMO
									$inssum = 0;
									for ($ins = 1; $ins <= 5; $ins++) 
									{
										$campo  = "Q".$q."P".$p."I".$ins;
										if($this->strParcia == $campo)
										{
											$inssum = $inssum + $this->intProptj;
										}else{
											$inssum = $inssum + $request_vsmatstd[$campo];
										}
									}
									$parpro  = "mQ".$q."p".$p."pr";
									$$parpro = $inssum;

									if($p < 4)
									{
										$parsum = $parsum + $inssum;
										if($$parpro > 0)
										{
											$parnum = $parnum + 1;
										}
									}else{
										$exasum = $inssum;
									}
								}
								$quipro  = "mQ".$q."_pro";
								if($parnum == 0)
								{
									$$quipro = 0;
								}else{
									if($this->strMat_nm == 'COMPORTAMIENTO')
									{
										$$quipro = round(($parsum / $parnum), 2, PHP_ROUND_HALF_DOWN);
									}else{
										$$quipro = round(($parsum / $parnum * ($this->intParpor / 100)), 2, PHP_ROUND_HALF_DOWN) + round(($exasum * $this->intExapor / 100), 2, PHP_ROUND_HALF_DOWN);
									}
								}
							}

							if($mQ1_pro == 0 or $mQ2_pro == 0)
							{
								$mProfin = 0;
							}else{
								$mProfin = ($mQ1_pro + $mQ2_pro)/2;
								if($mProfin < 4 AND $this->strMat_nm != 'COMPORTAMIENTO')
								{
									$mProfin = 0;
								}else{
									if($mProfin < 7 AND $this->strMat_nm != 'COMPORTAMIENTO')
									{
										if($mSuplet >= 7)
										{
											$mProfin = 7;
										}else{
											$mProfin = 0;
										}
									}else{
										$mProfin = ($mQ1_pro + $mQ2_pro)/2;
									}
								}
							}

							// Actualiza VSMATSTD
							$insert   = "UPDATE vsmatstd SET {$this->strParcia} = ?, Q1P1PR = ?, Q1P2PR = ?, Q1P3PR = ?, Q1P4PR = ?, Q1_PRO = ?, Q2P1PR = ?, Q2P2PR = ?, Q2P3PR = ?, Q2P4PR = ?, Q2_PRO = ?, PROFIN = ? WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd} AND MAT_NO = {$this->intMat_no}";
							$arrData  = array($this->intProptj,$mQ1p1pr,$mQ1p2pr,$mQ1p3pr,$mQ1p4pr,$mQ1_pro,$mQ2p1pr,$mQ2p2pr,$mQ2p3pr,$mQ2p4pr,$mQ2_pro,$mProfin);
							$request  = $this->update($insert,$arrData);
						}
					}
					$return  = $request_insert;
				}
			}
			return $return;
		}


		public function updateVschedul(int $sec_id, int $perios, string $fecreg, string $horreg, int $sec_no, int $mat_no, int $std_no, int $emp_no, string $fecmax, string $parcia, string $insumo, float $puntaj, string $schedu, string $vdlink, string $flname, string $messag)
		{
   			$return = "";
  		    $this->intSec_id = $sec_id;
		    $this->intPerios = $perios;
			$this->strFecreg = $fecreg;
			$this->strHorreg = $horreg;
			$this->intSec_no = $sec_no;
			$this->intMat_no = $mat_no;
			$this->intStd_no = $std_no;
			$this->intEmp_no = $emp_no;
			$this->strFecmax = $fecmax;
			$this->strParcia = $parcia;
			$this->strInsumo = $insumo;
			$this->intPuntaj = $puntaj;
			$this->strSchedu = $schedu;
			$this->strVdlink = $vdlink;
			$this->strFlname = $flname;
			$this->strMessag = $messag;

			if(substr($this->strParcia,0,4) == 'Q1P4' OR substr($this->strParcia,0,4) == 'Q2P4')
			{
				// Valida en VSDEFAUL que la calificación no sobrepase el valor de la tabla
				$sql              = "SELECT BASCAL FROM vsdefaul";
				$request_vsdefaul = $this->select($sql);
				if(!empty($request_vsdefaul))
				{
					if($this->intPuntaj > $request_vsdefaul['BASCAL'])
					{
						// PUNTAJE MAYOR
						$return = -2;
						return $return;
					}
				}
			}else{
				// Valida en VSTABLES que la calificación no sobrepase el valor de la tabla
				$sql              = "SELECT VALORS FROM vstables WHERE TAB_NO = 'INS' AND SUB_NO = '{$this->strInsumo}'";
				$request_vstables = $this->select($sql);
				if(!empty($request_vstables))
				{
					if($this->intPuntaj > $request_vstables['VALORS'])
					{
						// PUNTAJE MAYOR
						$return = -2;
						return $return;
					}
				}
			}

			// Valida en VSSECMAT si existe la malla escogida
			$sql              = "SELECT EMP_NO FROM vssecmat WHERE SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
			$request_vssecmat = $this->select($sql);
			if(empty($request_vssecmat))
			{
				// REPARTO INCORRECTO
				$return = -3;
				return $return;
			}

			$sql              = "SELECT * FROM vschedul WHERE PERIOS = {$this->intPerios} AND FECREG = '{$this->strFecreg}' AND HORREG = '{$this->strHorreg}' AND MAT_NO = {$this->intMat_no} AND STD_NO = {$this->intStd_no} AND SEC_ID != {$this->intSec_id}";
			$request_vschedul = $this->select_all($sql);
			if(empty($request_vschedul))
			{
				$insert         = "UPDATE vschedul SET perios = ?, fecreg = ?, horreg = ?, sec_no = ?, mat_no = ?, std_no = ?, emp_no = ?, fecmax = ?, parcia = ?, insumo = ?, puntaj = ?, schedu = ?, vdlink = ?, flname = ? WHERE SEC_ID = {$this->intSec_id}";
				$arrData        = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$this->intStd_no,$this->intEmp_no,$this->strFecmax,$this->strParcia,$this->strInsumo,$this->intPuntaj,$this->strSchedu,$this->strVdlink,$this->strFlname);
				$request_insert = $this->update($insert,$arrData);
				$return         = $request_insert;

				// Actualiza VSNOTIFY
				if($this->strMessag != "")
				{
					$insert          = "INSERT INTO vsnotify(perios,fecreg,horreg,sec_no,mat_no,std_no,emp_no,schedu) VALUES(?,?,?,?,?,?,?,?)";
					$arrData         = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$this->intStd_no,$this->intEmp_no,$this->strMessag);
					$request_insert  = $this->insert($insert,$arrData);
				}

				// Actualiza VSMATSTD
				// Suma todos los puntajes del Estudiante en la Asinatura el Parcial e Insumo y agrupa en VSMATSTD
				$sql    		 = "SELECT truncate(avg(PUNTAJ),2) as promedio FROM vschedul WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd_no} AND MAT_NO = {$this->intMat_no} AND PARCIA = '{$this->strParcia}' AND PUNTAJ > 0";
				$arrPuntajes 	 = $this->select($sql);
				$this->intProptj = 0;
					
				if($arrPuntajes['promedio'] != "")
				{
				   $this->intProptj = $arrPuntajes['promedio'];			
				} 	

				// Examina si existe el registro en VSMATSTD por Año Estudiante y Asignatura
				$sql     		  = "SELECT * FROM vsmatstd WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd_no} AND MAT_NO = {$this->intMat_no}";
				$request_vsmatstd = $this->select($sql);
				if(empty($request_vsmatstd))
				{
					$insert   = "INSERT INTO vsmatstd(perios,std_no,mat_no,sec_no,emp_no) VALUES(?,?,?,?,?)";
					$arrData  = array($this->intPerios,$this->intStd_no,$this->intMat_no,$this->intSec_no,$this->intEmp_no);
					$request  = $this->insert($insert,$arrData);
				}

				// Busca en VSMATTER el TIPO DE CALCULO DE INSUMOS
				$sql 		= "SELECT MAT_NM,PROMED FROM vsmatter WHERE MAT_NO = {$this->intMat_no}";
				$request 	= $this->select($sql);
				if(!empty($request))
				{
					$this->strMat_nm = $request['MAT_NM'];
					$this->intCaltyp = $request['PROMED'];

					// Busca en VSDEFAUL el parametro de Ponderación
					$sql              = "SELECT PARPOR,EXAPOR FROM vsdefaul";
					$request_vsdefaul = $this->select($sql);
					if(!empty($request_vsdefaul))
					{
						$this->intParpor = $request_vsdefaul['PARPOR'];
						$this->intExapor = $request_vsdefaul['EXAPOR'];
					}

					$mQ1p1pr = 0;
					$mQ1p2pr = 0;
					$mQ1p3pr = 0;
					$mQ1p4pr = 0;
					$mQ1_pro = 0;
					$mQ2p1pr = 0;
					$mQ2p2pr = 0;
					$mQ2p3pr = 0;
					$mQ2p4pr = 0;
					$mQ2_pro = 0;
					$mProfin = 0;

					if($this->strParcia == 'SUPLET')
					{
						$mSuplet = $this->intProptj;
					}else{
						$mSuplet = $request_vsmatstd['SUPLET'];
					}

					// QUIMESTRE
					for ($q = 1; $q <= 2; $q++) 
					{
						// PARCIAL
						$parnum = 0;
						$parsum = 0;
						$exasum = 0;
						for ($p = 1; $p <= 4; $p++) 
						{
							// INSUMO
							$inssum = 0;
							for ($ins = 1; $ins <= 5; $ins++) 
							{
								$campo  = "Q".$q."P".$p."I".$ins;
								if($this->strParcia == $campo)
								{
									$inssum = $inssum + $this->intProptj;
								}else{
									$inssum = $inssum + $request_vsmatstd[$campo];
								}
							}
							$parpro  = "mQ".$q."p".$p."pr";
							$$parpro = $inssum;
							if($p < 4)
							{
								$parsum = $parsum + $inssum;
								if($$parpro > 0)
								{
									$parnum = $parnum + 1;
								}
							}else{
								$exasum = $inssum;
							}
						}
						$quipro  = "mQ".$q."_pro";
						if($parnum == 0)
						{
							$$quipro = 0;
						}else{
							if($this->strMat_nm == 'COMPORTAMIENTO')
							{
								$$quipro = round(($parsum / $parnum), 2, PHP_ROUND_HALF_DOWN);
							}else{
								$$quipro = round(($parsum / $parnum * ($this->intParpor / 100)), 2, PHP_ROUND_HALF_DOWN) + round(($exasum * $this->intExapor / 100), 2, PHP_ROUND_HALF_DOWN);
							}
						}
					}

					if($mQ1_pro == 0 or $mQ2_pro == 0)
					{
						$mProfin = 0;
					}else{
						$mProfin = ($mQ1_pro + $mQ2_pro)/2;
						if($mProfin < 4 AND $this->strMat_nm != 'COMPORTAMIENTO')
						{
							$mProfin = 0;
						}else{
							if($mProfin < 7 AND $this->strMat_nm != 'COMPORTAMIENTO')
							{
								if($mSuplet >= 7)
								{
									$mProfin = 7;
								}else{
									$mProfin = 0;
								}
							}else{
								$mProfin = ($mQ1_pro + $mQ2_pro)/2;
							}
						}
					}

					// Actualiza VSMATSTD
					$insert   = "UPDATE vsmatstd SET {$this->strParcia} = ?, Q1P1PR = ?, Q1P2PR = ?, Q1P3PR = ?, Q1P4PR = ?, Q1_PRO = ?, Q2P1PR = ?, Q2P2PR = ?, Q2P3PR = ?, Q2P4PR = ?, Q2_PRO = ?, PROFIN = ? WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd_no} AND MAT_NO = {$this->intMat_no}";
					$arrData  = array($this->intProptj,$mQ1p1pr,$mQ1p2pr,$mQ1p3pr,$mQ1p4pr,$mQ1_pro,$mQ2p1pr,$mQ2p2pr,$mQ2p3pr,$mQ2p4pr,$mQ2_pro,$mProfin);
					$request  = $this->update($insert,$arrData);
				}
			}else{
				// EXISTE
				$return = -1;
			}
			return $return; 
		}
	}
