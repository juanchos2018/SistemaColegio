<!-- Modal -->
<div class="modal fade" id="modalformVstudent" name="modalformVstudent" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Nuevo Estudiante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
                <form id="formVstudent" name="formVstudent">
                <!-- boton oculto -->
                <input type="hidden" id="idStd" name="idStd" value="">
                <p class="text-primary">Campos con asterisco * son obligatorios</p>

                <!-- Condición Estudiante y Año Lectivo -->
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="listStatus">Condición Estudiante *</label>
                        <select class="form-control selectpicker" id="listStatus" name="listStatus" required="">
                                <option value="0">Aspirante</option>
                                <option value="1">Admitido</option>
                                <option value="2">Matriculado</option>
                                <option value="3">Retirado</option>
                                <option value="4">Viene con Pase</option>
                                <option value="5">Egresado</option>
                                <option value="6">Desertor</option>
                                <option value="7">NEE Discapacitado</option>
                                <option value="8">NEE No Discapacitado</option>
                                <option value="9">Sin Documentos</option> 
                                <option value="10">No Matriculado</option>
                                <option value="11">Eliminado</option>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="listPerios">Año Lectivo *</label>
                        <input class="form-control" id="listPerios" name="listPerios" type="number" pattern="[0-9]{4,4}" title="Solo números y maximo 4 digitos" required="">
                    </div>
                </div>

                <!-- Número de Matrícula Folio y Fecha Matrícula -->
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="listMatnum">No. Matrícula</label>
                        <input class="form-control" id="listMatnum" name="listMatnum" type="number" pattern="[0-9]{4,4}" title="Solo números y maximo 4 digitos">
                    </div>

                    <div class="form-group col-md-3">
                        <label for="listFolnum">No. Folio</label>
                        <input class="form-control" id="listFolnum" name="listFolnum" type="number" pattern="[0-9]{4,4}" title="Solo números y maximo 4 digitos">
                    </div>

                    <div class="form-group col-md-6">
                        <label class="datFecmat">Fecha Matrícula</label>
                        <input class="form-control" id="datFecmat" name="datFecmat" type="date" placeholder="">
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

                <!-- Apellidos y Nombres Estudiante -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtLas_nm">Apellidos Estudiante *</label>
                            <input class="form-control" id="txtLas_nm" name="txtLas_nm" type="text" placeholder="*" maxlength="50" required="">
                        </div>
                    </div>
                        
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFir_nm">Nombres Estudiante *</label>
                            <input class="form-control" id="txtFir_nm" name="txtFir_nm" type="text" placeholder="*" maxlength="50" required="">
                        </div>
                    </div>         
                </div>

                <!-- Dirección y Teléfonos Estudiante -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtAddres">Dirección Estudiante *</label>
                            <textarea class="form-control" id="txtAddres" name="txtAddres" rows="3" type="text" placeholder="*" maxlength="100" required=""></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtTphone">Teléfonos Estudiante *</label>
                            <textarea class="form-control" id="txtTphone" name="txtTphone" rows="3" type="text" placeholder="*" maxlength="50" required=""></textarea>
                        </div>
                    </div>
                </div>
                                    
                <!-- Credencial Estudiante -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="listIdtype">Tipo Identificación *</label>
                            <select class="form-control selectpicker" id="listIdtype" name="listIdtype" required="">
                                    <option value="" selected>Seleccione</option>
                                    <option value="05">Cédula</option>
                                    <option value="04">RUC</option>
                                    <option value="06">Pasaporte</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtIde_no">Número Identificación *</label>
                            <input class="form-control" id="txtIde_no" name="txtIde_no" type="text" placeholder="Identificación" pattern="[a-zA-Z0-9-]{9,13}" title="Máximo 13 digitos" required="">
                        </div>
                    </div>
                </div>

                <!-- Género y Fecha Nacimiento Estudiante -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="listStdgen">Género *</label>
                            <select class="form-control selectpicker" id="listStdgen" name="listStdgen" required="">
                                    <option value="" selected>Seleccione</option>
                                    <option value="1">Masculino</option>
                                    <option value="2">Femenino</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="datFecbir">Fecha Nacimiento</label>
                            <input class="form-control" id="datFecbir" name="datFecbir" type="date">
                        </div>
                    </div>
                </div>

                <!-- Correo Estudiante -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="txtStdmai">Correo Electrónico Estudiante *</label>
                        <input class="form-control" id="txtStdmai" name="txtStdmai" type="email" placeholder="*" maxlength="100" required="">
                    </div>
                </div>

                <!-- Institución de Procedencia -->
                <div class="form-group">
                    <label class="txtLassch">Institución de Procedencia</label>
                    <input class="form-control" id="txtLassch" name="txtLassch" type="text" maxlength="100">
                </div>

                <!-- Información del Padre: -->
                <p class="text-info mb-0">INFORMACIÓN DEL PADRE</p>
                <hr class="mt-0">

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFatlas">Apellidos</label>
                            <input class="form-control" id="txtFatlas" name="txtFatlas" type="text" maxlength="50">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFatnam">Nombres</label>
                            <input class="form-control" id="txtFatnam" name="txtFatnam" type="text" maxlength="50">
                        </div>
                    </div>
                </div>

                <!-- Dirección y Teléfonos Padre -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFatadr">Dirección</label>
                            <textarea class="form-control" id="txtFatadr" name="txtFatadr" rows="3" type="text" maxlength="100"></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFatfon">Teléfonos</label>
                            <textarea class="form-control" id="txtFatfon" name="txtFatfon" rows="3" type="text" maxlength="50"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Credencial Padre -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="listFatype">Tipo Identificación</label>
                            <select class="form-control selectpicker" id="listFatype" name="listFatype">
                                <option value="05">Cédula</option>
                                <option value="04">RUC</option>
                                <option value="06">Pasaporte</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFatced">Número Identificación</label>
                            <input class="form-control" id="txtFatced" name="txtFatced" type="text" pattern="[a-zA-Z0-9-]{9,13}" title="Máximo 13 digitos">
                        </div>
                    </div>
                </div>

                <!-- Lugar de Trabajo y Fecha Nacimiento Padre -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtFatjob">Lugar Trabajo y Ocupación</label>
                            <input class="form-control" id="txtFatjob" name="txtFatjob" type="text" maxlength="100">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="datFatbir">Fecha Nacimiento</label>
                            <input class="form-control" id="datFatbir" name="datFatbir" type="date">
                        </div>
                    </div>
                </div>

                <!-- Correo Padre -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="txtFatmai">Correo Electrónico</label>
                        <input class="form-control" id="txtFatmai" name="txtFatmai" type="email" maxlength="100">
                    </div>
                </div>


                <!-- Información de la Madre -->
                <p class="text-info mb-0">INFORMACIÓN DE LA MADRE</p>
                <hr class="mt-0">

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtMotlas">Apellidos</label>
                            <input class="form-control" id="txtMotlas" name="txtMotlas" type="text" maxlength="50">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtMotnam">Nombres</label>
                            <input class="form-control" id="txtMotnam" name="txtMotnam" type="text" maxlength="50">
                        </div>
                    </div>
                </div>

                <!-- Dirección y Teléfonos Madre -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtMotadr">Dirección</label>
                            <textarea class="form-control" id="txtMotadr" name="txtMotadr" rows="3" type="text" maxlength="100"></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtMotfon">Teléfonos</label>
                            <textarea class="form-control" id="txtMotfon" name="txtMotfon" rows="3" type="text" maxlength="50"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Credencial Madre -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="listMotype">Tipo Identificación</label>
                            <select class="form-control selectpicker" id="listMotype" name="listMotype">
                                <option value="05">Cédula</option>
                                <option value="04">RUC</option>
                                <option value="06">Pasaporte</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtMotced">Número Identificación</label>
                            <input class="form-control" id="txtMotced" name="txtMotced" type="text" pattern="[a-zA-Z0-9-]{9,13}" title="Máximo 13 digitos">
                        </div>
                    </div>
                </div>

                <!-- Lugar de Trabajo y Fecha Nacimiento Madre -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtMotjob">Lugar Trabajo y Ocupación</label>
                            <input class="form-control" id="txtMotjob" name="txtMotjob" type="text" maxlength="100">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="datMotbir">Fecha Nacimiento</label>
                            <input class="form-control" id="datMotbir" name="datMotbir" type="date">
                        </div>
                    </div>
                </div>

                <!-- Correo Madre -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="txtMotmai">Correo Electrónico</label>
                        <input class="form-control" id="txtMotmai" name="txtMotmai" type="email" maxlength="100">
                    </div>
                </div>

                <!-- Estudiante Representado por -->
                <p class="text-info mb-0">INFORMACIÓN DEL REPRESENTANTE</p>
                <hr class="mt-0">

                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="listTt_who">Representado por *</label>
                        <select class="form-control selectpicker" id="listTt_who" name="listTt_who" onchange="getRep();" required="">
                                <option value="" selected>Seleccione</option>
                                <option value="1">Padre</option>
                                <option value="2">Madre</option>
                                <option value="3">Otro</option>
                        </select>
                    </div>
                </div>
            
                <!-- Apellidos y Nombres Rpte -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtReplas">Apellidos *</label>
                            <input class="form-control" id="txtReplas" name="txtReplas" type="text" placeholder="*" maxlength="50" required="">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtRepnam">Nombres *</label>
                            <input class="form-control" id="txtRepnam" name="txtRepnam" type="text" placeholder="*" maxlength="50" required="">
                        </div>
                    </div>
                </div>

                <!-- Dirección y Teléfonos Rpte -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtRepadr">Dirección</label>
                            <textarea class="form-control" id="txtRepadr" name="txtRepadr" rows="3" type="text" maxlength="100"></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtRepfon">Teléfonos</label>
                            <textarea class="form-control" id="txtRepfon" name="txtRepfon" rows="3" type="text" maxlength="50"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Credencial Rpte -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="listRetype">Tipo Identificación *</label>
                            <select class="form-control selectpicker" id="listRetype" name="listRetype">
                                    <option value="" selected>Seleccione</option>
                                    <option value="05">Cédula</option>
                                    <option value="04">RUC</option>
                                    <option value="06">Pasaporte</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtRepced">Número Identificación *</label>
                            <input class="form-control" id="txtRepced" name="txtRepced" type="text" placeholder="Identificación" pattern="[a-zA-Z0-9-]{9,13}" title="Máximo 13 digitos" required="">
                        </div>
                    </div>
                </div>

                <!-- Lugar de Trabajo y Fecha Nacimiento Rpte -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtRepjob">Lugar Trabajo y Ocupación</label>
                            <input class="form-control" id="txtRepjob" name="txtRepjob" type="text" maxlength="100">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="datRepbir">Fecha Nacimiento</label>
                            <input class="form-control" id="datRepbir" name="datRepbir" type="date">
                        </div>
                    </div>
                </div>

                <!-- Correo Rpte -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtRepmai">Correo Electrónico *</label>
                        <input class="form-control" id="txtRepmai" name="txtRepmai" type="email" placeholder="*" maxlength="100" required="">
                    </div>
                </div>

                <!-- Otro Contacto  -->
                <p class="text-info mb-0">OTRO CONTACTO</p>
                <hr class="mt-0">

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="txtPerson">Apellidos y Nombres Otro Contacto</label>
                        <input class="form-control" id="txtPerson" name="txtPerson" type="text" maxlength="100">
                    </div>
                </div>

                <!-- Dirección y Teléfonos Otro Contacto -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtPeradr">Dirección Otro Contacto</label>
                            <input class="form-control" id="txtPeradr" name="txtPeradr" type="text" maxlength="100">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtPerfon">Teléfonos Otro Contacto</label>
                            <input class="form-control" id="txtPerfon" name="txtPerfon" type="number" maxlength="50">
                        </div>
                    </div>
                </div>
    
                <!-- Facturacón asumida por -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="listFacwho">Facturación Asumida por *</label>
                        <select class="form-control selectpicker" id="listFacwho" name="listFacwho" onchange="getFac();" required="">
                                <option value="" selected>Seleccione</option>
                                <option value="1">Padre</option>
                                <option value="2">Madre</option>
                                <option value="3">Otro</option>
                        </select>
                    </div>
                </div>

                <!-- Razón Social Facturación -->
                <div class="form-group">
                    <label class="txtRazons">Razón Social para Facturación</label>
                    <input class="form-control" id="txtRazons" name="txtRazons" type="text" maxlength="100">
                </div>

                <!-- Dirección y Teléfonos Cliente -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtDirecc">Dirección</label>
                            <textarea class="form-control" id="txtDirecc" name="txtDirecc" rows="3" type="text" maxlength="100"></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtTlf_no">Teléfonos</label>
                            <textarea class="form-control" id="txtTlf_no" name="txtTlf_no" rows="3" type="text" maxlength="50"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Credencial Cliente -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="listCltype">Tipo Identificación</label>
                            <select class="form-control selectpicker" id="listCltype" name="listCltype">
                                <option value="05">Cédula</option>
                                <option value="04">RUC</option>
                                <option value="06">Pasaporte</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="txtRuc_no">Número Identificación</label>
                            <input class="form-control" id="txtRuc_no" name="txtRuc_no" type="text" maxlength="13" pattern="[a-zA-Z0-9-]{9,13}">
                        </div>
                    </div>
                </div>

                <!-- Correo para Facturación -->
                <div class="form-group">
                    <label class="txtEmails">Correo Electrónico para Facturación</label>
                    <input class="form-control" id="txtEmails" name="txtEmails" type="email" maxlength="100">
                </div>

                <!-- Observaciones -->
                <div class="form-group">
                    <label class="txtRemark">Observaciones</label>
                    <textarea class="form-control" id="txtRemark" name="txtRemark" rows="2" type="text" maxlength="100"></textarea>
                </div>  

                <div class="modal-footer">
                    <button id="btnStdPromot" class="btn btn-warning" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Promover</button>&nbsp;&nbsp;&nbsp;
                    <button id="btnActionForm" class="btn btn-success" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i><span id="btnText">Guardar</span></button>&nbsp;&nbsp;&nbsp;                 
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</button>
                </div> 

                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal Informe Estudiantes -->
<div class="modal fade" id="modalformVsstdlis" name="modalformVsstdlis" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Informe Estudiantes Matriculados</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
                <form id="formVsstdlis" name="formVsstdlis">                
                <p class="text-primary">Campos con asterisco * son obligatorios</p>
                
                <!-- Año Lectivo -->
                <div class="row">
                    <div class="form-group col-md-6">
                        <label>Año Lectivo *</label>
                        <input class="form-control" id="listPerio2" name="listPerio2" type="number" maxlength="4" required="">
                    </div>
                </div>

                <div class="modal-footer">
                    <button id="btnPrnStdLis" class="btn btn-success" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Aceptar</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</button>
                </div> 

                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal para Informe Matriculados -->
<div class="modal fade" id="modvsStdPrn" name="modvsStdPrn" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Impresión Estudiantes Matriculados</h5>
            </div>
            
            <div class="modal-body">
            </div>

        </div>
    </div>
</div>
