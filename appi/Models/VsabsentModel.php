 <?php

	class VsabsentModel extends Mysql
	{
		public $intSec_id;
		public $intPerios;
		public $strFecreg;
		public $intSec_no;
		public $intMat_no;
		public $intStd_no;
		public $intEmp_no;
		public $strParcia;
		public $intPuntaj;
		public $strSchedu;


		public function __construct()
		{
			//echo "Mensaje desde el Modelo Home";
			parent::__construct();
		}


		public function fntStdList(int $codSec,int $codMat,int $codPer)
		{
			$sql 		= "SELECT STD_NO,LAS_NM,FIR_NM FROM vstudent WHERE SEC_NO = ".$codSec." AND PERIOS = ".$codPer." ORDER BY LAS_NM,FIR_NM";
			$request 	= $this->select_all($sql);
			return $request;
		}


		public function selectVsabsent()
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
	 						            s.SEC_NM,
						               	s.PARALE,
	    					           	m.MAT_NM,
					    	           	m.REGIME,
	    				    	       	v.LAS_NM,
					            	  	v.FIR_NM
				        FROM vsabsent a
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
						               s.SEC_NM,
		            				   s.PARALE,
					    	           m.MAT_NM,
					        	       m.REGIME,
		            				   v.LAS_NM,
						               v.FIR_NM
				        FROM vsabsent a
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
									   s.SEC_NM,
									   s.PARALE,
									   m.MAT_NM,
									   m.REGIME,
									   v.LAS_NM,
									   v.FIR_NM
						FROM vsabsent a
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
				        		       	s.SEC_NM,
				               			s.PARALE,
					    	           	m.MAT_NM,
					        	       	m.REGIME,
			        		    	   	v.LAS_NM,
				            		   	v.FIR_NM
				        FROM vsabsent a
				        INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
		        		INNER JOIN vsmatter m ON a.MAT_NO = m.MAT_NO
		    		    INNER JOIN vstudent v ON v.STD_NO = a.STD_NO
						ORDER BY a.FECREG DESC";
			}
			$request = $this->select_all($sql);
			return $request;
		}


		public function oneVsabsent(int $idSec)
		{
			$this->intSec_id = $idSec;
			$sql = "SELECT v.SEC_ID,
						   v.PERIOS,
						   v.FECREG,
						   v.SEC_NO,
						   v.MAT_NO,
						   v.STD_NO,
						   v.EMP_NO,
						   v.PARCIA,
						   v.ABSTIP,
						   v.SCHEDU,
						   e.LAS_NM,
			    		   e.FIR_NM
				    FROM vsabsent v
				    INNER JOIN vstudent e ON e.STD_NO = v.STD_NO
				    WHERE v.SEC_ID = {$this->intSec_id}";
			$request = $this->select($sql);
			return $request;
		}


		public function deleteVsabsent(int $idSec)
		{
			$this->intSec_id = $idSec;
			$sql = "DELETE FROM vsabsent WHERE SEC_ID = {$this->intSec_id}";
			$request = $this->delete($sql);
			if($request)
			{
				$request = 'ok';
			}else{
				$request = 'error';
			}
			return $request;
		}


		public function insertVsabsent(int $perios, string $fecreg, int $sec_no, int $mat_no, array $std_no, string $parcia, int $abstip, string $schedu)
		{
   			$return = "";
			$this->intPerios = $perios;
			$this->strFecreg = $fecreg;
			$this->intSec_no = $sec_no;
			$this->intMat_no = $mat_no;
			$this->intStd_no = $std_no;
			$this->strParcia = $parcia;
			$this->intAbstip = $abstip;
			$this->strSchedu = $schedu;

			switch($this->intAbstip)
			{
				case 1:
					$this->strAbscod = 'JUSCOD';
					break;
				case 2:
					$this->strAbscod = 'INJCOD';
					break;
				case 3:
					$this->strAbscod = 'ATRCOD';
					break;
				case 4:
					$this->strAbscod = 'FUGCOD';
					break;
			}

			// Validamos en VSSECMAT si existe la malla escogida
			$sql              = "SELECT EMP_NO FROM vssecmat WHERE SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
			$request_vssecmat = $this->select($sql);
			if(empty($request_vssecmat))
			{
				// NO EXISTE MALLA
				$return = -1;
				return $return;
			}
			$this->intEmp_no = $request_vssecmat['EMP_NO'];

			foreach ($std_no as $std) 
			{
				$sql = "SELECT * FROM vsabsent WHERE PERIOS = {$this->intPerios} AND FECREG = '{$this->strFecreg}' AND STD_NO = $std AND SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no}";
				$request_vsabsent = $this->select_all($sql);
				if(empty($request_vsabsent))
				{
					$insert  = "INSERT INTO vsabsent(perios,fecreg,sec_no,mat_no,std_no,emp_no,parcia,abstip,schedu) VALUES(?,?,?,?,?,?,?,?,?)";
					$arrData = array($this->intPerios,$this->strFecreg,$this->intSec_no,$this->intMat_no,$std,$this->intEmp_no,$this->strParcia,$this->intAbstip,$this->strSchedu);
					$request_insert = $this->insert($insert,$arrData);
					$return  = $request_insert;

					// Cuenta todos los registros del Estudiante en la Asignatura por Tipo de Falta y agrupa en VSMATSTD
					$sql    		 = "SELECT count(*) as suma FROM vsabsent WHERE PERIOS = {$this->intPerios} AND STD_NO = $std AND MAT_NO = {$this->intMat_no} AND ABSTIP = {$this->intAbstip}";
					$arrPuntajes 	 = $this->select($sql);
					$this->intProptj = 0;
					
					if($arrPuntajes['suma'] != "")
					{
					   $this->intProptj = $arrPuntajes['suma'];	
					} 

					// Examina si existe el registro en VSMATSTD por A??o Estudiante y Asignatura
					$sql     			= "SELECT * FROM vsmatstd WHERE PERIOS = {$this->intPerios} AND STD_NO = $std AND MAT_NO = {$this->intMat_no}";
					$request_vsmatstd 	= $this->select($sql);
					if(empty($request_vsmatstd))
					{
						// Inserta VSMATSTD
						$insert   = "INSERT INTO vsmatstd(perios,std_no,mat_no,sec_no,emp_no) VALUES(?,?,?,?,?)";
						$arrData  = array($this->intPerios,$std,$this->intMat_no,$this->intSec_no,$this->intEmp_no);
						$request  = $this->insert($insert,$arrData);
					}

					// Actualiza VSMATSTD
					$insert   = "UPDATE vsmatstd SET {$this->strAbscod} = ? WHERE PERIOS = {$this->intPerios} AND STD_NO = $std AND MAT_NO = {$this->intMat_no}";
					$arrData  = array($this->intProptj);
					$request  = $this->update($insert,$arrData);
				}
			}
			return $return;
		}


		public function updateVsabsent(int $sec_id, int $perios, string $fecreg, int $sec_no, int $mat_no, array $std_no, string $parcia, int $abstip, string $schedu)
		{
   			$return = "";
  		    $this->intSec_id = $sec_id;
		    $this->intPerios = $perios;
			$this->strFecreg = $fecreg;
			$this->intSec_no = $sec_no;
			$this->intMat_no = $mat_no;
			$this->intStd_no = $std_no[0];
			$this->strParcia = $parcia;
			$this->intAbstip = $abstip;
			$this->strSchedu = $schedu;

			$sql = "SELECT * FROM vsabsent WHERE PERIOS = {$this->intPerios} AND FECREG = '{$this->strFecreg}' AND SEC_NO = {$this->intSec_no} AND MAT_NO = {$this->intMat_no} AND STD_NO = {$this->intStd_no} AND SEC_ID != {$this->intSec_id}";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$insert         = "UPDATE vsabsent SET parcia = ?, abstip = ?, schedu = ? WHERE SEC_ID = {$this->intSec_id}";
				$arrData        = array($this->strParcia,$this->intAbstip,$this->strSchedu);
				$request_insert = $this->update($insert,$arrData);
				$return         = $request_insert;

				for ($i=1; $i <= 4; $i++)
				{ 
					$this->intAbstip = $i;
					switch($i)
					{
						case 1:
							$this->strAbscod = 'JUSCOD';
							$sql    		 = "SELECT count(*) as suma FROM vsabsent WHERE PERIOS = {$this->intPerios} AND STD_NO = $this->intStd_no AND MAT_NO = {$this->intMat_no} AND ABSTIP = {$this->intAbstip}";
							$arrPuntajes 	 = $this->select($sql);
							break;
						case 2:
							$this->strAbscod = 'INJCOD';
							$sql    		 = "SELECT count(*) as suma FROM vsabsent WHERE PERIOS = {$this->intPerios} AND STD_NO = $this->intStd_no AND MAT_NO = {$this->intMat_no} AND ABSTIP = {$this->intAbstip}";
							$arrPuntajes 	 = $this->select($sql);
							break;
						case 3:
							$this->strAbscod = 'ATRCOD';
							$sql    		 = "SELECT count(*) as suma FROM vsabsent WHERE PERIOS = {$this->intPerios} AND STD_NO = $this->intStd_no AND MAT_NO = {$this->intMat_no} AND ABSTIP = {$this->intAbstip}";
							$arrPuntajes 	 = $this->select($sql);
							break;
						case 4:
							$this->strAbscod = 'FUGCOD';
							$sql    		 = "SELECT count(*) as suma FROM vsabsent WHERE PERIOS = {$this->intPerios} AND STD_NO = $this->intStd_no AND MAT_NO = {$this->intMat_no} AND ABSTIP = {$this->intAbstip}";
							$arrPuntajes 	 = $this->select($sql);
							break;
					}
	
					$this->intProptj[$i] = 0;
					if($arrPuntajes['suma'] != "")
					{
					   $this->intProptj[$i] = $arrPuntajes['suma'];	
					} 
				}
				
				// Actualiza VSMATSTD
				$insert   = "UPDATE vsmatstd SET juscod = ?, injcod = ?, atrcod = ?, fugcod = ? WHERE PERIOS = {$this->intPerios} AND STD_NO = {$this->intStd_no} AND MAT_NO = {$this->intMat_no}";
				$arrData  = array($this->intProptj[1],$this->intProptj[2],$this->intProptj[3],$this->intProptj[4]);
				$request  = $this->update($insert,$arrData);
				return $request; 
			}
		}
	}