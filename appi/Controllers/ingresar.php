<?php 


$arrResponse = array('status' => true, 'msg' => 'OK','p'=>'login');
$data['txtUsuario'] = $_POST['txtUsuario'];
$data['txtClave'] = $_POST['txtClave'];
$data['responseText'] = $arrResponse;
$data['status'] = 200;

echo json_encode($data,JSON_UNESCAPED_UNICODE);


?>