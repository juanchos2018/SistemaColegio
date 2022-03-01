<main>
    <div class="app-title">
        <div>
            <h1><i class="fas fa-user-edit"></i>  <?= $data['page_title'] ?></h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<?= base_url(); ?>Vsactsav">Retornar</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
        
    <?php 
       		if(empty($data['maestro_detalle']))
    		{
    ?>
    			<p class="text-primary">Datos no Encontrados! ...</p>
    <?php
            }else{
       			$empresa  = $data['maestro_detalle']['empresa'];
       			$acta     = $data['maestro_detalle']['acta'];
                $insumos  = $data['maestro_detalle']['insumos'];
                $parcial  = $data['maestro_detalle']['parcial'];

                if(count($acta) > 0)
                {
                    $jornada = $acta[0]['JOR_NO'];
                    switch($jornada)
                    {
                        case 1:
                            $jornada = 'MATUTINA';
                            break;
                        case 2:
                            $jornada = 'VESPERTINA';
                            break;
                        case 3:
                            $jornada = 'NOCTURNA';
                            break;
                    }
                }
                
                switch(substr($parcial,0,4))
                {
                    case 'Q1P1':
                        $parcial = '1º Quimestre - 1º Parcial';
                        $Pun001 = 'Q1P1I1';
                        $Pun002 = 'Q1P1I2';
                        $Pun003 = 'Q1P1I3';
                        $Pun004 = 'Q1P1I4';
                        $Pun005 = 'Q1P1I5';
                        $Pun006 = 'Q1P1PR';
                        $mparci = true;
                        break;
                    case 'Q1P2':
                        $parcial = '1º Quimestre - 2º Parcial';
                        $Pun001 = 'Q1P2I1';
                        $Pun002 = 'Q1P2I2';
                        $Pun003 = 'Q1P2I3';
                        $Pun004 = 'Q1P2I4';
                        $Pun005 = 'Q1P2I5';
                        $Pun006 = 'Q1P2PR';
                        $mparci = true;
                        break;
                    case 'Q1P3':
                        $parcial = '1º Quimestre - 3º Parcial';
                        $Pun001 = 'Q1P3I1';
                        $Pun002 = 'Q1P3I2';
                        $Pun003 = 'Q1P3I3';
                        $Pun004 = 'Q1P3I4';
                        $Pun005 = 'Q1P3I5';
                        $Pun006 = 'Q1P3PR';
                        $mparci = true;
                        break;
                    case 'Q1_P':
                        $parcial = '1º Quimestre - Examen';
                        $Pun001 = 'Q1P4I1';
                        $Pun002 = 'Q1P4I2';
                        $Pun003 = 'Q1P4I3';
                        $Pun004 = 'Q1P4I4';
                        $Pun005 = 'Q1P4I5';
                        $Pun006 = 'Q1P4PR';
                        $mparci = false;
                        break;
                    case 'Q2P1':
                        $parcial = '2º Quimestre - 1º Parcial';
                        $Pun001 = 'Q2P1I1';
                        $Pun002 = 'Q2P1I2';
                        $Pun003 = 'Q2P1I3';
                        $Pun004 = 'Q2P1I4';
                        $Pun005 = 'Q2P1I5';
                        $Pun006 = 'Q2P1PR';
                        $mparci = true;
                        break;
                    case 'Q2P2':
                        $parcial = '2º Quimestre - 2º Parcial';
                        $Pun001 = 'Q2P2I1';
                        $Pun002 = 'Q2P2I2';
                        $Pun003 = 'Q2P2I3';
                        $Pun004 = 'Q2P2I4';
                        $Pun005 = 'Q2P2I5';
                        $Pun006 = 'Q2P2PR';
                        $mparci = true;
                        break;
                    case 'Q2P3':
                        $parcial = '2º Quimestre - 3º Parcial';
                        $Pun001 = 'Q2P3I1';
                        $Pun002 = 'Q2P3I2';
                        $Pun003 = 'Q1P3I3';
                        $Pun004 = 'Q1P3I4';
                        $Pun005 = 'Q1P3I5';
                        $Pun006 = 'Q1P3PR';
                        $mparci = true;
                        break;
                    case 'Q2_P':
                        $parcial = '2º Quimestre - Examen';
                        $Pun001 = 'Q2P4I1';
                        $Pun002 = 'Q2P4I2';
                        $Pun003 = 'Q2P4I3';
                        $Pun004 = 'Q2P4I4';
                        $Pun005 = 'Q2P4I5';
                        $Pun006 = 'Q2P4PR';
                        $mparci = false;
                        break;
                }
              
                $arrPuntajes = array("1" => $Pun001,
                                     "2" => $Pun002,
                                     "3" => $Pun003,
                                     "4" => $Pun004,
                                     "5" => $Pun005,
                                     "6" => $Pun006
                                    );
   	?>
            <section id="vssavone" class="invoice">
                <div class="row mb-4">
                    <div class="col-6">
                        <h2 class="page-header"><img src="<?= media(); ?>images/uploads/JaimeMola.png" style="width: 85%"></h2>
                    </div>
                </div>

                <div class="row invoice-info">
                    <div class="col-2 text-right">  
                        <strong>Sección: </strong>
                    </div>
                    <div class="col-9">
                        <?= $acta[0]['SEC_NM']; ?>
                    </div>
              
                    <div class="col-2 text-right">  
                        <strong>Paralelo: </strong>
                    </div>
                    <div class="col-9">
                        <?= $acta[0]['PARALE']; ?>
                    </div>

                    <div class="col-2 text-right">
                        <strong>Jornada: </strong>
                    </div>
                    <div class="col-9">
                        <?= $jornada; ?>
                    </div>
                    <div class="col-2 text-right">
                        <strong>Asignatura: </strong>
                    </div>
                    <div class="col-9">
                        <?= $acta[0]['MAT_NM']; ?>
                    </div>
                    
                    <div class="col-2 text-right">
                        <strong>Periodo: </strong>
                    </div>
                    <div class="col-9">
                        <?= $parcial; ?>
                    </div>
                    <div class="col-2 text-right">
                        <strong>Año Lectivo: </strong>
                    </div>
                    <div class="col-9">
                        <?= $acta[0]['PERIOS'].'-'.$acta[0]['PERIOS']+1; ?>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 table-responsive">
                    <table class="table table-striped table-bordered" cellspacing="0" width= 100%>
                    <thead>
                        <tr><br>
    <?php 
                        if($mparci)
                        {  
    ?>
                            <th class="text-center">Estudiante</th>
                            <th class="text-center"><?= $insumos['0']['SUB_NM'] ?></th>
                            <th class="text-center"><?= $insumos['1']['SUB_NM'] ?></th>
                            <th class="text-center"><?= $insumos['2']['SUB_NM'] ?></th>
                            <th class="text-center"><?= $insumos['3']['SUB_NM'] ?></th>
                            <th class="text-center">I5</th>
                            <th class="text-center">Parcial</th>
    <?php 
                        }else{ 
    ?>
                            <th class="text-center">Estudiante</th>
                            <th class="text-center">I1</th>
                            <th class="text-center">I2</th>
                            <th class="text-center">I3</th>
                            <th class="text-center">I4</th>
                            <th class="text-center">I5</th>
                            <th class="text-center">Examen</th>
    <?php 
                        }
    ?>
                        </tr>
                    </thead>
                    <tbody>
    <?php 
               			foreach($acta as $alumno)
           			    {
    ?>
                            <tr>
                            <td><?= $alumno['LAS_NM'].' '.$alumno['FIR_NM'] ?></td>
                            <td><input id="<?= $alumno['SEC_ID'] ?>" name="<?= $arrPuntajes['1'] ?>" class="text-center" onchange="fntSavOne(this.id+'-'+this.name+'-'+this.value);" type="number" min="0" step="0.01" value="<?= $alumno[$Pun001] ?>"></td>
                            <td><input id="<?= $alumno['SEC_ID'] ?>" name="<?= $arrPuntajes['2'] ?>" class="text-center" onchange="fntSavOne(this.id+'-'+this.name+'-'+this.value);" type="number" min="0" step="0.01" value="<?= $alumno[$Pun002] ?>"></td>
                            <td><input id="<?= $alumno['SEC_ID'] ?>" name="<?= $arrPuntajes['3'] ?>" class="text-center" onchange="fntSavOne(this.id+'-'+this.name+'-'+this.value);" type="number" min="0" step="0.01" value="<?= $alumno[$Pun003] ?>"></td>
                            <td><input id="<?= $alumno['SEC_ID'] ?>" name="<?= $arrPuntajes['4'] ?>" class="text-center" onchange="fntSavOne(this.id+'-'+this.name+'-'+this.value);" type="number" min="0" step="0.01" value="<?= $alumno[$Pun004] ?>"></td>
                            <td><input id="<?= $alumno['SEC_ID'] ?>" name="<?= $arrPuntajes['5'] ?>" class="text-center" onchange="fntSavOne(this.id+'-'+this.name+'-'+this.value);" type="number" min="0" step="0.01" value="<?= $alumno[$Pun005] ?>"></td>
                            <td class="text-center"><?= $alumno[$Pun006] ?></td>
                            </tr>
    <?php 
                   		}
    ?>
                    </tbody>
                    </table>
                </div>
            </div> 
        </section>
    <?php  
            } 
    ?>
        </div>
    </div>
</main>
