 <?php
 	
	class VscerstdModel extends Mysql
	{
		public $intStd_no;
		public $strLas_nm;
		public $strFir_nm;
		public $strAddres;
		public $strTphone;
		public $intIdtype;
		public $strIde_no;
		public $intStdgen;
		public $datFecbir;
		public $strStdmai;
		public $intTt_who;
		public $strFatlas;
		public $strFatnam;
		public $strFatadr;
		public $strFatfon;
		public $intFatype;
		public $strFatced;
		public $strFatjob;
		public $datFatbir;
		public $strFatmai;
		public $strMotlas;
		public $strMotnam;
		public $strMotadr;
		public $strMotfon;
		public $intMotype;
		public $strMotced;
		public $strMotjob;
		public $datMotbir;
		public $strMotmai;
		public $strPerson;
		public $strPeradr;
		public $strPerfon;
		public $intFacwho;
		public $strRazons;
		public $strDirecc;
		public $strTlf_no;
		public $intCltype;
		public $strRuc_no;
		public $strEmails;
		public $intEstatu;
		public $strLassch;
		public $strRemark;
		public $profin;
		

		public function __construct()
		{
			//echo "Mensaje desde el Modelo Home";
			parent::__construct();
		}


		public function getScale(float $PROFIN)
		{
			$this->profin = $PROFIN;
			$sql = "SELECT SUB_NM FROM vstables WHERE TAB_NO = 'APR' AND $this->profin BETWEEN VALORS AND VALOR2";
			$request = $this->select($sql);
			return $request;
		}


		public function getCerDetalle(int $secStd, int $perios, string $certip, string $fecreg, string $codigoAMIE)
		{
			$request = array();
			$this->intStd_no = intval($secStd);
			$this->intPerios = $perios;
			$fecha = $fecreg;
			//$fecha_cert = "$fecha[mday] de $fecha[month] de $fecha[year]";


			// Se obtiene informacion de la Empresa
			$sql = "SELECT AMI_ID,PERIOS,RAZONS,RECTORIA,SECRETARIO,ADDRES,TPHONE,RUC_NO,EMAILS,REGIME FROM vsdefaul WHERE AMI_ID = '$codigoAMIE'";
			$request_empresa = $this->select($sql);

			// Se genera la instruccion SQL sobre la tabla VSMATSTD
			$sql = "SELECT e.LAS_NM,e.FIR_NM,s.SEC_NM,s.PARALE,s.JOR_NO,s.SEC_N2,m.MAT_NM,v.PERIOS,TRUNCATE(v.PROFIN,2) as PROFIN
			        FROM vsmatstd v 
			        INNER JOIN vstudent e ON e.STD_NO = v.STD_NO
			        INNER JOIN vsection s ON s.SEC_NO = v.SEC_NO
			        INNER JOIN vsmatter m ON m.MAT_NO = v.MAT_NO
					INNER JOIN vssecmat t ON t.SEC_NO = v.SEC_NO AND t.MAT_NO = v.MAT_NO AND t.PERIOS = v.PERIOS
			        WHERE v.STD_NO = {$this->intStd_no} AND v.PERIOS = {$this->intPerios} AND m.REGIME = 1
			        ORDER BY t.ORDERS";
			$request_student = $this->select_all($sql);

			$proSup = '';
			$request_promovido = '';
			if(!empty($request_student))
			{
				if($request_student[0]['SEC_N2'] != '')
				{
					$request_promovido = $request_student[0]['SEC_N2'];
				}

				// Obtiene la sección inmediato superior
				if($request_promovido != '')
				{
					$sql = "SELECT SEC_NM
						    FROM vsection
				        	WHERE SEC_NO = ".$request_promovido;
					$request_proSup = $this->select($sql);
					$proSup = $request_proSup['SEC_NM'];
				}
			}
			
			// Obtiene información de Matricula y Folio Historico
			$sql = "SELECT STD_NO,MATNUM,FOLNUM,FECMAT
			        FROM vsstdhis
			        WHERE STD_NO = {$this->intStd_no} AND PERIOS = {$this->intPerios}";
			$request_stdhis = $this->select($sql);


			// Calcula Promedio Final por Estudiante
			$sql = "SELECT DISTINCT a.STD_NO,s.LAS_NM,s.FIR_NM
				    FROM vsmatstd a
				    INNER JOIN vstudent s ON s.STD_NO = a.STD_NO
			        WHERE a.STD_NO = {$this->intStd_no} AND a.PERIOS = {$this->intPerios};
			        ORDER BY s.LAS_NM,s.FIR_NM";
			$request_proStd = $this->select_all($sql);

			$arrproStd = array();
			if(!empty($request_proStd))
			{   
				require_once ("Models/VsactsecModel.php");
 				$objPromedio = new VsactsecModel();
	            foreach($request_proStd as $proStd)
	            {
	            	$res_pro = $objPromedio->getVsstdpro($proStd['STD_NO'],$perios,3);
	             	$arrproStd[] = array('codeStd' => $proStd['STD_NO'], 'proStd' => $res_pro);
	            }
        	}

			// Obtiene Promedio de Comportamiento
			$sql = "SELECT ROUND(a.PROFIN) as PROFIN,m.MAT_NM,m.CALIFI,
			               m.CUAL01,m.CUAL02,m.CUAL03,m.CUAL04,m.CUAL05,m.CUAL06,m.CUAL07,m.CUAL08,m.CUAL09,m.CUAL10,
						   m.CUAN01,m.CUAN02,m.CUAN03,m.CUAN04,m.CUAN05,m.CUAN06,m.CUAN07,m.CUAN08,m.CUAN09,m.CUAN10
				    FROM vsmatstd a
				    INNER JOIN vsmatter m ON m.MAT_NO = a.MAT_NO
			        WHERE a.STD_NO = {$this->intStd_no} AND a.PERIOS = {$this->intPerios};
			        AND m.MAT_NM = 'COMPORTAMIENTO'";
			$arrproDis = $this->select($sql);

			$proDis = 0;
			$proTab = '-----';

			if(!empty($arrproDis))
			{
				if($arrproDis['PROFIN'] != '')
				{
					$proDis = $arrproDis['PROFIN'];

					// Obtiene Tabla de Comportamiento
					$sql = "SELECT SUB_NM
					    	FROM vstables
				        	WHERE TAB_NO = 'DIS'
				        	AND SUB_NO = ".$proDis;
					$arrTabDis = $this->select($sql);
					$proTab = $arrTabDis['SUB_NM'];
				}
			}

			// Obtiene información de Matricula y Folio Historico
			$request_stdhis = "";
		
			$sql = "SELECT STD_NO,MATNUM,FOLNUM,FECMAT
			        FROM vsstdhis
			        WHERE STD_NO = {$this->intStd_no} AND PERIOS = {$this->intPerios}";
			$request_stdhis = $this->select($sql);

			// Se prepara la respuesta para el controlador
			$request = array('empresa' => $request_empresa,
            	             'estudiante' => $request_student,
            	             'matricula' => $request_stdhis,
            	             'proStd' => $arrproStd,
            	             'proDis' => $arrproDis,
            	             'proTab' => $proTab,
            	             'proSup' => $proSup,
            	             'certip' => $certip,
            	             'fecha' => $fecreg
           					);
			return $request; 
		}


		public function selectVscerstd()
		{
			$usu = $_SESSION['userData']['USU_NO'];
			$rol = $_SESSION['userData']['rol_id'];
			switch($rol)
			{
				case 7:  // Estudiante
						$sql = "SELECT a.STD_NO,
						               a.PERIOS,
				    			       a.LAS_NM,
			    				       a.FIR_NM,
						               a.ESTATU,
		            				   s.SEC_NM,
									   s.PARALE
				        FROM vstudent a
			    	    INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
			        	WHERE a.STD_NO = $usu
						ORDER BY a.LAS_NM,a.FIR_NM";
						break;
				default:
						$sql = "SELECT  a.STD_NO,
										a.PERIOS,
										a.LAS_NM,
										a.FIR_NM,
										a.ESTATU,
										s.SEC_NM,
										s.PARALE
						FROM vstudent a
						INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
						WHERE a.ESTATU != 11
						ORDER BY a.LAS_NM,a.FIR_NM";
						break;
			}

			$request = $this->select_all($sql);
			return $request;
		}


		public function insertVscerstd(string $las_nm, string $fir_nm, string $addres, string $tphone, int $idtype, string $ide_no, int $stdgen, string $fecbir, string $stdmai, int $tt_who, string $fatlas, string $fatnam, string $fatadr, string $fatfon, int $fatype, string $fatced, string $fatjob, string $fatbir, string $fatmai, string $motlas, string $motnam, string $motadr, string $motfon, int $motype, string $motced, string $motjob, string $motbir, string $motmai, string $person, string $peradr, string $perfon, int $facwho, string $razons, string $direcc, string $tlf_no, int $cltype, string $ruc_no, string $emails, int $estatu, string $lassch, string $remark)
		{
		}
	}
