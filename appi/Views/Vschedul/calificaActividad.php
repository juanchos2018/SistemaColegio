<?php
	headerAdmin($data);
?>

<main class="app-content">
<div class="app-title">
<div>
  <h1><i class="fas fa-user-edit"></i>  <?= $data['page_title'] ?></h1>
</div>
<ul class="app-breadcrumb breadcrumb">
  <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
  <li class="breadcrumb-item"><a href="<?= base_url(); ?>Vschedul">Retornar</a></li>
</ul>
</div>
<div class="row">
<div class="col-md-12">
  <div class="tile">
  	<?php 
  		//dep($data['maestro_detalle']); 
  		if(empty($data['maestro_detalle']))
  			{
  	?>
  				<p class="text-primary">Datos no Encontrados! ..</p>
  	<?php 	}else{ 
  				$empresa = $data['maestro_detalle']['empresa'];
  				$actividad = $data['maestro_detalle']['actividad'];
  				$alumnos = $data['maestro_detalle']['alumnos'];

          $opcion = substr($actividad['PARCIA'],0,4);
          switch($opcion){
              case 'Q1P1':
                    $actividad['PARCIA'] = '1º Quimestre - 1º Parcial';
                    break;
              case 'Q1P2':
                    $actividad['PARCIA'] = '1º Quimestre - 2º Parcial';
                    break;
              case 'Q1P3':
                    $actividad['PARCIA'] = '1º Quimestre - 3º Parcial';
                    break;
              case 'Q1P4':
                    $actividad['PARCIA'] = '1º Quimestre - Exámen';
                    break;
              case 'Q2P1':
                    $actividad['PARCIA'] = '2º Quimestre - 1º Parcial';
                    break;
              case 'Q2P2':
                    $actividad['PARCIA'] = '2º Quimestre - 2º Parcial';
                    break;
              case 'Q2P3':
                    $actividad['PARCIA'] = '2º Quimestre - 3º Parcial';
                    break;
              case 'Q2P4':
                    $actividad['PARCIA'] = '2º Quimestre - Exámen';
                    break;
          }
  	?>
    <section id="calificaActividad" class="invoice">
      <div class="row mb-4">
        <div class="col-6">
          <h2 class="page-header"><img src="<?= media(); ?>images/uploads/logo-uens.svg" style="width: 85%"></h2>
        </div>
        <div class="col-6">
          <h5 class="text-right text-primary">Fecha inicio de Actividad: <?= $actividad['FECREG'] ?></h5>
        </div>
      </div>
      <div class="row invoice-info">
        <div class="col-4">
          <address>
	          <!-- <strong><?= $empresa['RAZONS'] ?></strong><br> -->
	          <strong>Dirección: </strong><?= $empresa['ADDRES'] ?><br>
	          <strong>Email: </strong><?= $empresa['EMAILS'] ?></small><br>
	          <strong>Teléfono(s): </strong><?= $empresa['TPHONE'] ?></small><br>
      	  </address>
        </div>
        <div class="col-4">
          <address>
          	  <strong>Docente: </strong><?= $actividad['LAS_NM'].' '.$actividad['FIR_NM']; ?><br>
              <strong>Sección: </strong><?= $actividad['SEC_NM']; ?><br>
              <strong>Paralelo: </strong><?= $actividad['PARALE']; ?><br>
          </address>
        </div>
        <div class="col-4">
          <address>
              <strong>Asignatura: </strong><?= $actividad['MAT_NM']; ?><br>
              <strong>Periodo: </strong><?= $actividad['PARCIA']; ?><br>
              <!--<strong>Insumo: </strong><?= $actividad['INSUMO']; ?><br>-->
          </address>
        </div>
        
      </div>

    <div class="row">
        <div class="col-12 table-responsive">
          <table class="table table-striped table-bordered">
            <thead>
              <tr>
                <!-- <th>ID</th> -->
                <th>Apellidos</th>
                <th>Nombres</th>
                <th>Actividad</th>
                <th>Puntaje</th>
              </tr>
            </thead>
            <tbody>
            	<?php 
            		if(count($alumnos) > 0)
            		{
            			foreach($alumnos as $estudiante)
            			{
            	?>
              <tr>
                <!-- <td><?= $estudiante['STD_NO'] ?></td> -->
                <td><?= $estudiante['LAS_NM'] ?></td>
                <td><?= $estudiante['FIR_NM'] ?></td>
                <td><?= $estudiante['SCHEDU'] ?></td>
                <td><?= $estudiante['PUNTAJ'] ?></td>
              </tr>
               <?php 
               			}
               		}
               ?>
            </tbody>
          </table>
        </div>
    </div>

    <!-- Espacio para Firmas: Docente y Secretaria General -->
    <div class="row mt-4 pt-4">
      <div class="col-6 text-center">
        <address>
              <strong><?= $actividad['LAS_NM'].' '.$actividad['FIR_NM']; ?></strong><br>
        </address>
      </div>

      <div class="col-6 text-center">
        <address>
              <strong>Secretaria General</strong><br>
        </address>
      </div>
    </div>
    <!-- ------------------------------------------------- -->

    <div class="row d-print-none mt-2">
        <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print('#calificaActividad');"><i class="fa fa-print"></i> Imprimir</a></div>
    </div>
    </section>
	<?php   } ?>
  </div>
</div>
</div>
</main>

<?php footerAdmin($data); ?>