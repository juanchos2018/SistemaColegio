
<main>
  <div class="app-title">
      <div>
        <h1><i class="fas fa-user-edit"></i>  <?= $data['page_title'] ?></h1>
      </div>
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        <li class="breadcrumb-item"><a href="<?= base_url(); ?>Vstudent">Retornar</a></li>
      </ul>
  </div>
 
        	<?php 
        		if(empty($data['maestro_detalle']))
       			{
        	?>
        				<p class="text-primary">Datos no Encontrados! ...</p>
        	<?php
              }else{
                $stdxmat = $data['maestro_detalle'];
                $empresa = $data['empresa'];

//                dep($stdxmat);
                $periodo = $data['perios'];
                $seccion = $stdxmat[0]['SEC_NM'];
                $paralelo = $stdxmat[0]['PARALE'];
        	?>

          <!-----------  Inicio Diseño de Impresion Listado de Matriculados  ---------->
          <div id="vsstdlis" class="invoice">
              <!-- Imprime la cabecera del Reporte de Matrculados -->
              <?php 
                   
                  $fila = 1;
              
                  //Imprime estudiantes por Seccion y Paralelo
                  $num_reg = count($stdxmat) - 1;

                  for($f=0; $f < count($stdxmat); $f++)
                  {
              ?>
                    <div class="row mb-0 text-center">
                      <div class="col-6">
                        <h2 class="page-header"><img src="<?= media(); ?>images/escudo.png" style="width: 47%"></h2>
                      </div>
                      <div class="col-6 mt-3">
                        <h2 class="page-header"><img src="<?= media(); ?>images/jmola.png" style="width: 15%"></h2>
                      </div>
                    </div>

                    <div class="row text-center">
                      <div class="col-md-12"><h6>DISTRITO EDUCATIVO: 0000</h6></div><br> 
                      <div class="col-md-12"><h4><strong><?= $empresa['RAZONS']?></strong></h4></div>
                      <div class="col-md-12"><h6>AÑO LECTIVO: <?= $periodo ?> - <?= $periodo + 1?></h6></div><br> 
                      <div class="col-md-12"><h5><strong>Listado de Matriculados por Grado/Curso</strong></h5></div>           
                    </div>

                    <div class="row">
                      <div class="col-md-12">
                        <table id="LSTMatriculados" style="border: 1px black solid;" class="table table-striped table-bordered" cellspacing="0" width="80%">
                            <col style="width: 4%;"  />
                            <col style="width: 35%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 12%;" />

                            <!-- Cabecera de la Tabla ..... -->
                            <thead >
                              <tr><th colspan="6"><?= $seccion ?> - <?= $paralelo ?></th></tr>
                              <tr>
                                <th>No.</th>
                                <th>Apelldos y Nombres</th>
                                <th>Matricula</th>
                                <th>Folio</th>
                                <th class="text-center">Fecha</th>
                                <th>Observación</th>
                              </tr>          
                            </thead>
                            <tbody>
              <?php
                    while (true) 
                    {
              ?>
                                <tr>
                                  <td><?= $fila; ?></td>
                                  <td><?= $stdxmat[$f]['LAS_NM'].' '. $stdxmat[$f]['FIR_NM']; ?></td>
                                  <td><?= $stdxmat[$f]['MATNUM']; ?></td>
                                  <td><?= $stdxmat[$f]['FOLNUM']; ?></td>
                                  <td class="text-center"><?= $stdxmat[$f]['FECMAT']; ?></td>
                                  <td></td>
                                </tr>
              <?php 
                      if($f < $num_reg)
                      {
                        if($seccion == $stdxmat[$f+1]['SEC_NM'] AND $paralelo == $stdxmat[$f+1]['PARALE'])
                        { 
                          $fila++;
                          $f = $f + 1;
                        }else{
                          $fila = 1;
                          
                          $seccion = $stdxmat[$f+1]['SEC_NM'];
                          $paralelo = $stdxmat[$f+1]['PARALE'];
                          break;
                        }
                      }else{
                        break;
                      }
                    }
              ?>
              <!-- Imprime el final de la tabla -->
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <br><br><br><br>

                    <div class="row text-center mt-4 pt-4">
                      <div class="col-6">
                        <p class="mb-0"><?= $empresa['RECTORIA']?></p>
                        <strong>Rector(a)</strong>
                      </div>
                      <div class="col-6">
                        <p class="mb-0"><?= $empresa['SECRETARIO']?></p>
                        <strong>Secretaria General</strong>
                      </div>
                    </div>

                    <div class="row mt-4 pt-4">
                      <div class="col-6 text-center">
                          <address>
                                    <small><strong>Dirección: </strong><?= $empresa['ADDRES'] ?></small><br>
                                    <small><strong>Email: </strong><?= $empresa['EMAILS'] ?></small><br>
                                    <small><strong>Teléfono(s): </strong><?= $empresa['TPHONE'] ?></small>
                          </address>  
                      </div>
                      <div class="col-6 text-center">
                        <img src="<?= media(); ?>images/gobierno.png" style="width: 57%">
                      </div>
                    </div>
              
              <!-- Break de página -->
                    <p style="page-break-after: always;"></p>

              <?php
                  }  
              ?>
                     
            <div class="row d-print-none mt-2">
                <div class="col-12 text-right">
                  <a class="btn btn-primary" onclick="printDiv('vsstdlis')"><i class="fa fa-print"></i> Imprimir</a>
                </div>
            </div>
          </div>
      	 <?php  } ?>
</main>
