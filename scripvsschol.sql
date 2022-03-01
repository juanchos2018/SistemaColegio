-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.0.28-0ubuntu0.20.04.3 - (Ubuntu)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla vsschool.vsabsent
CREATE TABLE IF NOT EXISTS `vsabsent` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `MAT_NO` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `PARCIA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ABSTIP` int DEFAULT NULL,
  `SCHEDU` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`),
  KEY `vsabs_student` (`STD_NO`),
  KEY `vsabs_section` (`SEC_NO`),
  KEY `vsabs_matter` (`MAT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsabsent: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsabsent` DISABLE KEYS */;
INSERT INTO `vsabsent` (`SEC_ID`, `PERIOS`, `FECREG`, `SEC_NO`, `MAT_NO`, `STD_NO`, `EMP_NO`, `PARCIA`, `ABSTIP`, `SCHEDU`) VALUES
	(8, 2021, '2021-11-30', 1, 1, 2, 1, 'Q1P1', 2, '');
/*!40000 ALTER TABLE `vsabsent` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsaccess
CREATE TABLE IF NOT EXISTS `vsaccess` (
  `USU_SEC` int NOT NULL AUTO_INCREMENT,
  `USU_ID` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USU_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USU_PAS` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USU_ROL` int DEFAULT NULL,
  `USU_NO` int DEFAULT '0',
  `PTO_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ESTADO` int DEFAULT NULL,
  `TOKEN` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DATECREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`USU_SEC`),
  KEY `rol_usuario` (`USU_ROL`),
  CONSTRAINT `rol_usuario` FOREIGN KEY (`USU_ROL`) REFERENCES `vsrolusr` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla vsschool.vsaccess: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `vsaccess` DISABLE KEYS */;
INSERT INTO `vsaccess` (`USU_SEC`, `USU_ID`, `ALI_NO`, `USU_NM`, `USU_PAS`, `USU_ROL`, `USU_NO`, `PTO_NO`, `ESTADO`, `TOKEN`, `DATECREATED`) VALUES
	(1, 'admin', NULL, 'admin', 'fae8379449b4e4f009ada7f7225f72d522027b11c03b9a5512e6c2d4d1542e47', 1, 0, '', 1, NULL, '2021-03-12 11:36:39'),
	(3, '0909319907', '', 'MONCAYO PATRICIO', 'b36673dcc4b48f3ea48fb815a8f372bb2175f2383ea4a5cd11fe689c17d96877', 1, 0, '001001', 1, NULL, '2021-11-27 19:43:41'),
	(4, '0923808802', 'MONCAYO CHICA', 'MONCAYO CHICA PATRICIO ANTONIO', '98f781d374157ef349341ab49d645b3ad043e9cefbc3225d4006fdb0095d1480', 7, 1, NULL, 1, NULL, '2021-11-15 10:30:20'),
	(5, '0800971608', 'CHICA AVEIGA', 'CHICA AVEIGA TONA', '3d72494bbba8fd26b33dd27fb47da46d4dca55573363d1fadb14128b60ac98df', 8, 1, NULL, 1, NULL, '2021-11-15 10:30:20'),
	(6, '0923808794', 'MONCAYO CHICA', 'MONCAYO CHICA ASTRID', '2ee1add614038cd3aed568c3f6691ee0b09ef11c61e4ffd4b8831698349739eb', 7, 2, NULL, 1, NULL, '2021-11-15 10:30:20'),
	(10, '1757216930', 'MENDOZA', 'MENDOZA PACO', '763148303a60ad9b981df117c511381ce5fdbc1115871cbfcda159fa8808f1a1', 7, 7, '', 1, NULL, '2021-11-21 17:20:50'),
	(11, '1713478772', 'LUCERO ALBAN', 'LUCERO ALBAN PATRICIA DEL CONSUELO', '15a9dc3da3966037dea8bf4cd614c535202a1ab42e9424da0a4af839847f0593', 8, 7, '', 1, NULL, '2021-11-21 17:20:52'),
	(12, '0913345377', 'MONCAYO MENDOZA', 'MONCAYO MENDOZA PABLO', 'b4bdbcc4f8d4996f4e70785def00aba6fffe218dc9d29b6d1481872539a694ad', 5, 1, '', 1, NULL, '2021-12-16 18:04:51'),
	(13, 'juan', 'fgfgf', 'juan', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 0, '', 1, NULL, '2022-02-15 04:19:17');
/*!40000 ALTER TABLE `vsaccess` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsacount
CREATE TABLE IF NOT EXISTS `vsacount` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTASUP` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTA_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTATIP` int DEFAULT NULL,
  `SIGNOS` int DEFAULT NULL,
  `CTANIV` int DEFAULT NULL,
  `CIERRE` int DEFAULT NULL,
  `ORDENS` int DEFAULT NULL,
  `PORCEN` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsacount: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `vsacount` DISABLE KEYS */;
INSERT INTO `vsacount` (`SEC_ID`, `CTA_NO`, `CTASUP`, `CTA_NM`, `CTATIP`, `SIGNOS`, `CTANIV`, `CIERRE`, `ORDENS`, `PORCEN`) VALUES
	(1, '1', '', 'ACTIVO', 1, 1, NULL, NULL, NULL, NULL),
	(2, '11', NULL, 'ACTIVOS CORRIENTES', 1, 1, NULL, NULL, NULL, NULL),
	(3, '111', NULL, 'ACTIVOS DISPONIBLES', 1, 1, NULL, NULL, NULL, NULL),
	(4, '1112', NULL, 'BANCOS', 1, 1, NULL, NULL, NULL, NULL),
	(5, '11121', NULL, 'Pichincha', 2, 1, NULL, NULL, NULL, NULL),
	(6, '2', NULL, 'PASIVOS', 1, -1, NULL, NULL, NULL, NULL),
	(7, '21', NULL, 'PASIVOS CORRIENTES', 1, -1, NULL, NULL, NULL, NULL),
	(8, '211', NULL, 'OBLIGACIONES Y CUENTAS POR PAGAR', 1, -1, NULL, NULL, NULL, NULL),
	(9, '2112', NULL, 'CUENTAS POR PAGAR', 1, -1, NULL, NULL, NULL, NULL),
	(10, '21121', NULL, 'PROVEEDORES', 1, -1, NULL, NULL, NULL, NULL),
	(11, '211211', NULL, 'Proveedores Locales', 2, -1, NULL, NULL, NULL, NULL),
	(12, '1111', '111', 'CAJA', 1, 1, NULL, NULL, NULL, NULL),
	(13, '11111', '1111', 'Caja General', 2, 1, NULL, NULL, NULL, NULL),
	(14, '5', '', 'COSTOS', 1, 1, NULL, NULL, NULL, NULL),
	(15, '51', '', 'OPERACIONALES', 1, 1, NULL, NULL, NULL, NULL),
	(16, '511', '51', 'COSTO DE GESTION EDUCATIVA', 1, 1, NULL, NULL, NULL, NULL),
	(17, '5111', '', 'Sueldos Autoridades y Directivos', 2, 1, NULL, NULL, NULL, NULL),
	(18, '211421', '', 'RetenciÃ³n Fuente 1.75%', 2, -1, NULL, NULL, NULL, NULL),
	(19, '51112', '', 'Gasto IVA', 2, 1, NULL, NULL, NULL, NULL),
	(20, '211431', '', 'RetenciÃ³n IVA por pagar', 2, -1, NULL, NULL, NULL, NULL),
	(21, '112221', '', 'Anticipos Proveedores', 2, 1, NULL, NULL, NULL, NULL),
	(22, '11122', '', 'Austro', 2, 1, NULL, NULL, NULL, NULL),
	(23, '4', '', 'INGRESOS', 1, -1, NULL, NULL, NULL, NULL),
	(24, '41', '', 'INGRESOS OPERACIONALES', 1, -1, NULL, NULL, NULL, NULL),
	(25, '411', '', 'VENTAS', 1, -1, NULL, NULL, NULL, NULL),
	(26, '4111', '', 'Matriculas', 2, -1, NULL, NULL, NULL, NULL),
	(27, '4112', '', 'Pensiones', 2, -1, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsacount` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsatssri
CREATE TABLE IF NOT EXISTS `vsatssri` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FECDES` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHAS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `LOGFIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsatssri: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsatssri` DISABLE KEYS */;
INSERT INTO `vsatssri` (`SEC_ID`, `PERIOS`, `FECDES`, `FECHAS`, `LOGFIL`) VALUES
	(70, '122021', '2021-12-01', '2021-12-31', 'Xml/17H02852/ATS-122021.xml');
/*!40000 ALTER TABLE `vsatssri` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsbanker
CREATE TABLE IF NOT EXISTS `vsbanker` (
  `BAN_NO` int NOT NULL AUTO_INCREMENT,
  `BAN_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CTANUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CHE_NO` int DEFAULT NULL,
  `ULTCCL` int DEFAULT NULL,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`BAN_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsbanker: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vsbanker` DISABLE KEYS */;
INSERT INTO `vsbanker` (`BAN_NO`, `BAN_NM`, `CTANUM`, `CHE_NO`, `ULTCCL`, `CTA_NO`) VALUES
	(1, 'AUSTRO', '12345678', 0, 0, '11122'),
	(2, 'PICHINCHA', '187574', 1260, 0, '11121'),
	(3, 'PACIFICO', '123', 0, 0, '1');
/*!40000 ALTER TABLE `vsbanker` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsbildet
CREATE TABLE IF NOT EXISTS `vsbildet` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `PER_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ART_NO` int DEFAULT NULL,
  `BAN_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCVAL` decimal(11,2) DEFAULT NULL,
  `FACVAL` decimal(11,2) DEFAULT NULL,
  `ABOVAL` decimal(11,2) DEFAULT NULL,
  `RETVAL` decimal(11,2) DEFAULT NULL,
  `DOCTIP` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCSIG` int DEFAULT NULL,
  `DOCPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCNUM` int DEFAULT NULL,
  `FECEMI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECCHE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `HORCOB` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PAYFOR` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTENUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CHENUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DEPNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TAR_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TARNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `VOUNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `AUT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `AUTRET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECRET` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CODRET` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `NUMRET` int DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  `MOTIVO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `USU_ID` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsbildet: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsbildet` DISABLE KEYS */;
INSERT INTO `vsbildet` (`SEC_ID`, `PERIOS`, `STD_NO`, `PER_NO`, `ART_NO`, `BAN_NO`, `REMARK`, `DOCVAL`, `FACVAL`, `ABOVAL`, `RETVAL`, `DOCTIP`, `DOCSIG`, `DOCPTO`, `DOCNUM`, `FECEMI`, `FECCHE`, `HORCOB`, `PAYFOR`, `CTENUM`, `CHENUM`, `DEPNUM`, `TAR_NO`, `TARNUM`, `VOUNUM`, `AUT_NO`, `AUTRET`, `FECRET`, `CODRET`, `NUMRET`, `ESTATU`, `MOTIVO`, `USU_ID`) VALUES
	(1, 2021, 1, '001', 1, '', '', 100.00, 100.00, 100.00, 0.00, 'FA', 1, '001001', 27, '2022-02-14', '2022-02-14', '', 'EFE', '', '', '', '', '', '', '140220220117917876410012001001271234567810', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsbildet` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsbillin
CREATE TABLE IF NOT EXISTS `vsbillin` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `CLTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RUC_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RAZONS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TLF_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EMAILS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCTIP` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCVAL` decimal(11,2) DEFAULT NULL,
  `DOCPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCNUM` int DEFAULT NULL,
  `FECEMI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `AUT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PTOAPL` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCAPL` int DEFAULT NULL,
  `DOCSIG` int DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  `LOGFIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsbillin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsbillin` DISABLE KEYS */;
INSERT INTO `vsbillin` (`SEC_ID`, `PERIOS`, `STD_NO`, `CLTYPE`, `RUC_NO`, `RAZONS`, `DIRECC`, `TLF_NO`, `EMAILS`, `DOCTIP`, `DOCVAL`, `DOCPTO`, `DOCNUM`, `FECEMI`, `AUT_NO`, `PTOAPL`, `DOCAPL`, `DOCSIG`, `REMARK`, `ESTATU`, `LOGFIL`) VALUES
	(1, 2021, 1, '05', '0909319907', 'MONCAYO PATRICIO', 'a', '1', 'patmoncayo@hotmail.com', 'FA', 100.00, '001001', 27, '2022-02-14', '140220220117917876410012001001271234567810', '', 0, 1, NULL, NULL, 'Xml/17H02852/1791787641001FA001001000000027.xml');
/*!40000 ALTER TABLE `vsbillin` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vschedul
CREATE TABLE IF NOT EXISTS `vschedul` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `HORREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `MAT_NO` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `FECMAX` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PARCIA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `INSUMO` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PUNTAJ` decimal(6,2) DEFAULT NULL,
  `SCHEDU` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `VDLINK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FLNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FLTASK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `MESSAG` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `DATECREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SEC_ID`),
  KEY `vsch_section` (`SEC_NO`),
  KEY `vsch_matter` (`MAT_NO`),
  KEY `vsch_student` (`STD_NO`),
  KEY `vsch_emp` (`EMP_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vschedul: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `vschedul` DISABLE KEYS */;
INSERT INTO `vschedul` (`SEC_ID`, `PERIOS`, `FECREG`, `HORREG`, `SEC_NO`, `MAT_NO`, `STD_NO`, `EMP_NO`, `FECMAX`, `PARCIA`, `INSUMO`, `PUNTAJ`, `SCHEDU`, `VDLINK`, `FLNAME`, `FLTASK`, `MESSAG`, `DATECREATED`) VALUES
	(1, 2021, '2022-01-11', '18:31:53', 1, 1, 1, 1, '2022-01-11', 'Q1P1I4', 'I4', 5.00, 'a', '', '', '', NULL, '2022-01-11 18:31:53'),
	(2, 2021, '2022-01-11', '18:31:53', 1, 1, 2, 1, '2022-01-11', 'Q1P1I4', 'I4', 5.00, 'a', '', '', '', NULL, '2022-01-11 18:31:53'),
	(3, 2021, '2022-01-11', '18:33:03', 1, 1, 1, 1, '2022-01-11', 'Q1P2I4', 'I4', 5.00, 'a', '', '', '', NULL, '2022-01-11 18:33:03'),
	(4, 2021, '2022-01-11', '18:33:03', 1, 1, 2, 1, '2022-01-11', 'Q1P2I4', 'I4', 5.00, 'a', '', '', '', NULL, '2022-01-11 18:33:04'),
	(5, 2021, '2022-01-11', '18:34:15', 1, 1, 1, 1, '2022-01-11', 'Q1P1I3', 'I3', 3.00, 'a', '', 'ANEXO 3.xlsx', '', NULL, '2022-02-06 09:09:27'),
	(6, 2021, '2022-01-11', '18:35:05', 1, 1, 1, 1, '2022-01-11', 'Q1P2I3', 'I3', 3.00, 'a', '', '', '', NULL, '2022-01-11 18:35:05'),
	(7, 2021, '2022-01-11', '18:36:19', 1, 1, 1, 1, '2022-01-11', 'Q1P2I2', 'I2', 1.00, 'a', '', '', '', NULL, '2022-01-11 18:36:19'),
	(8, 2021, '2022-01-11', '18:37:08', 1, 1, 1, 1, '2022-01-11', 'Q1P1I2', 'I2', 1.00, 'a', '', '', '', NULL, '2022-01-11 18:37:08'),
	(9, 2021, '2022-01-11', '18:38:13', 1, 1, 1, 1, '2022-01-11', 'Q2P1I4', 'I4', 5.00, 'a', '', '', '', NULL, '2022-01-11 18:38:13'),
	(10, 2021, '2022-01-11', '18:39:35', 1, 1, 1, 1, '2022-01-11', 'Q2P2I4', 'I4', 5.00, 'a', '', '', '', NULL, '2022-01-11 18:39:35'),
	(11, 2021, '2022-01-11', '18:40:06', 1, 1, 1, 1, '2022-01-11', 'Q2P1I3', 'I3', 3.00, 'a', '', '', '', NULL, '2022-01-11 18:40:06'),
	(12, 2021, '2022-01-11', '18:41:11', 1, 1, 1, 1, '2022-01-11', 'Q2P2I3', 'I3', 3.00, 'a', '', '', '', NULL, '2022-01-11 18:41:11'),
	(13, 2021, '2022-01-11', '18:41:41', 1, 1, 1, 1, '2022-01-11', 'Q2P1I2', 'I2', 1.00, 'a', '', '', '', NULL, '2022-01-11 18:41:41'),
	(14, 2021, '2022-01-11', '18:42:36', 1, 1, 1, 1, '2022-01-11', 'Q2P2I1', 'I1', 1.00, 'a', '', '', '', NULL, '2022-01-11 18:42:36'),
	(15, 2021, '2022-02-03', '18:33:06', 1, 1, 1, 1, '2022-02-03', 'Q1P4I4', 'I4', 10.00, 'PRUEBA', '', '', '', NULL, '2022-02-03 18:33:06'),
	(16, 2021, '2022-02-06', '19:47:17', 1, 1, 2, 1, '2022-02-06', 'Q2P1I3', 'I3', 5.00, '2', '', '', '', NULL, '2022-02-06 19:47:17');
/*!40000 ALTER TABLE `vschedul` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsclinic
CREATE TABLE IF NOT EXISTS `vsclinic` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `STD_NO` int DEFAULT NULL,
  `CAS_NO` int DEFAULT NULL,
  `HISCOD` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FECNEX` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `WEIGHS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `HEIGHS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PRESUR` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `TEMPER` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PROBLE` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `EXPLOR` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `TRATAM` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REMARK` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`),
  KEY `clinic_std` (`STD_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsclinic: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `vsclinic` DISABLE KEYS */;
INSERT INTO `vsclinic` (`SEC_ID`, `STD_NO`, `CAS_NO`, `HISCOD`, `FECREG`, `FECNEX`, `WEIGHS`, `HEIGHS`, `PRESUR`, `TEMPER`, `PROBLE`, `EXPLOR`, `TRATAM`, `REMARK`) VALUES
	(1, 14, 0, 'MED', '2021-03-03', '2021-03-03', '156.78', '1.80', '170', '39.90', '1', '1', '1', '1'),
	(2, 20, 5, 'SOC', '2021-03-03', '2021-03-05', NULL, NULL, NULL, NULL, 'RELAJOSO Y MENTIROSO', 'RELAJOSO', 'RELAJOSO', 'RELAJOSO');
/*!40000 ALTER TABLE `vsclinic` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsctatip
CREATE TABLE IF NOT EXISTS `vsctatip` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `TAB_NO` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SUB_NO` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SUB_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTADEB` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTACRE` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ARE_NO` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FACTOR` decimal(6,2) DEFAULT NULL,
  `VALORS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ENTITY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTAFIL` int DEFAULT NULL,
  `CTAMOV` int DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsctatip: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `vsctatip` DISABLE KEYS */;
INSERT INTO `vsctatip` (`SEC_ID`, `TAB_NO`, `SUB_NO`, `SUB_NM`, `CTADEB`, `CTACRE`, `ARE_NO`, `FACTOR`, `VALORS`, `ENTITY`, `CTAFIL`, `CTAMOV`) VALUES
	(5, 'PF', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'PRV_NO', 1, -1),
	(7, 'DE', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'BAN_NO', 1, 1),
	(9, 'DE', NULL, NULL, '', '', NULL, 0.00, 'VALORS', '', 1, -1),
	(11, 'PF', NULL, NULL, '', '211421', NULL, 1.75, 'MONRF1', 'PORRF1', 2, -1),
	(12, 'PF', NULL, NULL, '51112', '', NULL, 0.00, 'MONIVA', '', 2, 1),
	(14, 'PF', NULL, NULL, '', '', NULL, 1.00, 'BASIVA', '', 1, 1),
	(15, 'PF', NULL, NULL, '', '211431', NULL, 30.00, 'MONRI1', 'PORRI1', 2, -1),
	(16, 'PC', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'BAN_NO', 1, -1),
	(17, 'PC', NULL, NULL, '', '', NULL, 0.00, 'VALORS', '', 1, 1),
	(18, 'CP', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'PRV_NO', 1, 1),
	(19, 'CP', NULL, NULL, '', '', NULL, 1.00, 'VALORS', '', 1, -1),
	(20, 'TR', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'BAN_NO', 1, 1),
	(21, 'TR', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'BAN_NO', 1, -1),
	(22, 'CB', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'BAN_NO', 1, 1),
	(23, 'CB', NULL, NULL, '', '', NULL, 0.00, 'VALORS', '', 1, -1),
	(25, 'FA', NULL, NULL, '11111', '', NULL, 0.00, 'ABOVAL', '', 2, 1),
	(26, 'FA', NULL, NULL, '', '', NULL, 0.00, 'ABOVAL', 'ART_NO', 1, -1),
	(27, 'NC', NULL, NULL, '', '', NULL, 0.00, 'ABOVAL', 'ART_NO', 1, 1),
	(28, 'NC', NULL, NULL, '', '11111', NULL, 0.00, 'ABOVAL', '', 2, -1),
	(29, 'DP', NULL, NULL, '', '', NULL, 1.00, 'VALORS', '', 1, 1),
	(30, 'DP', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'PRV_NO', 1, -1),
	(31, 'PC', NULL, NULL, '112221', '', NULL, 2.00, 'VALORS', 'FORPAG', 2, 1),
	(32, 'PD', NULL, NULL, '112221', '', NULL, 3.00, 'VALORS', 'FORPAG', 2, 1),
	(33, 'PD', NULL, NULL, '', '', NULL, 0.00, 'VALORS', 'BAN_NO', 1, -1),
	(34, 'PD', NULL, NULL, '', '', NULL, 0.00, 'VALORS', '', 1, 1);
/*!40000 ALTER TABLE `vsctatip` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsdefaul
CREATE TABLE IF NOT EXISTS `vsdefaul` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `AMI_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PERIOS` int DEFAULT NULL,
  `RAZONS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ADDRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RUC_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EMAILS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PARROQ` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CIUDAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CANTON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PROVIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REGIME` int DEFAULT NULL,
  `SOSTEN` int DEFAULT NULL,
  `Q1P1HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P2HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P3HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P4HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P1HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P2HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P3HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P4HD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P1PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P2PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P3PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1P4PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P1PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P2PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P3PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2P4PR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BASCAL` int DEFAULT NULL,
  `MINSUP` int DEFAULT NULL,
  `PARPRO` int DEFAULT NULL,
  `INSNUM` int DEFAULT NULL,
  `PARPOR` int DEFAULT NULL,
  `EXAPOR` int DEFAULT NULL,
  `DECNUM` int DEFAULT NULL,
  `RECTORIA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `SECRETARIO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `MATNUM` int NOT NULL,
  `FOLNUM` int NOT NULL,
  `LOGOTIPO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IVAPOR` decimal(6,2) DEFAULT NULL,
  `APORTE` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsdefaul: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsdefaul` DISABLE KEYS */;
INSERT INTO `vsdefaul` (`SEC_ID`, `AMI_ID`, `PERIOS`, `RAZONS`, `ADDRES`, `TPHONE`, `RUC_NO`, `EMAILS`, `PARROQ`, `CIUDAD`, `CANTON`, `PROVIN`, `REGIME`, `SOSTEN`, `Q1P1HD`, `Q1P2HD`, `Q1P3HD`, `Q1P4HD`, `Q2P1HD`, `Q2P2HD`, `Q2P3HD`, `Q2P4HD`, `Q1P1PR`, `Q1P2PR`, `Q1P3PR`, `Q1P4PR`, `Q2P1PR`, `Q2P2PR`, `Q2P3PR`, `Q2P4PR`, `BASCAL`, `MINSUP`, `PARPRO`, `INSNUM`, `PARPOR`, `EXAPOR`, `DECNUM`, `RECTORIA`, `SECRETARIO`, `MATNUM`, `FOLNUM`, `LOGOTIPO`, `IVAPOR`, `APORTE`) VALUES
	(1, '17H02852', 2021, 'UNIDAD EDUCATIVA SANTO GRIAL', 'Duran', '2441174', '1791787641001', 'patmoncayo@hotmail.com', '', 'GUAYAQUIL', 'GUAYAQUIL', 'GUAYAS', 2, 5, '1er Parcial', '2do Parcial', '3er Parcial', 'Examen', '1er Parcial', '2do Parcial', '3er Parcial', 'Examen', '2020-11-09', '2021-01-25', '', '', '2021-04-12', '2021-07-01', '', '', 10, 7, 1, 5, 80, 20, 2, 'Lic. XXX', 'Lic. XXX', 10, 10, 'images/logo-uens.svg', 12.00, 9.45);
/*!40000 ALTER TABLE `vsdefaul` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsection
CREATE TABLE IF NOT EXISTS `vsection` (
  `SEC_NO` int NOT NULL AUTO_INCREMENT,
  `NIV_NO` int DEFAULT NULL,
  `PARALE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SEC_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PABELL` int DEFAULT NULL,
  `MODOES` int DEFAULT NULL,
  `REGIME` int DEFAULT NULL,
  `JOR_NO` int DEFAULT NULL,
  `SEC_N2` int DEFAULT NULL,
  PRIMARY KEY (`SEC_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsection: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `vsection` DISABLE KEYS */;
INSERT INTO `vsection` (`SEC_NO`, `NIV_NO`, `PARALE`, `SEC_NM`, `PABELL`, `MODOES`, `REGIME`, `JOR_NO`, `SEC_N2`) VALUES
	(1, 20, 'A', 'SEGUNDO GRADO DE BASICA ELEMENTAL', 1, 1, 2, 1, 2),
	(2, 30, 'A', 'TERCER GRADO DE BASICA ELEMENTAL', 1, 1, 2, 1, 0),
	(3, 40, 'A', 'CUARTO GRADO DE EDUCACION GENERAL BASICA', 2, 1, 2, 1, 0),
	(4, 50, 'A', 'QUINTO GRADO DE EDUCACION GENERAL BASICA', 2, 1, 2, 1, 0),
	(5, 60, 'A', 'SEXTO GRADO DE EDUCACION GENERAL BASICA', 2, 1, 2, 1, 0),
	(6, 70, 'A', 'SEPTIMO GRADO DE EDUCACION GENERAL BASICA', 2, 1, 2, 1, 0),
	(7, 80, 'A', 'OCTAVO GRADO DE EDUCACION GENERAL BASICA', 3, 1, 2, 1, 0);
/*!40000 ALTER TABLE `vsection` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsempcre
CREATE TABLE IF NOT EXISTS `vsempcre` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `MOV_NO` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `HORREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `RUB_NO` int DEFAULT NULL,
  `BAN_NO` int DEFAULT NULL,
  `CHE_NO` int DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `VALORS` decimal(11,2) DEFAULT NULL,
  `PLAZOS` int DEFAULT NULL,
  `CUOTAS` decimal(11,2) DEFAULT NULL,
  `FORPAG` int DEFAULT NULL,
  `PERDES` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `QUINCE` int DEFAULT NULL,
  `DESCON` int DEFAULT NULL,
  `REVERS` int DEFAULT NULL,
  `SUC_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsempcre: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `vsempcre` DISABLE KEYS */;
INSERT INTO `vsempcre` (`SEC_ID`, `MOV_NO`, `FECREG`, `HORREG`, `EMP_NO`, `RUB_NO`, `BAN_NO`, `CHE_NO`, `REMARK`, `VALORS`, `PLAZOS`, `CUOTAS`, `FORPAG`, `PERDES`, `QUINCE`, `DESCON`, `REVERS`, `SUC_NO`) VALUES
	(1, 27, '2022-01-22', '15:02:42', 1, 4, 2, 123, 'MEDICINA - MONCAYO MENDOZA PABLO', 50.00, 1, 50.00, 2, '202101', NULL, 0, NULL, NULL),
	(2, 28, '2022-01-22', '16:01:10', 1, 4, 2, 178, 'COMPRA DE LAPTOP - MONCAYO MENDOZA PABLO', 100.00, 3, 33.33, 2, '202101', NULL, 0, NULL, NULL),
	(3, 28, '2022-01-22', '16:01:10', 1, 4, 2, 178, 'COMPRA DE LAPTOP - MONCAYO MENDOZA PABLO', 100.00, 3, 33.33, 2, '202102', NULL, 0, NULL, NULL),
	(4, 28, '2022-01-22', '16:01:10', 1, 4, 2, 178, 'COMPRA DE LAPTOP - MONCAYO MENDOZA PABLO', 100.00, 3, 33.33, 2, '202103', NULL, 0, NULL, NULL),
	(5, 29, '2022-01-23', '12:54:23', 2, 4, 2, 0, 'PRUEBA - MONCAYO CHICA ASTRID', 500.00, 2, 250.00, 0, '202101', NULL, 0, NULL, NULL),
	(6, 29, '2022-01-23', '12:54:23', 2, 4, 2, 0, 'PRUEBA - MONCAYO CHICA ASTRID', 500.00, 2, 250.00, 0, '202102', NULL, 0, NULL, NULL);
/*!40000 ALTER TABLE `vsempcre` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsemplox
CREATE TABLE IF NOT EXISTS `vsemplox` (
  `EMP_NO` int NOT NULL AUTO_INCREMENT,
  `CAT_NO` int DEFAULT NULL,
  `LAS_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FIR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ADDRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `TPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PARROQ` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CIUDAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PROVIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PAISES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `IDTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `IDE_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `EMPGEN` int DEFAULT NULL,
  `ESTADO` int DEFAULT NULL,
  `FECBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FECING` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `EMPMAI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `BAN_NO` int DEFAULT NULL,
  `CTATYP` int DEFAULT NULL,
  `CTABAN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `SERVIC` int DEFAULT NULL,
  `MAGIST` int DEFAULT NULL,
  `SECCOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `POSCOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `EMPRLG` int DEFAULT NULL,
  `CARGAS` int DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  `PROFIL` int DEFAULT NULL,
  `TITULO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `SALARY` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`EMP_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsemplox: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `vsemplox` DISABLE KEYS */;
INSERT INTO `vsemplox` (`EMP_NO`, `CAT_NO`, `LAS_NM`, `FIR_NM`, `ADDRES`, `TPHONE`, `PARROQ`, `CIUDAD`, `PROVIN`, `PAISES`, `IDTYPE`, `IDE_NO`, `EMPGEN`, `ESTADO`, `FECBIR`, `FECING`, `EMPMAI`, `BAN_NO`, `CTATYP`, `CTABAN`, `SERVIC`, `MAGIST`, `SECCOD`, `POSCOD`, `EMPRLG`, `CARGAS`, `ESTATU`, `PROFIL`, `TITULO`, `REMARK`, `SALARY`) VALUES
	(1, 1, 'MONCAYO MENDOZA', 'PABLO', 'A', '1', '', '', '', '', '05', '0913345377', 1, 2, '', '2022-01-21', 'info@conservatoriojaimemola.edu.ec', 0, 1, '', 0, 0, '', '', 1, 0, 1, 5, '', '', 1500.00),
	(2, 1, 'MOYANO PIEDRA', 'AURA ELIZABETH', 'a', '1', '', '', '', '', '05', '0923808794', 2, 1, '', '2022-01-23', 'info@conservatoriojaimemola.edu.ec', NULL, 1, '', 0, 0, '', '', 1, 0, 1, 2, '', '', 2000.00);
/*!40000 ALTER TABLE `vsemplox` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsexamen
CREATE TABLE IF NOT EXISTS `vsexamen` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECINI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `HORINI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `HORFIN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `MAT_NO` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `PARCIA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SCHEDU` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSWE1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSWE2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSWE3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSWE4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSWE5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSWER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANSSTD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `VALEXA` decimal(6,2) DEFAULT NULL,
  `VDLINK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FLNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FLTASK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsexamen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsexamen` DISABLE KEYS */;
INSERT INTO `vsexamen` (`SEC_ID`, `PERIOS`, `FECREG`, `FECINI`, `HORINI`, `HORFIN`, `SEC_NO`, `MAT_NO`, `STD_NO`, `EMP_NO`, `PARCIA`, `SCHEDU`, `ANSWE1`, `ANSWE2`, `ANSWE3`, `ANSWE4`, `ANSWE5`, `ANSWER`, `ANSSTD`, `VALEXA`, `VDLINK`, `FLNAME`, `FLTASK`) VALUES
	(2, 2021, '2022-01-19', '2022-01-19', '12:38:51', NULL, 1, 1, 1, 1, 'Q1P1', 'QUIEN ES COJON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsexamen` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsficsoc
CREATE TABLE IF NOT EXISTS `vsficsoc` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `STD_NO` int DEFAULT NULL,
  `CIVILS` int DEFAULT NULL,
  `ETNICO` int DEFAULT NULL,
  `STDJOB` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `STDWRK` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `HOUCON` int DEFAULT NULL,
  `HOUTYP` int DEFAULT NULL,
  `ENERGY` int DEFAULT NULL,
  `WATERS` int DEFAULT NULL,
  `TOILET` int DEFAULT NULL,
  `SEPTIC` int DEFAULT NULL,
  `TELEPH` int DEFAULT NULL,
  `SMARPH` int DEFAULT NULL,
  `INTERN` int DEFAULT NULL,
  `TVCABL` int DEFAULT NULL,
  `MEDATT` int DEFAULT NULL,
  `MEDFRE` int DEFAULT NULL,
  `ALERMD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ALERFO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ALERCL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ALEROT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `BLOODT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `DISEAS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MEDICI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `DISCAP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CONADI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `OBESID` int DEFAULT NULL,
  `DIABET` int DEFAULT NULL,
  `HIPERT` int DEFAULT NULL,
  `CARDIO` int DEFAULT NULL,
  `BRAINS` int DEFAULT NULL,
  `OTHERS` int DEFAULT NULL,
  `REMARK` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsficsoc: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsficsoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `vsficsoc` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsmatstd
CREATE TABLE IF NOT EXISTS `vsmatstd` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `MAT_NO` int DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `Q1P1I1` decimal(6,2) DEFAULT NULL,
  `Q1P1I2` decimal(6,2) DEFAULT NULL,
  `Q1P1I3` decimal(6,2) DEFAULT NULL,
  `Q1P1I4` decimal(6,2) DEFAULT NULL,
  `Q1P1I5` decimal(6,2) DEFAULT NULL,
  `Q1P1PR` decimal(6,2) DEFAULT NULL,
  `Q1P2I1` decimal(6,2) DEFAULT NULL,
  `Q1P2I2` decimal(6,2) DEFAULT NULL,
  `Q1P2I3` decimal(6,2) DEFAULT NULL,
  `Q1P2I4` decimal(6,2) DEFAULT NULL,
  `Q1P2I5` decimal(6,2) DEFAULT NULL,
  `Q1P2PR` decimal(6,2) DEFAULT NULL,
  `Q1P3I1` decimal(6,2) DEFAULT NULL,
  `Q1P3I2` decimal(6,2) DEFAULT NULL,
  `Q1P3I3` decimal(6,2) DEFAULT NULL,
  `Q1P3I4` decimal(6,2) DEFAULT NULL,
  `Q1P3I5` decimal(6,2) DEFAULT NULL,
  `Q1P3PR` decimal(6,2) DEFAULT NULL,
  `Q1P4I1` decimal(6,2) DEFAULT NULL,
  `Q1P4I2` decimal(6,2) DEFAULT NULL,
  `Q1P4I3` decimal(6,2) DEFAULT NULL,
  `Q1P4I4` decimal(6,2) DEFAULT NULL,
  `Q1P4I5` decimal(6,2) DEFAULT NULL,
  `Q1P4PR` decimal(6,2) DEFAULT NULL,
  `Q1_PRO` decimal(6,2) DEFAULT NULL,
  `Q1_MEJ` decimal(6,2) DEFAULT NULL,
  `Q2P1I1` decimal(6,2) DEFAULT NULL,
  `Q2P1I2` decimal(6,2) DEFAULT NULL,
  `Q2P1I3` decimal(6,2) DEFAULT NULL,
  `Q2P1I4` decimal(6,2) DEFAULT NULL,
  `Q2P1I5` decimal(6,2) DEFAULT NULL,
  `Q2P1PR` decimal(6,2) DEFAULT NULL,
  `Q2P2I1` decimal(6,2) DEFAULT NULL,
  `Q2P2I2` decimal(6,2) DEFAULT NULL,
  `Q2P2I3` decimal(6,2) DEFAULT NULL,
  `Q2P2I4` decimal(6,2) DEFAULT NULL,
  `Q2P2I5` decimal(6,2) DEFAULT NULL,
  `Q2P2PR` decimal(6,2) DEFAULT NULL,
  `Q2P3I1` decimal(6,2) DEFAULT NULL,
  `Q2P3I2` decimal(6,2) DEFAULT NULL,
  `Q2P3I3` decimal(6,2) DEFAULT NULL,
  `Q2P3I4` decimal(6,2) DEFAULT NULL,
  `Q2P3I5` decimal(6,2) DEFAULT NULL,
  `Q2P3PR` decimal(6,2) DEFAULT NULL,
  `Q2P4I1` decimal(6,2) DEFAULT NULL,
  `Q2P4I2` decimal(6,2) DEFAULT NULL,
  `Q2P4I3` decimal(6,2) DEFAULT NULL,
  `Q2P4I4` decimal(6,2) DEFAULT NULL,
  `Q2P4I5` decimal(6,2) DEFAULT NULL,
  `Q2P4PR` decimal(6,2) DEFAULT NULL,
  `Q2_PRO` decimal(6,2) DEFAULT NULL,
  `Q2_MEJ` decimal(6,2) DEFAULT NULL,
  `SUPLET` decimal(6,2) DEFAULT NULL,
  `REMEDI` decimal(6,2) DEFAULT NULL,
  `GRACIA` decimal(6,2) DEFAULT NULL,
  `GRADOS` decimal(6,2) DEFAULT NULL,
  `PARSTD` decimal(6,2) DEFAULT NULL,
  `RESOLU` decimal(6,2) DEFAULT NULL,
  `PROFIN` decimal(7,3) DEFAULT NULL,
  `OBSQ11` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQ12` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQ13` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQU1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQ21` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQ22` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQ23` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `OBSQU2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQ11` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQ12` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQ13` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQU1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQ21` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQ22` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQ23` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PLNQU2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `JUSCOD` int DEFAULT NULL,
  `INJCOD` int DEFAULT NULL,
  `ATRCOD` int DEFAULT NULL,
  `FUGCOD` int DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsmatstd: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `vsmatstd` DISABLE KEYS */;
INSERT INTO `vsmatstd` (`SEC_ID`, `PERIOS`, `STD_NO`, `MAT_NO`, `SEC_NO`, `EMP_NO`, `Q1P1I1`, `Q1P1I2`, `Q1P1I3`, `Q1P1I4`, `Q1P1I5`, `Q1P1PR`, `Q1P2I1`, `Q1P2I2`, `Q1P2I3`, `Q1P2I4`, `Q1P2I5`, `Q1P2PR`, `Q1P3I1`, `Q1P3I2`, `Q1P3I3`, `Q1P3I4`, `Q1P3I5`, `Q1P3PR`, `Q1P4I1`, `Q1P4I2`, `Q1P4I3`, `Q1P4I4`, `Q1P4I5`, `Q1P4PR`, `Q1_PRO`, `Q1_MEJ`, `Q2P1I1`, `Q2P1I2`, `Q2P1I3`, `Q2P1I4`, `Q2P1I5`, `Q2P1PR`, `Q2P2I1`, `Q2P2I2`, `Q2P2I3`, `Q2P2I4`, `Q2P2I5`, `Q2P2PR`, `Q2P3I1`, `Q2P3I2`, `Q2P3I3`, `Q2P3I4`, `Q2P3I5`, `Q2P3PR`, `Q2P4I1`, `Q2P4I2`, `Q2P4I3`, `Q2P4I4`, `Q2P4I5`, `Q2P4PR`, `Q2_PRO`, `Q2_MEJ`, `SUPLET`, `REMEDI`, `GRACIA`, `GRADOS`, `PARSTD`, `RESOLU`, `PROFIN`, `OBSQ11`, `OBSQ12`, `OBSQ13`, `OBSQU1`, `OBSQ21`, `OBSQ22`, `OBSQ23`, `OBSQU2`, `PLNQ11`, `PLNQ12`, `PLNQ13`, `PLNQU1`, `PLNQ21`, `PLNQ22`, `PLNQ23`, `PLNQU2`, `JUSCOD`, `INJCOD`, `ATRCOD`, `FUGCOD`) VALUES
	(1, 2021, 1, 1, 1, 1, 1.00, 2.00, 0.00, 0.00, NULL, 3.00, NULL, 1.00, 3.00, 5.00, NULL, 9.00, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 10.00, NULL, 10.00, 6.80, NULL, NULL, 1.00, 3.00, 5.00, NULL, 9.00, 1.00, NULL, 3.00, 5.00, NULL, 9.00, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0.00, 7.20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 2021, 2, 1, 1, 1, 0.80, 2.00, 5.00, 2.00, NULL, 9.80, NULL, NULL, NULL, 5.00, NULL, 5.00, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 8.00, 8.00, 7.52, NULL, NULL, NULL, 5.00, NULL, NULL, 5.00, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0.00, 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsmatstd` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsmatter
CREATE TABLE IF NOT EXISTS `vsmatter` (
  `MAT_NO` int NOT NULL AUTO_INCREMENT,
  `MAT_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REGIME` int DEFAULT NULL,
  `CALIFI` int DEFAULT NULL,
  `PROMED` int DEFAULT NULL,
  `EBOOKS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAN01` int DEFAULT NULL,
  `CUAN02` int DEFAULT NULL,
  `CUAN03` int DEFAULT NULL,
  `CUAN04` int DEFAULT NULL,
  `CUAN05` int DEFAULT NULL,
  `CUAN06` int DEFAULT NULL,
  `CUAN07` int DEFAULT NULL,
  `CUAN08` int DEFAULT NULL,
  `CUAN09` int DEFAULT NULL,
  `CUAN10` int DEFAULT NULL,
  `CUAL01` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL02` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL03` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL04` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL05` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL06` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL07` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL08` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL09` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CUAL10` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `GRU_NO` int DEFAULT NULL,
  `ent1` int NOT NULL,
  `ent2` int NOT NULL,
  `var1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `var2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`MAT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsmatter: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `vsmatter` DISABLE KEYS */;
INSERT INTO `vsmatter` (`MAT_NO`, `MAT_NM`, `REGIME`, `CALIFI`, `PROMED`, `EBOOKS`, `CUAN01`, `CUAN02`, `CUAN03`, `CUAN04`, `CUAN05`, `CUAN06`, `CUAN07`, `CUAN08`, `CUAN09`, `CUAN10`, `CUAL01`, `CUAL02`, `CUAL03`, `CUAL04`, `CUAL05`, `CUAL06`, `CUAL07`, `CUAL08`, `CUAL09`, `CUAL10`, `GRU_NO`, `ent1`, `ent2`, `var1`, `var2`) VALUES
	(1, 'MATEMATICA', 1, 1, 1, '', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'R', 'R', 'R', 'R', 'B', 'B', 'MB', 'MB', 'EX', 'EX', NULL, 0, 0, '', ''),
	(2, 'LENGUA Y LITERATURA', 1, 1, 1, '', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'R', 'R', 'R', 'R', 'B', 'B', 'MB', 'MB', 'EX', 'EX', 0, 0, 0, '', ''),
	(3, 'CIENCIAS NATURALES', 1, 1, 1, '', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'R', 'R', 'R', 'R', 'B', 'B', 'MB', 'MB', 'EX', 'EX', 0, 0, 0, '', ''),
	(4, 'ESTUDIOS SOCIALES', 1, 1, 1, '', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'R', 'R', 'R', 'R', 'B', 'B', 'MB', 'MB', 'EX', 'EX', 0, 0, 0, '', ''),
	(5, 'COMPORTAMIENTO', 2, 2, 1, '', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'R', 'R', 'R', 'R', 'B', 'B', 'MB', 'MB', 'EX', 'EX', 0, 0, 0, '', '');
/*!40000 ALTER TABLE `vsmatter` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsmodul
CREATE TABLE IF NOT EXISTS `vsmodul` (
  `idmodulo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `estado` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsmodul: ~45 rows (aproximadamente)
/*!40000 ALTER TABLE `vsmodul` DISABLE KEYS */;
INSERT INTO `vsmodul` (`idmodulo`, `nombre`, `descripcion`, `estado`, `id`) VALUES
	(1, 'DASHBOARD', 'DASHBOARD', 1, 1),
	(2, 'FICHA ESTUDIANTIL', 'FICHA ESTUDIANTIL', 1, 2),
	(3, 'SECCIONES', 'SECCIONES', 1, 3),
	(4, 'ASIGNATURAS', 'ASIGNATURAS', 1, 4),
	(5, 'FICHA PERSONAL', 'FICHA PERSONAL', 1, 5),
	(6, 'MALLA CURRICULAR', 'MALLA CURRICULAR', 1, 6),
	(7, 'NOTIFICACIONES', 'NOTIFICACIONES', 1, 7),
	(8, 'AULA VIRTUAL', 'AULA VIRTUAL', 1, 8),
	(9, 'BOLETINES', 'BOLETINES', 1, 9),
	(10, 'CERTIFICADOS', 'CERTIFICADOS', 1, 10),
	(11, 'INFORME ACTAS CALIFICACIONES', 'INFORME ACTAS CALIFICACIONES', 1, 11),
	(12, 'INFORME CUADROS CALIFICACIONES', 'INFORME CUADROS CALIFICACIONES', 1, 12),
	(13, 'EXAMENES', 'EXAMENES', 1, 13),
	(14, 'REGISTRAR ACTAS CALIFICACIONES', 'REGISTRAR ACTAS CALIFICACIONES', 1, 14),
	(15, 'D.E.C.E.', 'D.E.C.E.', 1, 15),
	(16, 'ENFERMERIA', 'ENFERMERIA', 1, 16),
	(17, 'PARAMETROS GENERALES', 'PARAMETROS GENERALES', 1, 17),
	(18, 'TABLAS', 'TABLAS', 1, 18),
	(19, 'USUARIOS', 'USUARIOS', 1, 19),
	(20, 'WIDGETS', 'WIDGETS', 1, 20),
	(21, 'XXX', 'XXX', 1, 21),
	(22, 'XXX', 'XXX', 1, 22),
	(23, 'XXX', 'XXX', 1, 23),
	(24, 'XXX', 'XXX', 1, 24),
	(25, 'XXX', 'XXX', 1, 25),
	(26, 'XXX', 'XXX', 1, 26),
	(27, 'XXX', 'XXX', 1, 27),
	(28, 'XXX', 'XXX', 1, 28),
	(29, 'XXX', 'XXX', 1, 29),
	(30, 'PORTAFOLIO DE SERVICIOS', 'PORTAFOLIO DE SERVICIOS', 1, 30),
	(31, 'VALORES POR SERVICIOS', 'VALORES POR SERVICIOS', 1, 31),
	(32, 'CONVENIOS Y CUENTAS POR COBRAR', 'CONVENIOS Y CUENTAS POR COBRAR', 1, 32),
	(33, 'FACTURACION', 'FACTURACION', 1, 33),
	(34, 'RUBROS NOMINA', 'RUBROS NOMINA', 1, 34),
	(35, 'FICHA PERSONAL', 'FICHA PERSONAL', 1, 35),
	(36, 'CREDITOS AL PERSONAL', 'CREDITOS AL PERSONAL', 1, 36),
	(37, 'ROL DE PAGOS', 'ROL DE PAGOS', 1, 37),
	(38, 'FICHA ENTIDADES FINANCIERAS', 'FICHA ENTIDADES FINANCIERAS', 1, 38),
	(39, 'LIBRO BANCO', 'LIBRO BANCO', 1, 39),
	(40, 'FICHA PROVEEDORES', 'FICHA PROVEEDORES', 1, 40),
	(41, 'COMPRAS', 'COMPRAS', 1, 41),
	(42, 'PLAN DE CUENTAS', 'PLAN DE CUENTAS', 1, 42),
	(43, 'PARAMETROS CONTABLES', 'PARAMETROS CONTABLES', 1, 43),
	(44, 'DIARIOS CONTABLES', 'DIARIOS CONTABLES', 1, 44),
	(45, 'ANEXO TRANSACCIONAL', 'ANEXO TRANSACCIONAL', 1, 45);
/*!40000 ALTER TABLE `vsmodul` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsmovacc
CREATE TABLE IF NOT EXISTS `vsmovacc` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOVTIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOVPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOV_NO` int DEFAULT NULL,
  `DOCAPL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCNUM` int DEFAULT NULL,
  `REMARK` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BENEFI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `AUX_NO` int DEFAULT NULL,
  `SIGNOS` int DEFAULT NULL,
  `VALORS` decimal(11,2) DEFAULT NULL,
  `REVERS` int DEFAULT NULL,
  `USU_ID` int DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsmovacc: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `vsmovacc` DISABLE KEYS */;
INSERT INTO `vsmovacc` (`SEC_ID`, `FECREG`, `MOVTIP`, `MOVPTO`, `MOV_NO`, `DOCAPL`, `DOCPTO`, `DOCNUM`, `REMARK`, `BENEFI`, `CTA_NO`, `AUX_NO`, `SIGNOS`, `VALORS`, `REVERS`, `USU_ID`) VALUES
	(1, '2022-01-22', 'PC', '', 17, '', '', 0, NULL, NULL, '11121', NULL, -1, 500.00, NULL, NULL),
	(2, '2022-01-22', 'PC', '', 17, '', '', 0, NULL, NULL, '4112', NULL, 1, 500.00, NULL, NULL),
	(3, '2022-01-22', 'PC', '', 18, '', '', 0, NULL, NULL, '11121', NULL, -1, 500.00, NULL, NULL),
	(4, '2022-01-22', 'PC', '', 18, '', '', 0, NULL, NULL, '4112', NULL, 1, 500.00, NULL, NULL),
	(5, '2022-01-22', 'PC', '', 19, '', '', 0, NULL, NULL, '11121', NULL, -1, 1000.00, NULL, NULL),
	(6, '2022-01-22', 'PC', '', 19, '', '', 0, NULL, NULL, '4111', NULL, 1, 1000.00, NULL, NULL),
	(7, '2022-01-22', 'PC', '', 20, '', '', 0, NULL, NULL, '11121', NULL, -1, 500.00, NULL, NULL),
	(8, '2022-01-22', 'PC', '', 20, '', '', 0, NULL, NULL, '112221', NULL, 1, 500.00, NULL, NULL),
	(9, '2022-01-22', 'PC', '', 21, '', '', 0, NULL, NULL, '11121', NULL, -1, 500.00, NULL, NULL),
	(10, '2022-01-22', 'PC', '', 21, '', '', 0, NULL, NULL, '112221', NULL, 1, 500.00, NULL, NULL),
	(11, '2022-01-22', 'PC', '', 22, '', '', 0, 'AUTO - MONCAYO MENDOZA PABLO', NULL, '11121', NULL, -1, 400.00, NULL, NULL),
	(12, '2022-01-22', 'PC', '', 22, '', '', 0, 'AUTO - MONCAYO MENDOZA PABLO', NULL, '112221', NULL, 1, 400.00, NULL, NULL),
	(13, '2022-01-22', 'PC', '', 23, '', '', 0, 'MEDICINA - MONCAYO MENDOZA PABLO', NULL, '11121', NULL, -1, 50.00, NULL, NULL),
	(14, '2022-01-22', 'PC', '', 23, '', '', 0, 'MEDICINA - MONCAYO MENDOZA PABLO', NULL, '112221', NULL, 1, 50.00, NULL, NULL),
	(15, '2022-01-22', 'PC', '', 24, '', '', 0, 'COMPRA DE LAPTOP - MONCAYO MENDOZA PABLO', NULL, '11121', NULL, -1, 100.00, NULL, NULL),
	(16, '2022-01-22', 'PC', '', 24, '', '', 0, 'COMPRA DE LAPTOP - MONCAYO MENDOZA PABLO', NULL, '112221', NULL, 1, 100.00, NULL, NULL),
	(17, '2022-01-22', 'DP', '', 14, '', '', 0, 'DEBITO', NULL, '211211', NULL, -1, 10.00, NULL, NULL),
	(18, '2022-01-22', 'DP', '', 14, '', '', 0, 'DEBITO', NULL, '51112', NULL, 1, 10.00, NULL, NULL),
	(19, '2022-01-23', 'CB', '', 4, '', '', 0, 'CREDITO', NULL, '51112', NULL, -1, 20.00, NULL, NULL),
	(20, '2022-01-23', 'CB', '', 4, '', '', 0, 'CREDITO', NULL, '11121', NULL, 1, 20.00, NULL, NULL),
	(21, '2022-02-14', 'FA', '001001', 27, '', '', 0, NULL, NULL, '4111', NULL, -1, 100.00, NULL, NULL),
	(22, '2022-02-14', 'FA', '001001', 27, '', '', 0, NULL, NULL, '11111', NULL, 1, 100.00, NULL, NULL);
/*!40000 ALTER TABLE `vsmovacc` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsmovban
CREATE TABLE IF NOT EXISTS `vsmovban` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `MOVTIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOV_NO` int DEFAULT NULL,
  `DOCAPL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCNUM` int DEFAULT NULL,
  `BAN_NO` int DEFAULT NULL,
  `PRV_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `RUC_NO` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BENEFI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REMARK` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `GAS_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DEP_NO` int DEFAULT NULL,
  `CHE_NO` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `VALORS` decimal(11,2) DEFAULT NULL,
  `MOVSIG` int DEFAULT NULL,
  `MOVBAN` int DEFAULT NULL,
  `REVERS` int DEFAULT NULL,
  `CONCIL` int DEFAULT NULL,
  `FORPAG` int DEFAULT NULL,
  `USU_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsmovban: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `vsmovban` DISABLE KEYS */;
INSERT INTO `vsmovban` (`SEC_ID`, `MOVTIP`, `MOV_NO`, `DOCAPL`, `DOCPTO`, `DOCNUM`, `BAN_NO`, `PRV_NO`, `EMP_NO`, `RUC_NO`, `BENEFI`, `REMARK`, `CTA_NO`, `GAS_NO`, `DEP_NO`, `CHE_NO`, `FECREG`, `VALORS`, `MOVSIG`, `MOVBAN`, `REVERS`, `CONCIL`, `FORPAG`, `USU_NO`) VALUES
	(1, 'PC', 16, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 'CEL - MONCAYO MENDOZA PABLO', '', NULL, 0, 123, '2022-01-22', 200.00, -1, 1, NULL, NULL, 2, NULL),
	(2, 'PC', 17, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'PRUEBA', '4112', NULL, 0, 1261, '2022-01-22', 500.00, NULL, 1, NULL, NULL, NULL, NULL),
	(3, 'PC', 18, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'PRUEBA', '4112', NULL, 0, 1261, '2022-01-22', 500.00, NULL, 1, NULL, NULL, NULL, NULL),
	(4, 'PC', 19, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'PRUEBA', '4111', NULL, 0, 1261, '2022-01-22', 1000.00, -1, 1, NULL, NULL, NULL, NULL),
	(5, 'PC', 20, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 'CASA - MONCAYO MENDOZA PABLO', '', NULL, 0, 134, '2022-01-22', 500.00, -1, 1, NULL, NULL, 2, NULL),
	(6, 'PC', 21, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 'CASA - MONCAYO MENDOZA PABLO', '', NULL, 0, 134, '2022-01-22', 500.00, -1, 1, NULL, NULL, 2, NULL),
	(7, 'PC', 22, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 'AUTO - MONCAYO MENDOZA PABLO', '', NULL, 0, 156, '2022-01-22', 400.00, -1, 1, NULL, NULL, 2, NULL),
	(8, 'PC', 23, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, 'MEDICINA - MONCAYO MENDOZA PABLO', '', NULL, 0, 123, '2022-01-22', 50.00, -1, 1, NULL, NULL, 2, NULL),
	(9, 'PC', 24, NULL, NULL, NULL, 2, NULL, 1, NULL, 'MONCAYO MENDOZA PABLO', 'COMPRA DE LAPTOP - MONCAYO MENDOZA PABLO', '', NULL, 0, 178, '2022-01-22', 100.00, -1, 1, NULL, NULL, 2, NULL),
	(10, 'CB', 4, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'CREDITO', '51112', NULL, 0, 1261, '2022-01-23', 20.00, 1, 1, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsmovban` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsmovcxp
CREATE TABLE IF NOT EXISTS `vsmovcxp` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `MOVTIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOV_NO` int DEFAULT NULL,
  `MOVAPL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOVNUM` int DEFAULT NULL,
  `DOCAPL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCNUM` int DEFAULT NULL,
  `DOCAUT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RETPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RETNUM` int DEFAULT NULL,
  `RETAUT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BAN_NO` int DEFAULT NULL,
  `PRV_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `RUC_NO` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BENEFI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REMARK` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `GAS_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DEP_NO` int DEFAULT NULL,
  `CHE_NO` int DEFAULT NULL,
  `FECEMI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECCAD` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECAUT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECRET` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `VALORS` decimal(11,2) DEFAULT NULL,
  `VALDES` decimal(11,2) DEFAULT NULL,
  `SUSTRI` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BASIVA` decimal(11,2) DEFAULT NULL,
  `BASIV0` decimal(11,2) DEFAULT NULL,
  `BASNIV` decimal(11,2) DEFAULT NULL,
  `BASICE` decimal(11,2) DEFAULT NULL,
  `MONIVA` decimal(11,2) DEFAULT NULL,
  `CODIVA` int DEFAULT NULL,
  `CODICE` int DEFAULT NULL,
  `MONICE` decimal(11,2) DEFAULT NULL,
  `MONRF1` decimal(11,2) DEFAULT NULL,
  `MONRI1` decimal(11,2) DEFAULT NULL,
  `MONRF2` decimal(11,2) DEFAULT NULL,
  `MONRI2` decimal(11,2) DEFAULT NULL,
  `PORRF1` decimal(6,2) DEFAULT NULL,
  `PORRF2` decimal(6,2) DEFAULT NULL,
  `PORRI1` decimal(6,2) DEFAULT NULL,
  `PORRI2` decimal(6,2) DEFAULT NULL,
  `CODRF1` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CODRF2` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CODRI1` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CODRI2` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ADVANC` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOVSIG` int DEFAULT NULL,
  `MOVBAN` int DEFAULT NULL,
  `MOVPRV` int DEFAULT NULL,
  `REVERS` int DEFAULT NULL,
  `LOGFIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsmovcxp: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `vsmovcxp` DISABLE KEYS */;
INSERT INTO `vsmovcxp` (`SEC_ID`, `MOVTIP`, `MOV_NO`, `MOVAPL`, `MOVNUM`, `DOCAPL`, `DOCPTO`, `DOCNUM`, `DOCAUT`, `RETPTO`, `RETNUM`, `RETAUT`, `BAN_NO`, `PRV_NO`, `EMP_NO`, `RUC_NO`, `BENEFI`, `REMARK`, `CTA_NO`, `GAS_NO`, `DEP_NO`, `CHE_NO`, `FECEMI`, `FECREG`, `FECCAD`, `FECAUT`, `FECRET`, `VALORS`, `VALDES`, `SUSTRI`, `BASIVA`, `BASIV0`, `BASNIV`, `BASICE`, `MONIVA`, `CODIVA`, `CODICE`, `MONICE`, `MONRF1`, `MONRI1`, `MONRF2`, `MONRI2`, `PORRF1`, `PORRF2`, `PORRI1`, `PORRI2`, `CODRF1`, `CODRF2`, `CODRI1`, `CODRI2`, `ADVANC`, `MOVSIG`, `MOVBAN`, `MOVPRV`, `REVERS`, `LOGFIL`) VALUES
	(1, 'PF', 1, 'PF', 1, '01', '001001', 1, '1234567890', '001001', 1, '29122021071791787641001200100111234567810', NULL, 1, NULL, NULL, NULL, 'PRUEBA', '211211', '5111', NULL, NULL, '2021-12-29', '2021-12-29', NULL, NULL, NULL, 106.65, 0.00, '01', 100.00, 0.00, 0.00, NULL, 12.00, NULL, NULL, NULL, 1.75, 3.60, 0.00, 0.00, 1.75, 0.00, 30.00, 0.00, '332', '', '030', '', NULL, 1, NULL, 1, NULL, 'Xml/17H02852/1791787641001001001000000001.xml'),
	(2, 'PC', 1, 'PF', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2, 1, NULL, NULL, 'PATRICIO MONCAYO', 'ABONO', '211211', NULL, NULL, 1258, NULL, '2021-12-29', NULL, NULL, NULL, 30.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', -1, 1, 1, NULL, ''),
	(3, 'CP', 1, 'PF', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'PRUEBA', NULL, '4111', NULL, NULL, NULL, '2021-12-29', NULL, NULL, NULL, 20.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, NULL, 1, NULL, ''),
	(4, 'PD', 1, 'PF', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2, 1, NULL, NULL, 'PATRICIO MONCAYO', 'ABONO', '211211', NULL, NULL, 1259, NULL, '2021-12-31', NULL, NULL, NULL, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', -1, 1, 1, NULL, ''),
	(5, 'PC', 2, 'PF', 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2, 1, NULL, NULL, 'PATRICIO MONCAYO', 'PRUEBA', '112221', NULL, NULL, 1260, NULL, '2022-01-03', NULL, NULL, NULL, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', -1, 1, 1, NULL, ''),
	(6, 'DP', 6, 'DP', 6, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'DEBITO PROVEEDOR', NULL, '51112', NULL, NULL, NULL, '2022-01-17', NULL, NULL, NULL, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(7, 'DP', 7, 'DP', 7, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'DEBITO', NULL, '51112', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 5.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(8, 'DP', 8, 'DP', 8, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'DEBIT', NULL, '51112', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 2.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(9, 'DP', 9, 'DP', 9, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'AAA', NULL, '5111', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 46.65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(10, 'DP', 10, 'DP', 10, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'WWW', NULL, '51112', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 300.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(11, 'DP', 11, 'DP', 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '500', NULL, '51112', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(12, 'DP', 12, 'DP', 12, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '1', NULL, '51112', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 1.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(13, 'DP', 13, 'DP', 13, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '4', NULL, '51112', NULL, NULL, NULL, '2022-01-18', NULL, NULL, NULL, 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL),
	(14, 'DP', 14, 'DP', 14, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, 'DEBITO', NULL, '51112', NULL, NULL, NULL, '2022-01-22', NULL, NULL, NULL, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `vsmovcxp` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsnewstd
CREATE TABLE IF NOT EXISTS `vsnewstd` (
  `STD_NO` int NOT NULL AUTO_INCREMENT,
  `LAS_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FIR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ADDRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `TPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `IDTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `IDE_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `STDGEN` int DEFAULT NULL,
  `FECBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `STDMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `TT_WHO` int DEFAULT NULL,
  `FATLAS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATNAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATCED` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATJOB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FATMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTLAS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTNAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTCED` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTJOB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `MOTMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPLAS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPNAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `RETYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPCED` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPJOB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REPMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `LASSCH` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `PERIOS` int NOT NULL,
  `RECEIV` int DEFAULT NULL,
  PRIMARY KEY (`STD_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsnewstd: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsnewstd` DISABLE KEYS */;
INSERT INTO `vsnewstd` (`STD_NO`, `LAS_NM`, `FIR_NM`, `ADDRES`, `TPHONE`, `IDTYPE`, `IDE_NO`, `STDGEN`, `FECBIR`, `STDMAI`, `TT_WHO`, `FATLAS`, `FATNAM`, `FATADR`, `FATFON`, `FATYPE`, `FATCED`, `FATJOB`, `FATBIR`, `FATMAI`, `MOTLAS`, `MOTNAM`, `MOTADR`, `MOTYPE`, `MOTCED`, `MOTFON`, `MOTJOB`, `MOTBIR`, `MOTMAI`, `REPLAS`, `REPNAM`, `REPADR`, `REPFON`, `RETYPE`, `REPCED`, `REPJOB`, `REPBIR`, `REPMAI`, `LASSCH`, `REMARK`, `SEC_NO`, `PERIOS`, `RECEIV`) VALUES
	(1, 'MENDOZA', 'PACO', 'a', '1', '05', '1757216930', 1, '2021-11-14', '', 2, 'OCAMPO SARAGURO', 'GALO ISAIAS', 'a', '1', '05', '1711242436', 'COMANDANCIA GENERAL DEL EJERCITO', '', '', 'LUCERO ALBAN', 'PATRICIA DEL CONSUELO', 'a', '05', '1713478772', '1', '', '', '', 'LUCERO ALBAN', 'PATRICIA DEL CONSUELO', 'a', '1', '05', '1713478772', '', '', 'patmoncayo@hotmail.com', 'LA MISMA', NULL, 1, 2021, 1);
/*!40000 ALTER TABLE `vsnewstd` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsnotify
CREATE TABLE IF NOT EXISTS `vsnotify` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `HORREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `MAT_NO` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `SCHEDU` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`),
  KEY `noti_sec` (`SEC_NO`),
  KEY `noti_mat` (`MAT_NO`),
  KEY `noti_std` (`STD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsnotify: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsnotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `vsnotify` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vspermisos
CREATE TABLE IF NOT EXISTS `vspermisos` (
  `idpermiso` int NOT NULL AUTO_INCREMENT,
  `rolid` int NOT NULL,
  `moduloid` int NOT NULL,
  `r` int NOT NULL,
  `w` int NOT NULL,
  `u` int NOT NULL,
  `d` int NOT NULL,
  PRIMARY KEY (`idpermiso`),
  KEY `perm_rol` (`rolid`),
  KEY `perm_modulo` (`moduloid`)
) ENGINE=InnoDB AUTO_INCREMENT=2344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla vsschool.vspermisos: ~353 rows (aproximadamente)
/*!40000 ALTER TABLE `vspermisos` DISABLE KEYS */;
INSERT INTO `vspermisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
	(703, 8, 1, 1, 0, 0, 0),
	(704, 8, 2, 1, 0, 0, 0),
	(705, 8, 3, 0, 0, 0, 0),
	(706, 8, 4, 0, 0, 0, 0),
	(707, 8, 5, 0, 0, 0, 0),
	(708, 8, 6, 1, 0, 0, 0),
	(709, 8, 7, 0, 0, 0, 0),
	(710, 8, 8, 0, 0, 0, 0),
	(711, 8, 9, 0, 0, 0, 0),
	(712, 8, 10, 0, 0, 0, 0),
	(713, 8, 11, 0, 0, 0, 0),
	(714, 8, 12, 0, 0, 0, 0),
	(715, 8, 13, 0, 0, 0, 0),
	(716, 8, 14, 0, 0, 0, 0),
	(717, 8, 15, 0, 0, 0, 0),
	(718, 8, 16, 0, 0, 0, 0),
	(719, 8, 17, 0, 0, 0, 0),
	(720, 8, 18, 0, 0, 0, 0),
	(721, 8, 19, 0, 0, 0, 0),
	(798, 6, 1, 0, 0, 0, 0),
	(799, 6, 2, 0, 0, 0, 0),
	(800, 6, 3, 1, 0, 0, 0),
	(801, 6, 4, 1, 1, 1, 0),
	(802, 6, 5, 1, 1, 1, 0),
	(803, 6, 6, 0, 0, 0, 0),
	(804, 6, 7, 0, 0, 0, 0),
	(805, 6, 8, 1, 0, 0, 0),
	(806, 6, 9, 0, 0, 0, 0),
	(807, 6, 10, 0, 0, 0, 0),
	(808, 6, 11, 0, 0, 0, 0),
	(809, 6, 12, 0, 0, 0, 0),
	(810, 6, 13, 0, 0, 0, 0),
	(811, 6, 14, 0, 0, 0, 0),
	(812, 6, 15, 0, 0, 0, 0),
	(813, 6, 16, 0, 0, 0, 0),
	(814, 6, 17, 0, 0, 0, 0),
	(815, 6, 18, 0, 0, 0, 0),
	(816, 6, 19, 0, 0, 0, 0),
	(1894, 7, 1, 1, 0, 0, 0),
	(1895, 7, 2, 0, 0, 0, 0),
	(1896, 7, 3, 0, 0, 0, 0),
	(1897, 7, 4, 0, 0, 0, 0),
	(1898, 7, 5, 0, 0, 0, 0),
	(1899, 7, 6, 1, 0, 0, 0),
	(1900, 7, 7, 1, 0, 0, 0),
	(1901, 7, 8, 1, 0, 0, 0),
	(1902, 7, 9, 1, 0, 0, 0),
	(1903, 7, 10, 0, 0, 0, 0),
	(1904, 7, 11, 0, 0, 0, 0),
	(1905, 7, 12, 0, 0, 0, 0),
	(1906, 7, 13, 1, 0, 1, 0),
	(1907, 7, 14, 0, 0, 0, 0),
	(1908, 7, 15, 0, 0, 0, 0),
	(1909, 7, 16, 0, 0, 0, 0),
	(1910, 7, 17, 0, 0, 0, 0),
	(1911, 7, 18, 0, 0, 0, 0),
	(1912, 7, 19, 0, 0, 0, 0),
	(1913, 7, 20, 0, 0, 0, 0),
	(1914, 7, 21, 0, 0, 0, 0),
	(1915, 7, 22, 0, 0, 0, 0),
	(1916, 7, 23, 0, 0, 0, 0),
	(1917, 7, 24, 0, 0, 0, 0),
	(1918, 7, 25, 0, 0, 0, 0),
	(1919, 7, 26, 0, 0, 0, 0),
	(1920, 7, 27, 0, 0, 0, 0),
	(1921, 7, 28, 0, 0, 0, 0),
	(1922, 7, 29, 0, 0, 0, 0),
	(1923, 7, 30, 0, 0, 0, 0),
	(1924, 7, 31, 0, 0, 0, 0),
	(1925, 7, 32, 0, 0, 0, 0),
	(1926, 7, 33, 0, 0, 0, 0),
	(1927, 7, 34, 0, 0, 0, 0),
	(1928, 7, 35, 0, 0, 0, 0),
	(1929, 7, 36, 0, 0, 0, 0),
	(1930, 7, 37, 0, 0, 0, 0),
	(1931, 7, 38, 0, 0, 0, 0),
	(1932, 7, 39, 0, 0, 0, 0),
	(1933, 7, 40, 0, 0, 0, 0),
	(1934, 7, 41, 0, 0, 0, 0),
	(1935, 7, 42, 0, 0, 0, 0),
	(1936, 7, 43, 0, 0, 0, 0),
	(1937, 7, 44, 0, 0, 0, 0),
	(1938, 7, 45, 0, 0, 0, 0),
	(1984, 2, 1, 1, 0, 0, 0),
	(1985, 2, 2, 1, 0, 0, 0),
	(1986, 2, 3, 0, 0, 0, 0),
	(1987, 2, 4, 0, 0, 0, 0),
	(1988, 2, 5, 1, 0, 0, 0),
	(1989, 2, 6, 1, 0, 0, 0),
	(1990, 2, 7, 1, 0, 0, 0),
	(1991, 2, 8, 1, 0, 0, 0),
	(1992, 2, 9, 1, 0, 0, 0),
	(1993, 2, 10, 0, 0, 0, 0),
	(1994, 2, 11, 0, 0, 0, 0),
	(1995, 2, 12, 1, 0, 0, 0),
	(1996, 2, 13, 0, 0, 0, 0),
	(1997, 2, 14, 1, 0, 0, 0),
	(1998, 2, 15, 1, 0, 0, 0),
	(1999, 2, 16, 0, 0, 0, 0),
	(2000, 2, 17, 0, 0, 0, 0),
	(2001, 2, 18, 0, 0, 0, 0),
	(2002, 2, 19, 0, 0, 0, 0),
	(2003, 2, 20, 1, 0, 0, 0),
	(2004, 2, 21, 0, 0, 0, 0),
	(2005, 2, 22, 0, 0, 0, 0),
	(2006, 2, 23, 0, 0, 0, 0),
	(2007, 2, 24, 0, 0, 0, 0),
	(2008, 2, 25, 0, 0, 0, 0),
	(2009, 2, 26, 0, 0, 0, 0),
	(2010, 2, 27, 0, 0, 0, 0),
	(2011, 2, 28, 0, 0, 0, 0),
	(2012, 2, 29, 0, 0, 0, 0),
	(2013, 2, 30, 0, 0, 0, 0),
	(2014, 2, 31, 0, 0, 0, 0),
	(2015, 2, 32, 0, 0, 0, 0),
	(2016, 2, 33, 0, 0, 0, 0),
	(2017, 2, 34, 0, 0, 0, 0),
	(2018, 2, 35, 0, 0, 0, 0),
	(2019, 2, 36, 0, 0, 0, 0),
	(2020, 2, 37, 0, 0, 0, 0),
	(2021, 2, 38, 0, 0, 0, 0),
	(2022, 2, 39, 0, 0, 0, 0),
	(2023, 2, 40, 0, 0, 0, 0),
	(2024, 2, 41, 0, 0, 0, 0),
	(2025, 2, 42, 0, 0, 0, 0),
	(2026, 2, 43, 0, 0, 0, 0),
	(2027, 2, 44, 0, 0, 0, 0),
	(2028, 2, 45, 0, 0, 0, 0),
	(2074, 3, 1, 1, 0, 0, 0),
	(2075, 3, 2, 1, 0, 0, 0),
	(2076, 3, 3, 1, 0, 0, 0),
	(2077, 3, 4, 1, 0, 0, 0),
	(2078, 3, 5, 1, 0, 0, 0),
	(2079, 3, 6, 1, 0, 0, 0),
	(2080, 3, 7, 1, 0, 0, 0),
	(2081, 3, 8, 1, 1, 1, 1),
	(2082, 3, 9, 1, 0, 0, 0),
	(2083, 3, 10, 1, 0, 0, 0),
	(2084, 3, 11, 1, 0, 0, 0),
	(2085, 3, 12, 1, 0, 0, 0),
	(2086, 3, 13, 0, 0, 0, 0),
	(2087, 3, 14, 0, 0, 0, 0),
	(2088, 3, 15, 0, 0, 0, 0),
	(2089, 3, 16, 0, 0, 0, 0),
	(2090, 3, 17, 1, 0, 0, 0),
	(2091, 3, 18, 1, 0, 0, 0),
	(2092, 3, 19, 0, 0, 0, 0),
	(2093, 3, 20, 1, 0, 0, 0),
	(2094, 3, 21, 0, 0, 0, 0),
	(2095, 3, 22, 0, 0, 0, 0),
	(2096, 3, 23, 0, 0, 0, 0),
	(2097, 3, 24, 0, 0, 0, 0),
	(2098, 3, 25, 0, 0, 0, 0),
	(2099, 3, 26, 0, 0, 0, 0),
	(2100, 3, 27, 0, 0, 0, 0),
	(2101, 3, 28, 0, 0, 0, 0),
	(2102, 3, 29, 0, 0, 0, 0),
	(2103, 3, 30, 0, 0, 0, 0),
	(2104, 3, 31, 0, 0, 0, 0),
	(2105, 3, 32, 0, 0, 0, 0),
	(2106, 3, 33, 0, 0, 0, 0),
	(2107, 3, 34, 0, 0, 0, 0),
	(2108, 3, 35, 0, 0, 0, 0),
	(2109, 3, 36, 0, 0, 0, 0),
	(2110, 3, 37, 0, 0, 0, 0),
	(2111, 3, 38, 0, 0, 0, 0),
	(2112, 3, 39, 0, 0, 0, 0),
	(2113, 3, 40, 0, 0, 0, 0),
	(2114, 3, 41, 0, 0, 0, 0),
	(2115, 3, 42, 0, 0, 0, 0),
	(2116, 3, 43, 0, 0, 0, 0),
	(2117, 3, 44, 0, 0, 0, 0),
	(2118, 3, 45, 0, 0, 0, 0),
	(2164, 9, 1, 1, 0, 0, 0),
	(2165, 9, 2, 1, 1, 1, 0),
	(2166, 9, 3, 0, 0, 0, 0),
	(2167, 9, 4, 0, 0, 0, 0),
	(2168, 9, 5, 0, 0, 0, 0),
	(2169, 9, 6, 0, 0, 0, 0),
	(2170, 9, 7, 0, 0, 0, 0),
	(2171, 9, 8, 0, 0, 0, 0),
	(2172, 9, 9, 0, 0, 0, 0),
	(2173, 9, 10, 0, 0, 0, 0),
	(2174, 9, 11, 0, 0, 0, 0),
	(2175, 9, 12, 0, 0, 0, 0),
	(2176, 9, 13, 0, 0, 0, 0),
	(2177, 9, 14, 0, 0, 0, 0),
	(2178, 9, 15, 0, 0, 0, 0),
	(2179, 9, 16, 0, 0, 0, 0),
	(2180, 9, 17, 0, 0, 0, 0),
	(2181, 9, 18, 0, 0, 0, 0),
	(2182, 9, 19, 0, 0, 0, 0),
	(2183, 9, 20, 0, 0, 0, 0),
	(2184, 9, 21, 0, 0, 0, 0),
	(2185, 9, 22, 0, 0, 0, 0),
	(2186, 9, 23, 0, 0, 0, 0),
	(2187, 9, 24, 0, 0, 0, 0),
	(2188, 9, 25, 0, 0, 0, 0),
	(2189, 9, 26, 0, 0, 0, 0),
	(2190, 9, 27, 0, 0, 0, 0),
	(2191, 9, 28, 0, 0, 0, 0),
	(2192, 9, 29, 0, 0, 0, 0),
	(2193, 9, 30, 1, 1, 1, 0),
	(2194, 9, 31, 1, 1, 1, 0),
	(2195, 9, 32, 1, 1, 1, 0),
	(2196, 9, 33, 1, 1, 1, 0),
	(2197, 9, 34, 0, 0, 0, 0),
	(2198, 9, 35, 0, 0, 0, 0),
	(2199, 9, 36, 0, 0, 0, 0),
	(2200, 9, 37, 0, 0, 0, 0),
	(2201, 9, 38, 0, 0, 0, 0),
	(2202, 9, 39, 0, 0, 0, 0),
	(2203, 9, 40, 0, 0, 0, 0),
	(2204, 9, 41, 0, 0, 0, 0),
	(2205, 9, 42, 0, 0, 0, 0),
	(2206, 9, 43, 0, 0, 0, 0),
	(2207, 9, 44, 0, 0, 0, 0),
	(2208, 9, 45, 0, 0, 0, 0),
	(2209, 5, 1, 1, 0, 0, 0),
	(2210, 5, 2, 0, 0, 0, 0),
	(2211, 5, 3, 0, 0, 0, 0),
	(2212, 5, 4, 0, 0, 0, 0),
	(2213, 5, 5, 1, 0, 1, 0),
	(2214, 5, 6, 1, 0, 1, 0),
	(2215, 5, 7, 1, 1, 1, 0),
	(2216, 5, 8, 1, 1, 1, 0),
	(2217, 5, 9, 0, 0, 0, 0),
	(2218, 5, 10, 0, 0, 0, 0),
	(2219, 5, 11, 1, 0, 0, 0),
	(2220, 5, 12, 1, 0, 0, 0),
	(2221, 5, 13, 1, 1, 1, 1),
	(2222, 5, 14, 0, 0, 0, 0),
	(2223, 5, 15, 0, 0, 0, 0),
	(2224, 5, 16, 0, 0, 0, 0),
	(2225, 5, 17, 0, 0, 0, 0),
	(2226, 5, 18, 0, 0, 0, 0),
	(2227, 5, 19, 0, 0, 0, 0),
	(2228, 5, 20, 0, 0, 0, 0),
	(2229, 5, 21, 0, 0, 0, 0),
	(2230, 5, 22, 0, 0, 0, 0),
	(2231, 5, 23, 0, 0, 0, 0),
	(2232, 5, 24, 0, 0, 0, 0),
	(2233, 5, 25, 0, 0, 0, 0),
	(2234, 5, 26, 0, 0, 0, 0),
	(2235, 5, 27, 0, 0, 0, 0),
	(2236, 5, 28, 0, 0, 0, 0),
	(2237, 5, 29, 0, 0, 0, 0),
	(2238, 5, 30, 0, 0, 0, 0),
	(2239, 5, 31, 0, 0, 0, 0),
	(2240, 5, 32, 0, 0, 0, 0),
	(2241, 5, 33, 0, 0, 0, 0),
	(2242, 5, 34, 0, 0, 0, 0),
	(2243, 5, 35, 0, 0, 0, 0),
	(2244, 5, 36, 0, 0, 0, 0),
	(2245, 5, 37, 0, 0, 0, 0),
	(2246, 5, 38, 0, 0, 0, 0),
	(2247, 5, 39, 0, 0, 0, 0),
	(2248, 5, 40, 0, 0, 0, 0),
	(2249, 5, 41, 0, 0, 0, 0),
	(2250, 5, 42, 0, 0, 0, 0),
	(2251, 5, 43, 0, 0, 0, 0),
	(2252, 5, 44, 0, 0, 0, 0),
	(2253, 5, 45, 0, 0, 0, 0),
	(2254, 1, 1, 1, 1, 1, 1),
	(2255, 1, 2, 1, 1, 1, 1),
	(2256, 1, 3, 1, 1, 1, 1),
	(2257, 1, 4, 1, 1, 1, 1),
	(2258, 1, 5, 1, 1, 1, 1),
	(2259, 1, 6, 1, 1, 1, 1),
	(2260, 1, 7, 1, 1, 1, 1),
	(2261, 1, 8, 1, 1, 1, 1),
	(2262, 1, 9, 1, 1, 1, 1),
	(2263, 1, 10, 1, 1, 1, 1),
	(2264, 1, 11, 1, 1, 1, 1),
	(2265, 1, 12, 1, 1, 1, 1),
	(2266, 1, 13, 1, 1, 1, 1),
	(2267, 1, 14, 1, 1, 1, 1),
	(2268, 1, 15, 1, 1, 1, 1),
	(2269, 1, 16, 1, 1, 1, 1),
	(2270, 1, 17, 1, 1, 1, 1),
	(2271, 1, 18, 1, 1, 1, 1),
	(2272, 1, 19, 1, 1, 1, 1),
	(2273, 1, 20, 1, 1, 1, 1),
	(2274, 1, 21, 1, 1, 1, 1),
	(2275, 1, 22, 1, 1, 1, 1),
	(2276, 1, 23, 1, 1, 1, 1),
	(2277, 1, 24, 1, 1, 1, 1),
	(2278, 1, 25, 1, 1, 1, 1),
	(2279, 1, 26, 1, 1, 1, 1),
	(2280, 1, 27, 1, 1, 1, 1),
	(2281, 1, 28, 1, 1, 1, 1),
	(2282, 1, 29, 1, 1, 1, 1),
	(2283, 1, 30, 1, 1, 1, 1),
	(2284, 1, 31, 1, 1, 1, 1),
	(2285, 1, 32, 1, 1, 1, 1),
	(2286, 1, 33, 1, 1, 1, 1),
	(2287, 1, 34, 1, 1, 1, 1),
	(2288, 1, 35, 0, 0, 0, 0),
	(2289, 1, 36, 1, 1, 1, 1),
	(2290, 1, 37, 1, 1, 1, 1),
	(2291, 1, 38, 1, 1, 1, 1),
	(2292, 1, 39, 1, 1, 1, 1),
	(2293, 1, 40, 1, 1, 1, 1),
	(2294, 1, 41, 1, 1, 1, 1),
	(2295, 1, 42, 1, 1, 1, 1),
	(2296, 1, 43, 1, 1, 1, 1),
	(2297, 1, 44, 1, 1, 1, 1),
	(2298, 1, 45, 1, 1, 1, 1),
	(2299, 4, 1, 1, 0, 0, 0),
	(2300, 4, 2, 1, 1, 1, 1),
	(2301, 4, 3, 1, 1, 1, 1),
	(2302, 4, 4, 1, 1, 1, 1),
	(2303, 4, 5, 1, 1, 1, 1),
	(2304, 4, 6, 1, 1, 1, 1),
	(2305, 4, 7, 1, 1, 1, 0),
	(2306, 4, 8, 1, 1, 1, 0),
	(2307, 4, 9, 1, 0, 0, 0),
	(2308, 4, 10, 1, 0, 0, 0),
	(2309, 4, 11, 1, 0, 0, 0),
	(2310, 4, 12, 1, 0, 0, 0),
	(2311, 4, 13, 0, 0, 0, 0),
	(2312, 4, 14, 0, 0, 0, 0),
	(2313, 4, 15, 0, 0, 0, 0),
	(2314, 4, 16, 0, 0, 0, 0),
	(2315, 4, 17, 0, 0, 0, 0),
	(2316, 4, 18, 0, 0, 0, 0),
	(2317, 4, 19, 0, 0, 0, 0),
	(2318, 4, 20, 0, 0, 0, 0),
	(2319, 4, 21, 0, 0, 0, 0),
	(2320, 4, 22, 0, 0, 0, 0),
	(2321, 4, 23, 0, 0, 0, 0),
	(2322, 4, 24, 0, 0, 0, 0),
	(2323, 4, 25, 0, 0, 0, 0),
	(2324, 4, 26, 0, 0, 0, 0),
	(2325, 4, 27, 0, 0, 0, 0),
	(2326, 4, 28, 0, 0, 0, 0),
	(2327, 4, 29, 0, 0, 0, 0),
	(2328, 4, 30, 0, 0, 0, 0),
	(2329, 4, 31, 0, 0, 0, 0),
	(2330, 4, 32, 0, 0, 0, 0),
	(2331, 4, 33, 0, 0, 0, 0),
	(2332, 4, 34, 0, 0, 0, 0),
	(2333, 4, 35, 0, 0, 0, 0),
	(2334, 4, 36, 0, 0, 0, 0),
	(2335, 4, 37, 0, 0, 0, 0),
	(2336, 4, 38, 0, 0, 0, 0),
	(2337, 4, 39, 0, 0, 0, 0),
	(2338, 4, 40, 0, 0, 0, 0),
	(2339, 4, 41, 0, 0, 0, 0),
	(2340, 4, 42, 0, 0, 0, 0),
	(2341, 4, 43, 0, 0, 0, 0),
	(2342, 4, 44, 0, 0, 0, 0),
	(2343, 4, 45, 0, 0, 0, 0);
/*!40000 ALTER TABLE `vspermisos` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsproduc
CREATE TABLE IF NOT EXISTS `vsproduc` (
  `ART_NO` int unsigned NOT NULL AUTO_INCREMENT,
  `ART_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ESTADO` int DEFAULT NULL,
  `TIP_NO` int DEFAULT NULL,
  `DESIVA` int DEFAULT NULL,
  `PROPAY` int DEFAULT NULL,
  `PER000` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER001` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER002` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER003` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER004` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER005` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER006` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER007` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER008` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER009` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER010` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER011` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER012` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PER013` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `BAR_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`ART_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsproduc: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `vsproduc` DISABLE KEYS */;
INSERT INTO `vsproduc` (`ART_NO`, `ART_NM`, `ESTADO`, `TIP_NO`, `DESIVA`, `PROPAY`, `PER000`, `PER001`, `PER002`, `PER003`, `PER004`, `PER005`, `PER006`, `PER007`, `PER008`, `PER009`, `PER010`, `PER011`, `PER012`, `PER013`, `BAR_NO`, `CTA_NO`) VALUES
	(1, 'MATRICULA', 1, 2, 2, 2, 'off', 'on', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', NULL, '4111'),
	(2, 'PENSION', 1, 2, 2, 2, 'off', 'off', 'off', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'off', NULL, '4112');
/*!40000 ALTER TABLE `vsproduc` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsprovid
CREATE TABLE IF NOT EXISTS `vsprovid` (
  `PRV_NO` int NOT NULL AUTO_INCREMENT,
  `LAS_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FIR_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ADDRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IDTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IDE_NO` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EMAILS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BENEFI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `AUT_NO` int DEFAULT NULL,
  `FECAUT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ANT_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CTA_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `GAS_NO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  PRIMARY KEY (`PRV_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsprovid: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vsprovid` DISABLE KEYS */;
INSERT INTO `vsprovid` (`PRV_NO`, `LAS_NM`, `FIR_NM`, `ADDRES`, `TPHONE`, `IDTYPE`, `IDE_NO`, `EMAILS`, `BENEFI`, `AUT_NO`, `FECAUT`, `ANT_NO`, `CTA_NO`, `GAS_NO`, `ESTATU`) VALUES
	(1, 'MONCAYO MENDOZA', 'OSCAR PATRICIO', 'A', '1', '01', '0909319907001', 'patmoncayo@hotmail.com', 'PATRICIO MONCAYO', 0, '', '112221', '211211', '', 1);
/*!40000 ALTER TABLE `vsprovid` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsrolpay
CREATE TABLE IF NOT EXISTS `vsrolpay` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `EMP_NO` int DEFAULT NULL,
  `RUB_NO` int DEFAULT NULL,
  `CAT_NO` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `PERIOS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `QUINCE` int DEFAULT NULL,
  `CHE_NO` int DEFAULT NULL,
  `DAYLAB` int DEFAULT NULL,
  `DAYFAL` int DEFAULT NULL,
  `HORLAB` decimal(6,2) DEFAULT NULL,
  `HORFAL` decimal(6,2) DEFAULT NULL,
  `HOR025` decimal(6,2) DEFAULT NULL,
  `HOR050` decimal(6,2) DEFAULT NULL,
  `HOR100` decimal(6,2) DEFAULT NULL,
  `INCOME` decimal(11,2) DEFAULT NULL,
  `EGRESS` decimal(11,2) DEFAULT NULL,
  `MODIFI` int DEFAULT NULL,
  `LOCKED` int DEFAULT NULL,
  `SUC_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsrolpay: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `vsrolpay` DISABLE KEYS */;
INSERT INTO `vsrolpay` (`SEC_ID`, `EMP_NO`, `RUB_NO`, `CAT_NO`, `FECREG`, `PERIOS`, `QUINCE`, `CHE_NO`, `DAYLAB`, `DAYFAL`, `HORLAB`, `HORFAL`, `HOR025`, `HOR050`, `HOR100`, `INCOME`, `EGRESS`, `MODIFI`, `LOCKED`, `SUC_NO`) VALUES
	(1, 1, 4, 1, '2022-01-22', '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 83.33, NULL, NULL, NULL),
	(2, 1, 1, 1, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1500.00, 0.00, NULL, NULL, NULL),
	(3, 1, 2, 1, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 151.20, NULL, NULL, NULL),
	(4, 1, 3, 1, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL),
	(5, 1, 5, 1, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 0.00, NULL, NULL, NULL),
	(6, 1, 4, 1, '2022-01-22', '202102', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 33.33, NULL, NULL, NULL),
	(7, 1, 4, 1, '2022-01-22', '202103', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 33.33, NULL, NULL, NULL),
	(8, 2, 4, 2, '2022-01-23', '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 250.00, NULL, NULL, NULL),
	(9, 2, 4, 2, '2022-01-23', '202102', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 250.00, NULL, NULL, NULL),
	(10, 2, 1, 2, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000.00, 0.00, NULL, NULL, NULL),
	(11, 2, 2, 2, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 189.00, NULL, NULL, NULL),
	(12, 2, 3, 2, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL),
	(13, 2, 5, 2, NULL, '202101', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsrolpay` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsrolrub
CREATE TABLE IF NOT EXISTS `vsrolrub` (
  `RUB_NO` int NOT NULL AUTO_INCREMENT,
  `RUB_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RUBTIP` int DEFAULT NULL,
  `ENCERA` int DEFAULT NULL,
  `HIDENS` int DEFAULT NULL,
  `RUBCRE` int DEFAULT NULL,
  `APORTE` int DEFAULT NULL,
  `FORMUL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `ESTATU` int DEFAULT NULL,
  PRIMARY KEY (`RUB_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsrolrub: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `vsrolrub` DISABLE KEYS */;
INSERT INTO `vsrolrub` (`RUB_NO`, `RUB_NM`, `RUBTIP`, `ENCERA`, `HIDENS`, `RUBCRE`, `APORTE`, `FORMUL`, `ESTATU`) VALUES
	(1, 'SUELDO', 1, 1, 2, 2, 1, 'Sueldo', 1),
	(2, 'APORTE IESS', 2, 1, 2, 2, 2, 'Aporte', 1),
	(3, 'PRESTAMO', 2, 1, 2, 1, 2, '', 1),
	(4, 'ANTICIPO', 2, 1, 2, 1, 2, '', 1),
	(5, 'HORAS EXTRAS', 1, 1, 2, 2, 1, '', 1);
/*!40000 ALTER TABLE `vsrolrub` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsrolusr
CREATE TABLE IF NOT EXISTS `vsrolusr` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `rol_description` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `rol_status` int NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci COMMENT='Roles de Usuario';

-- Volcando datos para la tabla vsschool.vsrolusr: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `vsrolusr` DISABLE KEYS */;
INSERT INTO `vsrolusr` (`rol_id`, `rol_name`, `rol_description`, `rol_status`) VALUES
	(1, 'System Manager', 'Administrador de todos los modulos', 1),
	(2, 'Gerente - Rector', 'Gerente - Rector', 1),
	(3, 'Coordinador', 'Coordinador Academico', 1),
	(4, 'Secretaria', 'Secretaria Academica', 1),
	(5, 'Docente', 'Docente', 1),
	(6, 'Inspector', 'Inspector', 1),
	(7, 'Estudiante', 'Estudiante de la Institucion', 1),
	(8, 'Representante', 'Representante del Estudiante', 1),
	(9, 'Cajero', 'CAJERO FACTURACION', 1);
/*!40000 ALTER TABLE `vsrolusr` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vssecmat
CREATE TABLE IF NOT EXISTS `vssecmat` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `SEC_NO` int DEFAULT NULL,
  `MAT_NO` int DEFAULT NULL,
  `EMP_NO` int DEFAULT NULL,
  `PERIOS` int DEFAULT NULL,
  `CLINKS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `ORDERS` int DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`),
  KEY `ind_matter` (`MAT_NO`),
  KEY `ind_emplox` (`EMP_NO`),
  KEY `ind_section` (`SEC_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vssecmat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vssecmat` DISABLE KEYS */;
INSERT INTO `vssecmat` (`SEC_ID`, `SEC_NO`, `MAT_NO`, `EMP_NO`, `PERIOS`, `CLINKS`, `ORDERS`) VALUES
	(4, 1, 1, 1, 2021, '', 1);
/*!40000 ALTER TABLE `vssecmat` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vssecuen
CREATE TABLE IF NOT EXISTS `vssecuen` (
  `SEC_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `MOVTIP` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PTO_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOV_NO` int DEFAULT NULL,
  `PAR_NO` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vssecuen: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `vssecuen` DISABLE KEYS */;
INSERT INTO `vssecuen` (`SEC_ID`, `MOVTIP`, `PTO_NO`, `MOV_NO`, `PAR_NO`) VALUES
	(1, 'PF', NULL, 1, 0.00),
	(2, 'PC', NULL, 24, 0.00),
	(3, 'CP', NULL, 2, 0.00),
	(5, 'TR', NULL, 2, 0.00),
	(12, 'RF', '001001', 1, 0.00),
	(13, 'CB', NULL, 4, 0.00),
	(14, 'DE', NULL, 4, 0.00),
	(15, 'PD', NULL, 1, 0.00),
	(16, 'FA', '001001', 27, 0.00),
	(17, 'NC', '001001', 17, 0.00),
	(18, 'DP', NULL, 14, 0.00),
	(19, 'CE', '', 29, 0.00),
	(20, 'AI', '', 0, 9.45),
	(21, 'AP', '', 0, 12.15),
	(22, 'IV', '', 0, 12.00),
	(23, 'FR', '', 0, 8.33);
/*!40000 ALTER TABLE `vssecuen` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vssecval
CREATE TABLE IF NOT EXISTS `vssecval` (
  `SEC_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `ART_NO` int DEFAULT NULL,
  `VALORS` decimal(11,2) DEFAULT NULL,
  `PORDES` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vssecval: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `vssecval` DISABLE KEYS */;
INSERT INTO `vssecval` (`SEC_ID`, `PERIOS`, `SEC_NO`, `ART_NO`, `VALORS`, `PORDES`) VALUES
	(1, 2021, 3, 1, 100.00, 0.0000),
	(2, 2021, 41, 1, 50.00, 0.0000),
	(3, 2021, 55, 1, 35.00, 0.0000),
	(4, 2021, 2, 1, 110.00, 0.0000),
	(5, 2021, 1, 1, 100.00, 0.0000),
	(6, 2021, 21, 1, 44.00, 0.0000),
	(7, 2021, 5, 1, 23.00, 0.0000),
	(8, 2021, 59, 1, 22.00, 0.0000),
	(9, 2021, 13, 1, 100.00, 0.0000),
	(10, 2021, 13, 2, 200.00, 0.0000),
	(11, 2021, 1, 2, 80.00, 0.0000),
	(12, 2022, 2, 1, 120.00, 0.0000),
	(13, 2022, 2, 2, 90.00, 0.0000),
	(14, 2021, 2, 2, 0.00, NULL);
/*!40000 ALTER TABLE `vssecval` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vsstdhis
CREATE TABLE IF NOT EXISTS `vsstdhis` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `MATNUM` int DEFAULT NULL,
  `FOLNUM` int DEFAULT NULL,
  `FECMAT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `FECREG` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RETAIN` decimal(11,2) DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  `SUC_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vsstdhis: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `vsstdhis` DISABLE KEYS */;
INSERT INTO `vsstdhis` (`SEC_ID`, `PERIOS`, `STD_NO`, `MATNUM`, `FOLNUM`, `FECMAT`, `SEC_NO`, `FECREG`, `RETAIN`, `ESTATU`, `SUC_NO`) VALUES
	(1, 2020, 14, 1, 1, NULL, NULL, '2021-03-08', 10.00, NULL, NULL),
	(2, 2020, 29, 1, 1, NULL, NULL, '2021-03-14', 10.00, NULL, NULL),
	(3, 2021, 2040, 4, 4, '', 13, NULL, NULL, NULL, NULL),
	(4, 2021, 1, 8, 8, '', 1, NULL, NULL, 2, NULL),
	(5, 2021, 2, 9, 9, '', 1, NULL, NULL, 2, NULL),
	(6, 2021, 7, 10, 10, '', 2, '2021-12-27', 90.50, 2, NULL),
	(7, 2022, 1, 8, 8, '', 2, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vsstdhis` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vstabhea
CREATE TABLE IF NOT EXISTS `vstabhea` (
  `TAB_NO` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `TAB_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`TAB_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vstabhea: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `vstabhea` DISABLE KEYS */;
INSERT INTO `vstabhea` (`TAB_NO`, `TAB_NM`) VALUES
	('AI', 'Aporte Individual'),
	('AP', 'Aporte Patronal'),
	('APR', 'Escalas Aprovechamiento'),
	('BAN', 'Entidades Financieras Externas'),
	('CAT', 'Grupos Nomina '),
	('CB', 'Nota de Credito Bancario'),
	('CD', 'Comprobante de Diario'),
	('CE', 'Credito Personal'),
	('CP', 'Nota de Credito Proveedor'),
	('DB', 'Nota de Debito Bancario'),
	('DE', 'Deposito Bancario'),
	('DIS', 'Escalas Comportamiento'),
	('DP', 'Nota de Debito Proveedor'),
	('FA', 'Factura Cliente'),
	('FR', 'Fondo de Reserva'),
	('INS', 'Insumos Academicos'),
	('IV', 'Impuesto al Valor agregado'),
	('MON', 'Periodos de Facturacion'),
	('NC', 'Nota de Credito Cliente'),
	('PAR', 'Parciales Academicos'),
	('PC', 'Pago en Cheque'),
	('PD', 'Pago en Debito Bancario'),
	('PE', 'Pago en Efectivo'),
	('PF', 'Provision de Factura'),
	('RF', 'Retencion a la Fuente'),
	('RI', 'Retencion al IVA'),
	('TAR', 'Tarjetas de Credito'),
	('TR', 'Transferencia Bancaria');
/*!40000 ALTER TABLE `vstabhea` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vstables
CREATE TABLE IF NOT EXISTS `vstables` (
  `SEC_ID` int NOT NULL AUTO_INCREMENT,
  `TAB_NO` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SUB_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SUB_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  `VALORS` decimal(6,2) DEFAULT NULL,
  `VALOR2` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vstables: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `vstables` DISABLE KEYS */;
INSERT INTO `vstables` (`SEC_ID`, `TAB_NO`, `SUB_NO`, `SUB_NM`, `ESTATU`, `VALORS`, `VALOR2`) VALUES
	(1, 'INS', 'I1', 'PORTAFOLIO PADRE - 1Punto', 1, 1.00, NULL),
	(2, 'INS', 'I2', 'PRESENTACION DOCENTE - 2Puntos', 1, 2.00, 2.00),
	(3, 'INS', 'I3', 'CONTENIDO DOCENTE - 5Puntos', 1, 5.00, 5.00),
	(4, 'INS', 'I4', 'ENTREGA DOCENTE - 2Puntos', 1, 2.00, 2.00),
	(7, 'MON', '000', 'INSCRIPCION', 1, 0.00, NULL),
	(8, 'MON', '001', 'MATRICULA', 1, 1.00, 1.00),
	(9, 'MON', '002', 'ABR', 0, 2.00, 0.00),
	(10, 'MON', '003', 'MAY', 1, 0.00, 0.00),
	(11, 'MON', '004', 'JUN', 1, 0.00, 0.00),
	(12, 'BAN', '17', 'BANCO DE GUAYAQUIL S.A.', 1, 0.00, 0.00),
	(13, 'TAR', '001', 'DINERS CLUB', 1, 1.00, 0.00),
	(14, 'PAR', 'Q1P1', '1. QUIMESTRE - 1. PARCIAL', 1, 0.00, 0.00),
	(15, 'MON', '005', 'JUL', 1, 0.00, 0.00),
	(16, 'MON', '006', 'AGO', 1, 0.00, 0.00),
	(17, 'MON', '007', 'SEP', 1, 0.00, 0.00),
	(18, 'MON', '008', 'OCT', 1, 0.00, 0.00),
	(19, 'MON', '009', 'NOV', 1, 0.00, 0.00),
	(20, 'MON', '010', 'DIC', 1, 0.00, 0.00),
	(21, 'MON', '011', 'ENE', 1, 0.00, 0.00),
	(22, 'MON', '012', 'FEB', 1, 0.00, 0.00),
	(23, 'MON', '013', 'MARZO', 0, 0.00, 0.00),
	(24, 'PAR', 'Q1P2', '1. QUIMESTRE - 2. PARCIAL', 1, 0.00, 0.00),
	(25, 'RF', '332', 'OTRAS COMPRAS DE BIENES Y SERVICIOS', 1, 1.75, 0.00),
	(26, 'RI', '030', 'RETENCION IVA BIENES', 1, 30.00, 30.00),
	(27, 'RI', '070', 'RETENCION IVA SERVICIOS', 1, 70.00, 70.00),
	(28, 'TAR', '002', 'VISA', 1, 0.00, 0.00),
	(29, 'PAR', 'Q2P1', '2. QUIMESTRE - 1. PARCIAL', 1, 0.00, 0.00),
	(30, 'PAR', 'Q2P2', '2. QUIMESTRE - 2. PARCIAL', 1, 0.00, 0.00),
	(31, 'CAT', '1', 'ADMINISTRATIVO', 1, 0.00, 0.00),
	(32, 'CAT', '2', 'DOCENTE', 1, 0.00, 0.00),
	(33, 'BAN', '10', 'BANCO PICHINCHA C.A.', 1, 0.00, 0.00),
	(34, 'BAN', '30', 'BANCO DEL PACIFICO', 1, 0.00, 0.00),
	(35, 'APR', 'AAR', 'ALCANZA LOS APRENDIZAJES REQUERIDOS', 1, 7.00, 8.99),
	(36, 'APR', 'DAR', 'DOMINA LOS APRENDIZAJES REQUERIDOS', 1, 9.00, 10.00),
	(37, 'APR', 'PAAR', 'PROXIMO A ALCANZAR LOS APRENDIZAJES REQUERIDOS', 1, 4.01, 6.99),
	(38, 'APR', 'NAAR', 'NO ALCANZA LOS APRENDIZAJES REQUERIDOS', 1, 0.00, 4.00),
	(39, 'DIS', '1', 'No cumple con los compromisos establecidos para la sana convivencia social.', 1, 1.00, 1.00),
	(40, 'DIS', '2', 'Falla reiteradamente en el cumplimiento de los compromisos establecidos para la sana convivencia soc', 1, 2.00, 2.00),
	(41, 'DIS', '3', 'Falla ocasionalmente en el cumplimiento de los compromisos establecidos para la sana convivencia soc', 1, 3.00, 3.00),
	(42, 'DIS', '4', 'Cumple con los compromisos establecidos para la sana convivencia social.', 1, 4.00, 4.00),
	(43, 'DIS', '5', 'Lidera el cumplimiento de los compromisos establecidos para la sana convivencia social.', 1, 5.00, 5.00),
	(44, 'INS', 'I9', 'SUPLETORIO', 1, 10.00, 10.00),
	(45, 'PAR', 'SUPL', 'SUPLETORIO', 1, 0.00, 0.00),
	(46, 'PAR', 'Q1P4', '1. QUIMESTRE - EXAMEN', 1, 0.00, 0.00),
	(47, 'PAR', 'Q2P4', '2. QUIMESTRE - EXAMEN', 1, 0.00, 0.00),
	(48, 'RF', '312', 'TRANSFERENCIA DE BIENES MUEBLES DE NATURALEZA CORPORAL', 1, 1.75, 1.75),
	(49, 'RF', '332G', 'PAGOS CON TARJETA DE CREDITO', 1, 0.00, 0.00),
	(50, 'RF', '332I', 'PAGOS A TRAVES DE CONVENIO DE DEBITO', 1, 0.00, 0.00),
	(51, 'RF', '3440', 'OTRAS RETENCIONES APLICABLES AL 2%', 1, 2.75, 2.75),
	(52, 'RF', '346', 'OTRAS RETENCIONES APLICABLES A OTROS PORCENTAJES', 1, 1.75, 1.75),
	(53, 'RI', '100', 'RETENCION IVA HONORARIOS', 1, 100.00, 100.00),
	(54, 'TAR', '003', 'AMERICAN EXPRESS', 1, 0.00, 0.00);
/*!40000 ALTER TABLE `vstables` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vstariff
CREATE TABLE IF NOT EXISTS `vstariff` (
  `SEC_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PERIOS` int DEFAULT NULL,
  `STD_NO` int DEFAULT NULL,
  `PER_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ART_NO` int DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCVAL` decimal(11,2) DEFAULT NULL,
  `FACVAL` decimal(11,2) DEFAULT NULL,
  `ABOVAL` decimal(11,2) DEFAULT NULL,
  `DOCTIP` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCPTO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCNUM` int DEFAULT NULL,
  `PTOAPL` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DOCAPL` int DEFAULT NULL,
  `DOCSIG` int DEFAULT NULL,
  `FECEMI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vstariff: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `vstariff` DISABLE KEYS */;
INSERT INTO `vstariff` (`SEC_ID`, `PERIOS`, `STD_NO`, `PER_NO`, `ART_NO`, `REMARK`, `DOCVAL`, `FACVAL`, `ABOVAL`, `DOCTIP`, `DOCPTO`, `DOCNUM`, `PTOAPL`, `DOCAPL`, `DOCSIG`, `FECEMI`, `ESTATU`) VALUES
	(1, 2021, 1, '001', 1, '', 100.00, 100.00, 100.00, 'FA', '001001', 27, NULL, NULL, 1, '2022-02-14', NULL),
	(2, 2021, 1, '003', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(3, 2021, 1, '004', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(4, 2021, 1, '005', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(5, 2021, 1, '006', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(6, 2021, 1, '007', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(7, 2021, 1, '008', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(8, 2021, 1, '009', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(9, 2021, 1, '010', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(10, 2021, 1, '011', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL),
	(11, 2021, 1, '012', 2, '', 80.00, 80.00, 0.00, '', '', 0, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `vstariff` ENABLE KEYS */;

-- Volcando estructura para tabla vsschool.vstudent
CREATE TABLE IF NOT EXISTS `vstudent` (
  `STD_NO` int NOT NULL AUTO_INCREMENT,
  `LAS_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FIR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ADDRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IDTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IDE_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `STDGEN` int DEFAULT NULL,
  `FECBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `STDMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TT_WHO` int DEFAULT NULL,
  `FATLAS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATNAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATCED` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATJOB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FATMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTLAS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTNAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTCED` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTJOB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MOTMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPLAS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPNAM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RETYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPCED` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPJOB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPBIR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REPMAI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PERSON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PERADR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PERFON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FACWHO` int DEFAULT NULL,
  `RAZONS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TLF_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CLTYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `RUC_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EMAILS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESTATU` int DEFAULT NULL,
  `LASSCH` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PERIOS` int DEFAULT NULL,
  `SEC_NO` int DEFAULT NULL,
  `MATNUM` int DEFAULT NULL,
  `FOLNUM` int DEFAULT NULL,
  `FECMAT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`STD_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla vsschool.vstudent: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vstudent` DISABLE KEYS */;
INSERT INTO `vstudent` (`STD_NO`, `LAS_NM`, `FIR_NM`, `ADDRES`, `TPHONE`, `IDTYPE`, `IDE_NO`, `STDGEN`, `FECBIR`, `STDMAI`, `TT_WHO`, `FATLAS`, `FATNAM`, `FATADR`, `FATFON`, `FATYPE`, `FATCED`, `FATJOB`, `FATBIR`, `FATMAI`, `MOTLAS`, `MOTNAM`, `MOTADR`, `MOTYPE`, `MOTCED`, `MOTFON`, `MOTJOB`, `MOTBIR`, `MOTMAI`, `REPLAS`, `REPNAM`, `REPADR`, `REPFON`, `RETYPE`, `REPCED`, `REPJOB`, `REPBIR`, `REPMAI`, `PERSON`, `PERADR`, `PERFON`, `FACWHO`, `RAZONS`, `DIRECC`, `TLF_NO`, `CLTYPE`, `RUC_NO`, `EMAILS`, `ESTATU`, `LASSCH`, `REMARK`, `PERIOS`, `SEC_NO`, `MATNUM`, `FOLNUM`, `FECMAT`) VALUES
	(1, 'MONCAYO CHICA', 'PATRICIO ANTONIO', 'A', '1', '05', '0923808802', 1, '', 'paymoncayo@hotmail.com', 1, 'MONCAYO', 'PATRICIO', '', '', '05', '0909319907', '', '', 'patmoncayo@hotmail.com', 'CHICA', 'TONA', '', '05', '0800971608', '', '', '', '', 'MONCAYO', 'PATRICIO', '', '', '05', '0909319907', '', '', 'patmoncayo@hotmail.com', '', '', '', 1, 'MONCAYO PATRICIO', '', '', '05', '0909319907', 'patmoncayo@hotmail.com', 2, '', '', 2021, 1, 8, 8, ''),
	(2, 'MONCAYO CHICA', 'ASTRID', 'A', '1', '05', '0923808794', 2, '', 'sergiomatius@gmail.com', 2, '', '', '', '', '05', '', '', '', '', '', '', '', '05', '', '', '', '', '', 'CHICA AVEIGA', 'TONA', '', '', '05', '0800971608', '', '', 'patypsdayanara@hotmail.com', '', '', '', 2, '', '', '', '05', '', '', 2, '', '', 2021, 1, 9, 9, ''),
	(7, 'MENDOZA', 'PACO', 'a', '1', '05', '1757216930', 1, '2021-11-14', 'paymoncayo@hotmail.com', 2, 'OCAMPO SARAGURO', 'GALO ISAIAS', 'a', '1', '05', '1711242436', 'COMANDANCIA GENERAL DEL EJERCITO', '', '', 'LUCERO ALBAN', 'PATRICIA DEL CONSUELO', 'a', '05', '1713478772', '1', '', '', '', 'LUCERO ALBAN', 'PATRICIA DEL CONSUELO', 'a', '1', '05', '1713478772', 'HOSPITAL ANDRADE MARIN', '', 'maricris_vallejo805@yahoo.com', '', '', '', 2, 'LUCERO ALBAN PATRICIA DEL CONSUELO', 'a', '1', '05', '1713478772', '', 2, 'LA MISMA', '', 2021, 2, 10, 10, '');
/*!40000 ALTER TABLE `vstudent` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
