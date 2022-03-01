 <?php

	class VslibsecModel extends Mysql
	{
		public $intCur_no;
		public $intNiv_no;
		public $strParale;
		public $strCur_nm;
		public $intPabell;
		public $intModoes;
		public $intRegime;
		public $intJor_no;

		public function __construct()
		{
			//echo "Mensaje desde el Modelo Home";
			parent::__construct();
		}

		public function selectVslibsec()
		{
			$usu = $_SESSION['userData']['USU_NO'];
			$rol = $_SESSION['userData']['rol_id'];
			switch($rol){
			case 5:  // Docente
					$sql = "SELECT 	a.SEC_NO,
									s.SEC_NM,
									s.NIV_NO,
									s.PARALE,
									s.JOR_NO
					FROM vssecmat a
					INNER JOIN vsection s ON a.SEC_NO = s.SEC_NO
					INNER JOIN vsemplox e ON a.EMP_NO = e.EMP_NO
					WHERE a.EMP_NO = $usu
					ORDER BY s.NIV_NO,s.PARALE";
					break;
			default: 
					// Extrae Secciones
					$sql  = 'SELECT * FROM vsection ORDER BY NIV_NO,PARALE';
					break;
			}
			$request = $this->select_all($sql);
			return $request;
		}

		public function oneVslibsec(int $idSec)
		{
			$this->intSec_no = $idSec;
			$sql = "SELECT * FROM vsection WHERE SEC_NO = $this->intSec_no";
			$request = $this->select($sql);
			return $request;
		}

		public function insertVslibsec(int $niv_no, string $parale, string $cur_nm, int $pabell, int $modoes, int $regime, int $jor_no)
		{
		}
	}
