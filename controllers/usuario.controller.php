<?php

require_once '../models/Usuarios.php';

if (isset($_POST['operacion'])){

  $usuario = new Usuario();


  //Identificando la operacion ...

  if ($_POST['operacion'] == 'login'){

    $registro = $usuario->iniciarSesion($_POST['nombreusuario']);
    echo json_encode($registro);
  }





}