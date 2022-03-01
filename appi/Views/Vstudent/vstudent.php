
<?php 
  headerAdmin($data); 
  getModal('modalVstudent',$data);
?>


<style>
  .table thead, .table tfoot {
    background-color: #455a64;
    color:azure;
  }
</style>

<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
          <?php if($_SESSION['permisosMod']['w']){ ?>
              <button class="btn btn-primary btnNewVstudent" type="button" onclick="openModalStd();"><i class="fas fa-plus-circle"></i> Agregar Estudiante</button>
          <?php } ?>
          <button class="btn btn-warning btnNewVstudent" type="button" onclick="openModalLst();"><i class="fas fa-plus-circle"></i> Informe Estudiantes</button>
          </h1>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <div class="tile-body">
              <div class="table-responsive">
               <table class="table table-striped table-bordered display nowrap" id="TableVstudent" cellspacing="0" width= 100%>
                  <thead>
                    <tr>
                      <th class="text-center">Acciones: </th>
                      <th>Apellidos: </th>
                      <th>Nombres: </th>
                      <th>Año: </th> 
                      <th>Estatus: </th> 
                      <th>Secci&oacuten: </th>
                      <th>Paralelo: </th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th></th>
                      <th></th>
                      <th></th>
                      <th></th>
                      <th></th>
                      <th></th>
                      <th></th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
</main>

<?php footerAdmin($data); ?>