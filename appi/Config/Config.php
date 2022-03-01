<?php
	
	
	// Declaracion de Constantes
	const BASE_URL = "http://localhost/appi/";
	//const BASE_URL = "http://appi.juanchosserver.shop/";

	//Zona Horaria
	date_default_timezone_set('America/Guayaquil');
	
	// Parametros de Conexion a Base de Datos MariaDB
	define("DB_USER","dbuser");
	define("DB_PASSWORD","_MysqlUser123");
	define("DB_NAME","vsschool");
	define("DB_HOST","localhost");
	define("DB_CHARSET","charset=utf8");

	// Delimitadores decimal y millar
	const SPD = ".";
	const SPM = ","; 

	//Simbolo de Moneda
	const SMONEY = '$';

	//Datos envio de correo 
	const NOMBRE_REMITENTE = "APPI";
	const EMAIL_REMITENTE = "";

	const NOMBRE_EMPRESA = "APPI";
	const WEB_EMPRESA = "www.appi-ec.com";
