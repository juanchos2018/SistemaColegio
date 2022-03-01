<!-- Modal -->
<div class="modal fade" id="modalformVsnotify" name="modalFormVsnotify" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Registrar Notificación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
                <form id="formVsnotify" name="formVsnotify">
                <!-- boton oculto -->
                <input type="hidden" id="idSec_id" name="idSec_id" value="">
                <input type="hidden" id="txtHorreg" name="txtHorreg" value="">
                <input type="hidden" id="listEmp_no" name="listEmp_no" value="">
                 
                <p class="text-primary">Campos con asterisco * son obligatorios</p>

                <!-- Año y Fecha -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="listPerios">Año Lectivo *</label>
                            <input class="form-control" id="listPerios" name="listPerios" type="number" placeholder="*" maxlength="4" required="">
                        </div>
            		</div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="datFecreg">Fecha *</label>
                            <input class="form-control" id="datFecreg" name="datFecreg" type="date" placeholder="" required="">
                        </div>
                    </div>
           		</div>

                <!-- Sección -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="listSec_no">Sección *</label>
                        <select class="form-control" data-live-search="true" data-size="5" id="listSec_no" name="listSec_no" required="">
                        </select> 
                    </div>
                </div>

                <!-- Asignatura -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="listMat_no">Asignatura *</label>
                        <select class="form-control" data-live-search="true" data-size="5" id="listMat_no" name="listMat_no" required="">
                        </select>
                    </div>
                </div>

                <!-- Estudiante -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="listStd_no">Estudiante (En blanco todos)</label>
                        <select class="form-control" data-live-search="true" data-size="5" id="listStd_no" name="listStd_no">
                        </select>
                    </div>
                </div>

                <!-- Agenda -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtSchedu">Descripción de la Notificación *</label>
                        <textarea class="form-control" id="txtSchedu" name="txtSchedu" rows="2" type="text" maxlength="250" required=""></textarea>
                    </div>
                </div>


                <div class="modal-footer">
                    <button id="btnActionForm" class="btn btn-success" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span></button>&nbsp;&nbsp;&nbsp;                 
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</button>
                </div> 

                </form>
            </div>
        </div>
    </div>
</div>
