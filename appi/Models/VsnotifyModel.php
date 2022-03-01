 <?php

	class VsnotifyModel extends Mysql
	{
		public $intSec_id;
		public $intPerios;
		public $strFecreg;
		public $intSec_no;
		public $intMat_no;
		public $intStd_no;
		public $intEmp_no;
		public $strSchedu;


		public function __construct()
		{
			//echo "Mensaje desde el Modelo Home";
			parent::__construct();
		}


		public function selectVsnotify()
		{
			$usu = $_SESSION['userData']['USU_NO']; //Codigo Registro en Vsexplox o Vstudent ...
			$rol = $_SESSION['userData']['rol_id'];
			$ced = $_SESSION['idUser']; //cedula en vsaccess .....

			// SWITCH de Opciones:
			switch($rol)
			{
				case 5:  // Docente
						$sql = "SELECT	a.SEC_ID,
						               	a.PERIOS,
							           	a.FECREG,
										a.HORREG,
		 					            s.SEC_NM,
						               	s.PARALE,
		    				           	m.MAT_NM,
		    				           	v.LAS_NM,
						              	v.FIR_NM
				        FROM vsnotify a
				        INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
				        INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
				        INNER JOIN vstudent v ON v.STD_NO = a.STD_NO
			    	    WHERE a.EMP_NO = $usu
						ORDER BY a.FECREG DESC";
						break;
				case 7:  // Estudiante
						$sql = "SELECT a.SEC_ID,
						               a.PERIOS,
				    			       a.FECREG,
									   a.HORREG,
						               s.SEC_NM,
			            			   s.PARALE,
						               m.MAT_NM,
			            			   v.LAS_NM,
						               v.FIR_NM
				        FROM vsnotify a
			    	    INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
			        	INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
			        	INNER JOIN vstudent v ON v.STD_NO = a.STD_NO
			        	WHERE a.STD_NO = $usu
						ORDER BY a.FECREG DESC";
						break;
				case 8:  // Representante
						$sql = "SELECT a.SEC_ID,
									   a.PERIOS,
									   a.FECREG,
									   a.HORREG,
									   s.SEC_NM,
									   s.PARALE,
									   m.MAT_NM,
									   v.LAS_NM,
									   v.FIR_NM
						FROM vsnotify a
						INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
						INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
						INNER JOIN vstudent v ON v.STD_NO = a.STD_NO
						WHERE a.STD_NO = $usu
						ORDER BY a.FECREG DESC";
						break;
				default:
						$sql = "SELECT	a.SEC_ID,
						               	a.PERIOS,
							           	a.FECREG,
										a.HORREG,
				               			s.SEC_NM,
						               	s.PARALE,
					    	           	m.MAT_NM,
			    		        	   	v.LAS_NM,
				        		       	v.FIR_NM
				        FROM vsnotify a
				        INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
		        		INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
		    		    INNER JOIN vstudent v ON v.STD_NO = a.STD_NO
						ORDER BY a.FECREG DESC";
			}
			$request = $this->select_all($sql);
			return $request;
		}


		public function oneVsnotify(int $idSec)
		{
			$this->intSec_id = $idSec;
			$sql 		= "SELECT * FROM vsnotify WHERE SEC_ID = {$this->intSec_id}";
			$request 	= $this->select($sql);
			return $request;
		}


		public function insertVsnotify(int $perios, string $fecreg, string $horreg, int $sec_no, int $mat_no, int $std_no, int $emp_no, string $schedu)
		{
   			$return = "";
            $this->intPerios = $perios;
            $this->strFecreg = $fecreg;
			$this->strHorreg = date("H:i:s");
			$this->intSec_no = $sec_no;
			$this->intMat_no = $mat_no;
			$this->intStd_no = $std_no;
			$this->intEmp_no = $emp_no;
			$this->strSchedu = $schedu;

			// Valida en VSSECMAT si existe la malla escogida
			$sql              = "SELECT EMP_NO FROM vssecmat WHERE SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
			$request_vssecmat = $this->select($sql);
			if(empty($request_vssecmat))
			{
				// NO EXISTE MALLA
				$return = -2;
				return $return;
			}
			$this->intEmp_no = $request_vssecmat['EMP_NO'];

			if($this->intStd_no == 0)
			{
				$sql 		= "SELECT * FROM vsnotify WHERE PERIOS = $this->intPerios AND FECREG = '{$this->strFecreg}' AND HORREG = '{$this->strHorreg}' AND SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
				$request 	= $this->select_all($sql);
				if(empty($request))
				{
					// Busca en VSTUDENT los estudiantes que coinciden con PERIOS y SEC_NO
					$sql = "SELECT STD_NO,LAS_NM,FIR_NM FROM vstudent WHERE PERIOS = $this->intPerios AND SEC_NO = {$this->intSec_no}";
					$arrSTD = $this->select_all($sql);

					for ($i=0; $i < count($arrSTD); $i++) 
					{
						$insert         = "INSERT INTO vsnotify(perios,fecreg,horreg,sec_no,mat_no,std_no,emp_no,schedu) VALUES(?,?,?,?,?,?,?,?)";
						$arrData        = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$arrSTD[$i]['STD_NO'],$this->intEmp_no,$this->strSchedu);
						$request_insert = $this->insert($insert,$arrData);
					}
					$return         = $request_insert;
				}else{
					// EXISTE
					$return = -1;
				}
			}else{
				$sql 		= "SELECT * FROM vsnotify WHERE PERIOS = {$this->intPerios} AND FECREG = '{$this->strFecreg}' AND HORREG = '{$this->strHorreg}' AND SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no} AND STD_NO = {$this->intStd_no}";
				$request 	= $this->select_all($sql);
				if(empty($request))
				{
					$insert          = "INSERT INTO vsnotify(perios,fecreg,horreg,sec_no,mat_no,std_no,emp_no,schedu) VALUES(?,?,?,?,?,?,?,?)";
					$arrData         = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$this->intStd_no,$this->intEmp_no,$this->strSchedu);
					$request_insert  = $this->insert($insert,$arrData);
					$return          = $request_insert;
				}else{
					// EXISTE
					$return = -1;
				}
			}
			return $return;
		}


		public function updateVsnotify(int $sec_id, int $perios, string $fecreg, string $horreg, int $sec_no, int $mat_no, int $std_no, int $emp_no, string $schedu)
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
			$this->strSchedu = $schedu;

			$sql = "SELECT * FROM vsnotify WHERE PERIOS = {$this->intPerios} AND FECREG = '{$this->strFecreg}' AND HORREG = '{$this->strHorreg}' AND SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no} AND STD_NO = {$this->intStd_no} AND SEC_ID != {$this->intSec_id}";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$insert         = "UPDATE vsnotify SET perios = ?, fecreg = ?, horreg = ?, sec_no = ?, mat_no = ?, std_no = ?, emp_no = ?, schedu = ? WHERE SEC_ID = {$this->intSec_id}";
				$arrData        = array($this->intPerios,$this->strFecreg,$this->strHorreg,$this->intSec_no,$this->intMat_no,$this->intStd_no,$this->intEmp_no,$this->strSchedu);
				$request_insert = $this->update($insert,$arrData);
				$return         = $request_insert;
			}else{
				// EXISTE
				$return = -1;
			}
			return $return; 
		}
	}
