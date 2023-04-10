<?php

session_start();

require_once '../models/Usuarios.php';

if (isset($_POST['operacion'])){

  $usuario = new Usuario();


  //Identificando la operacion ...

  if ($_POST['operacion'] == 'login'){

    $registro = $usuario->iniciarSesion($_POST['nombreusuario']);
    
    $_SESSION["login"] = false;

    //objeto para contener resultado
    $resultado =[
      "status" => false,
      "mensaje" => ""
    ];


    if($registro){
      //El usuario si existe
      
      
      $claveEncriptada= $registro["claveacceso"];

      if (password_verify($_POST['claveIngresada'], $claveEncriptada)){
        $resultado["status"]=true;
        $resultado["mensaje"]= "Bienvenido al sistema";
        $_SESSION["login"] = true;
      }else{
        $resultado["mensaje"]= "Error en la contraseña";
      }

    }else{  
      //El usurio no existe
      $resultado["mensaje"]= "No encontramos el ususario";

    }

    echo json_encode($resultado);
  }




  if($_POST['operacion'] == 'listar'){

    $datosObtenidos = $usuario ->listarUsuarios();

    if($datosObtenidos){
      $nfilas =1;
      foreach($datosObtenidos as $usuario){

        echo"
        <tr>
        <td>{$nfilas}</td>
        <td>{$usuario['nombres']}</td>
        <td>{$usuario['apellidos']}</td>
        <td>{$usuario['nombreusuario']}</td>
        <td>{$usuario['nivelacceso']}</td>
        <td>{$usuario['fecharegistro']}</td>
        </tr>
        ";
        $nfilas++;
      }
    }
  }






}

if(isset($_GET['operacion'])){

  if($_GET['operacion'] == 'finalizar'){
    session_destroy();
    session_unset();
    header('Location:../index.php');

  }


}
