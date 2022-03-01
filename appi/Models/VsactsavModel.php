 <?php

	class VsactsavModel extends Mysql
	{
		public $intSec_no;
		public $intMat_no;
		public $intEmp_no;
		public $strClinks;


		public function __construct()
		{
			//echo "Mensaje desde el Modelo Home";
			parent::__construct();
		}


		// GUARDA CALIFICACION
		public function getSavOne(int $sec_id, string $parcia, float $califi)
		{
			$return          = "";
			$this->intSec_id = $sec_id;
			$this->strParcia = $parcia;
			$this->intCalifi = $califi;
			$this->strInsumo = substr($this->strParcia,4,2);

			if($this->strInsumo == 'I1' OR $this->strInsumo == 'I2' OR $this->strInsumo == 'I3' OR $this->strInsumo == 'I4')
			{
				// Valida en VSTABLES que la calificación no sobrepase el valor de la tabla
				$sql              = "SELECT VALORS FROM vstables WHERE TAB_NO = 'INS' AND SUB_NO = '{$this->strInsumo}'";
				$request_vstables = $this->select($sql);
				if(!empty($request_vstables))
				{
					if($this->intCalifi > $request_vstables['VALORS'])
					{
						// PUNTAJE MAYOR
						$return = -1;
						return $return;
					}
				}
			}else{
				// Valida en VSDEFAUL que la calificación no sobrepase el valor de la tabla
				$sql              = "SELECT BASCAL FROM vsdefaul";
				$request_vsdefaul = $this->select($sql);
				if(!empty($request_vsdefaul))
				{
					if($this->intCalifi > $request_vsdefaul['BASCAL'])
					{
						// PUNTAJE MAYOR
						$return = -1;
						return $return;
					}
				}
			}

			$sql     			= "SELECT * FROM vsmatstd WHERE SEC_ID = {$this->intSec_id}";
			$request_vsmatstd 	= $this->select($sql);
			if(!empty($request_vsmatstd))
			{
				// Busca en VSMATTER el TIPO DE CALCULO DE INSUMOS
				$this->intMat_no 	= $request_vsmatstd['MAT_NO'];
				$sql              	= "SELECT MAT_NM,PROMED FROM vsmatter WHERE MAT_NO = {$this->intMat_no}";
				$request_vsmatter 	= $this->select($sql);
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
						$mSuplet = $this->intCalifi;
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
									$inssum = $inssum + $this->intCalifi;
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
					$update			= "UPDATE vsmatstd SET {$this->strParcia} = ?, Q1P1PR = ?, Q1P2PR = ?, Q1P3PR = ?, Q1P4PR = ?, Q1_PRO = ?, Q2P1PR = ?, Q2P2PR = ?, Q2P3PR = ?, Q2P4PR = ?, Q2_PRO = ?, PROFIN = ? WHERE SEC_ID = {$this->intSec_id}";
					$arrData  		= array($this->intCalifi,$mQ1p1pr,$mQ1p2pr,$mQ1p3pr,$mQ1p4pr,$mQ1_pro,$mQ2p1pr,$mQ2p2pr,$mQ2p3pr,$mQ2p4pr,$mQ2_pro,$mProfin);
					$request_update = $this->update($update,$arrData);
					$return         = $request_update;
				}
			}
			return $return;
		}


		public function getVsactdet(int $perios, int $sec_no, int $mat_no, string $parcia, string $codigoAMIE)
		{
			$request = array();
			$this->intPerios = $perios;
			$this->intSec_no = $sec_no;
			$this->intMat_no = $mat_no;

			// DATA EMPRESA
			$sql 				= "SELECT RAZONS,ADDRES,TPHONE,RUC_NO,EMAILS FROM vsdefaul WHERE AMI_ID = '$codigoAMIE'";
			$request_empresa 	= $this->select($sql);

			//DATA INSUMOS DE VSTABLES
			$sql 				= "SELECT SUB_NO,SUB_NM FROM vstables WHERE TAB_NO = 'INS'";
			$request_insumos 	= $this->select_all($sql);			

			// QUERY ACTA DE CALIFICACIONES
			switch(substr($parcia,0,4))
			{
				case 'Q1P1': $QPI = 'v.Q1P1I1,v.Q1P1I2,v.Q1P1I3,v.Q1P1I4,v.Q1P1I5,v.Q1P1PR,';
							 break;
				case 'Q1P2': $QPI = 'v.Q1P2I1,v.Q1P2I2,v.Q1P2I3,v.Q1P2I4,v.Q1P2I5,v.Q1P2PR,';
							 break;
				case 'Q1P3': $QPI = 'v.Q1P3I1,v.Q1P3I2,v.Q1P3I3,v.Q1P3I4,v.Q1P3I5,v.Q1P3PR,';
							 break;
				case 'Q1_P': $QPI = 'v.Q1P4I1,v.Q1P4I2,v.Q1P4I3,v.Q1P4I4,v.Q1P4I5,v.Q1P4PR,';
							 break;
				case 'Q2P1': $QPI = 'v.Q2P1I1,v.Q2P1I2,v.Q2P1I3,v.Q2P1I4,v.Q2P1I5,v.Q2P1PR,';
							 break;
				case 'Q2P2': $QPI = 'v.Q2P2I1,v.Q2P2I2,v.Q2P2I3,v.Q2P2I4,v.Q2P2I5,v.Q2P2PR,';
							 break;
				case 'Q2P3': $QPI = 'v.Q2P3I1,v.Q2P3I2,v.Q2P3I3,v.Q2P3I4,v.Q2P3I5,v.Q2P3PR,';
							 break;
				case 'Q2_P': $QPI = 'v.Q2P4I1,v.Q2P4I2,v.Q2P4I3,v.Q2P4I4,v.Q2P4I5,v.Q2P4PR';
							 break;
			}

			$sql = "SELECT e.LAS_NM,e.FIR_NM,s.SEC_NM,s.PARALE,s.JOR_NO,m.MAT_NM,m.CALIFI,
			               m.CUAL01,m.CUAL02,m.CUAL03,m.CUAL04,m.CUAL05,m.CUAL06,m.CUAL07,
			               m.CUAL08,m.CUAL09,m.CUAL10,m.CUAN01,m.CUAN02,m.CUAN03,m.CUAN04,
			               m.CUAN05,m.CUAN06,m.CUAN07,m.CUAN08,m.CUAN09,m.CUAN10,"."$QPI"."
			               v.SEC_ID,v.PERIOS,v.STD_NO,v.MAT_NO,v.Q1_PRO,v.Q2_PRO
			        FROM vsmatstd v 
			        INNER JOIN vstudent e ON e.STD_NO = v.STD_NO
			        INNER JOIN vsection s ON s.SEC_NO = v.SEC_NO
			        INNER JOIN vsmatter m ON m.MAT_NO = v.MAT_NO
			        WHERE v.PERIOS = {$this->intPerios}
			        AND   v.SEC_NO = {$this->intSec_no}
			        AND   v.MAT_NO = {$this->intMat_no}
					ORDER BY e.LAS_NM,e.FIR_NM";
			$request_vsactmat = $this->select_all($sql);

			$request = array('empresa' => $request_empresa,'insumos' => $request_insumos,'acta' => $request_vsactmat,'parcial' => $parcia);
			return $request; 
		}


		public function selectVsactsav()
		{
			$usu = $_SESSION['userData']['USU_NO'];
			$rol = $_SESSION['userData']['rol_id'];
			switch($rol)
			{
				case 5:  // Docente
					$sql = "SELECT 	a.SEC_ID,
									s.SEC_NM,
									s.PARALE,
									m.MAT_NM,
									m.REGIME,
									e.LAS_NM,
									e.FIR_NM
					FROM vssecmat a
					INNER JOIN vsection s ON s.SEC_NO = a.SEC_NO
					INNER JOIN vsmatter m ON m.MAT_NO = a.MAT_NO 
					INNER JOIN vsemplox e ON e.EMP_NO = a.EMP_NO
					WHERE a.EMP_NO = $usu
					ORDER BY s.NIV_NO,s.PARALE";
					break;
				default: 
					$sql = "SELECT 	a.SEC_ID,
					               	s.SEC_NM,
					               	s.PARALE,
			        		       	m.MAT_NM,
				    	           	m.REGIME,
								   	e.LAS_NM,
								   	e.FIR_NM
				    FROM vssecmat a
				    INNER JOIN vsection s ON s.SEC_NO = a.SEC_NO
		    		INNER JOIN vsmatter m ON m.MAT_NO = a.MAT_NO 
				    INNER JOIN vsemplox e ON e.EMP_NO = a.EMP_NO
				    ORDER BY s.NIV_NO,s.PARALE";
					break;
			}
			$request = $this->select_all($sql);
			return $request;
		}

		
		// EXTRAE UN REPARTO
		public function oneVsactsav(int $secID)
		{
			$this->intSec_id = $secID;
			$sql 		= "SELECT * FROM vssecmat WHERE SEC_ID = {$this->intSec_id}";
			$request 	= $this->select($sql);
			return $request;
		}
	}
