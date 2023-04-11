
<!doctype html>
<html lang="en">

<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>

<body>
<div class="container mt-3">
    <div class="card">
      <div class="card-header bg-primary text-light">
        <div class="row">
          <div class="col-md-6">
            <strong>LISTA DE USUARIOS</strong>
          </div>
          <div class="col-md-6 text-end">
            <button class="btn btn-success btn-sm" id="abrir-modal" data-bs-toggle="modal" data-bs-target="#modal-registro-usuario">
              <i class="bi bi-plus-circle-fill"></i> Agregar Usuarios
            </button>
          </div>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-sm table-striped" id="tabla-usuarios">
          <colgroup>
            <col width = "5%">
            <col width = "15%">
            <col width = "15%">
            <col width = "15%">
            <col width = "15%">
            <col width = "15%">
            <col width = "10%">
          </colgroup>
          <thead>
            <tr>
              <th>#</th>
              <th>Nombres Usuarios</th>
              <th>Apellidos</th>
              <th>Nombres</th>
              <th>Nivel acceso</th>
              <th>fecha registro</th>
              <th>Operaciones</th>
            </tr>
          </thead>
          <tbody>
  
          </tbody>
        </table>
      </div>
      <div class="card-footer text-end">

        <!-- <a href="../controllers/usuario.controller.php?operacion=finalizar">Cerrar sesion</a>        -->

      </div>
    </div>
  </div> 
  <!--formualrio-->
  <div class="modal fade" id="modal-registro-usuario" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="modal-titulo">Registro de usuario</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" >

          <form action="" id="formulario-usuario">
            <div class="mb-3">
              <label for="nombreusuario" class="form-label">Nombre usuario</label>
              <input type="text" class="form-control form-control-sm" id="nombreusuario">
            </div>
            <div class="mb-3">
              <label for="claveacceso" class="form-label">Ingrese clave</label>
              <input type="text" class="form-control form-control-sm" id="claveacceso">
            </div>
            <div class="mb-3">
              <label for="nombres" class="form-label">Nombres</label>
              <input type="text" class="form-control form-control-sm" id="nombres">
            </div>
            <div class="mb-3">
              <label for="apellidos" class="form-label">Apellidos </label>
              <input type="text" class="form-control form-control-sm" id="apellidos">
            </div>
            <div class="mb-3">
              <label for="nivelacceso" class="form-label">Nivel de acceso</label>
              <select id="nivelacceso" class="form-select form-select-sm">
                <option value="">Seleccione</option>
                <option value="A">Administrador</option>
                <option value="I">Invitado</option>
              </select>
            </div>
          </form>

        </div>
        <div class="modal-footer">
          <button type="button" class=" btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary btn-sm" id="guardar-usuario">Guardar</button>
        </div>
      </div>
    </div>
  </div>



  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

  <script>
    $(document).ready(function(){

      let datosNuevos = true;
      let idusuarioactualizar= -1;

      function mostrarUsuarios(){
        $.ajax({
          url: '../controllers/usuario.controller.php',
          type: 'POST',
          data: {operacion: 'listar'},
          dataType: 'text',
          success:function(result){
            $("#tabla-usuarios tbody").html(result);

          }
        });
      }



      function registrarUsuario(){
        //pendiente validadar
        if (confirm("¿Está seguro de salvar los datos?")){

          //crear objeto conteniendo los datos a guardar

          let datos ={
            operacion     : 'registrar',
            idusuario     : idusuarioactualizar,
            nombreusuario : $("#nombreusuario").val(),
            claveacceso   : $("#claveacceso").val(),
            apellidos     : $("#apellidos").val(),
            nombres       : $("#nombres").val(),
            nivelacceso   : $("#nivelacceso").val()

          };



          $.ajax({
            url: '../controllers/usuario.controller.php',
            type: 'POST',
            data: datos,
            success: function(result){
              if (result == ""){
                // reiniciar el formulario
                $("#formulario-usuario")[0].reset();

                //actualizar la tabla
                mostrarUsuarios();
                //cerrar el modal

                $("#modal-registro-usuario").modal('hide');
              }
            }
          });
        }
      }


      function abrirModal(){
        datosNuevos = true; //variable de tipo bandera
        $("#modal-titulo").html("Registro de Usuarios")
        $("#formulario-usuario")[0].reset();
      }
      $("#guardar-usuario").click(registrarUsuario);
      $("#abrir-modal").click(abrirModal);
      

      $("#tabla-cursos tbody").on("click", ".eliminar", function (){
        const idusuarioEliminar =$(this).data("idusuario");
        if (confirm("Estas seguro de proceder? ")){ 
          $.ajax({

            url: '../controllers/usuario.controller.php',
            type: 'POST',
            data: {
              operacion     :'eliminar',
              idusuario     : idcursoEliminar
            },
            success: function(result){
              if (result == ""){
                mostrarUsuarios();
              }
            }
            
          });
         }
      });


      mostrarUsuarios();
    });
  </script>

</body>

</html>