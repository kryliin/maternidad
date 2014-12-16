<%@ page import="maternidad.Profesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />

        <script>
            $(function() {


                if($("#personaFisica").is(':checked')) {

                    $("#divnombre").addClass("required").show();
                    $("#nombre").attr("required",true);
                    $("#divapellido").addClass("required").show();
                    $("#apellido").attr("required",true);
                    $("#divTipoDocumento").show();
                    $("#divnrodoc").addClass("required").show();

                    $("#nroDocumento").attr("required",true);
                    $("#divestadocivil").show();

                    $("#divrazonsocial").removeClass("required").hide();
                    $("#razonSocial").attr("required",false);
                    $("#divcuit").hide();
                    $("#cuit").attr("required",false);

                } else {
                    $("#divnombre").removeClass("required").hide();
                    $("#nombre").attr("required",false);
                    $("#divapellido").removeClass("required").hide();
                    $("#apellido").attr("required",false);
                    $("#divTipoDocumento").hide();
                    $("#divnrodoc").removeClass("required").hide();
                    $("#nroDocumento").attr("required",false);
                    $("#divestadocivil").hide();

                    $("#divrazonsocial").addClass("required").show();
                    $("#razonSocial").attr("required",true);

                    $("#cuit").attr("required",true);
                    $("#divcuit").addClass("required").show();
                }


                $("#personaFisica").click(function() {
                    if($("#personaFisica").is(':checked')) {

                        $("#divnombre").addClass("required").show();
                        $("#nombre").attr("required",true);
                        $("#divapellido").addClass("required").show();
                        $("#apellido").attr("required",true);
                        $("#divTipoDocumento").show();
                        $("#divnrodoc").addClass("required").show();
                        $("#nroDocumento").attr("required",true);
                        $("#divestadocivil").show();

                        $("#divrazonsocial").hide();
                        $("#razonSocial").attr("required",false);
                        $("#divcuit").hide();
                        $("#cuit").attr("required",false);

                    } else {
                        $("#divnombre").removeClass("required").hide();
                        $("#nombre").attr("required",false);
                        $("#divapellido").removeClass("required").hide();
                        $("#apellido").attr("required",false);
                        $("#divTipoDocumento").hide();
                        $("#divnrodoc").removeClass("required").hide();
                        $("#nroDocumento").attr("required",false);
                        $("#divestadocivil").hide();

                        $("#divrazonsocial").addClass("required").show();
                        $("#razonSocial").attr("required",true);

                        $("#cuit").attr("required",true);
                        $("#divcuit").addClass("required").show();
                    }
                });


                //idioma de los calendar
                jQuery.datepicker.regional[ "es" ];
                updateDatePicker();

                jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                    updateDatePicker();
                });

                $("#banco").select2({allowClear: true});
                $("#persona").select2({allowClear: true});


                $("#personaFisica").attr("disabled",true);

            })

        </script>
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-profesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-profesional" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profesionalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profesionalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:profesionalInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${profesionalInstance?.version}" />
				<fieldset class="form">
                    <g:render template="/persona/form"/>
						<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
<br/>
            ${message(code: 'profesional.listadeconceptos')}
            <div class="nav" role="navigation">
                <ul>
       
                    <li><g:link class="create" controller="conceptoPorProfesional" action="create" id="${profesionalInstance?.id}"  ><g:message code="profesional.nuevoconcepto"  /></g:link></li>
                </ul>
            </div>
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="observacion" title="${message(code: 'conceptoPorProfesional.observacion.label', default: 'Observacion')}" />

                    <g:sortableColumn property="montoFijo" title="${message(code: 'conceptoPorProfesional.montoFijo.label', default: 'Monto Fijo')}" />

                    <g:sortableColumn property="porcentaje" title="${message(code: 'conceptoPorProfesional.porcentaje.label', default: 'Porcentaje')}" />

                    <th><g:message code="conceptoPorProfesional.usuario.label" default="Usuario" /></th>

                    <g:sortableColumn property="activo" title="${message(code: 'conceptoPorProfesional.activo.label', default: 'Activo')}" />


<th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${profesionalInstance?.listaConceptos}" status="i" var="conceptoPorProfesionalInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "observacion")}</td>

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "montoFijo")}</td>

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "porcentaje")}</td>

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "usuario")}</td>

                        <td><g:formatBoolean boolean="${conceptoPorProfesionalInstance.activo}" /></td>


                        <td><g:link class="linkEdit" controller="conceptoPorProfesional" action="create" id="${conceptoPorProfesionalInstance?.profesional?.id}">${message(code: 'default.button.edit.label')}</g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${profesionalInstance?.listaConceptos?.size() ?: 0}" />
            </div>



            <div id="create-movimientoProfesional" class="content scaffold-create" role="main">
                <div class="nav" role="navigation">
                    <ul>
                    <li><g:link class="create" controller="movimientoProfesional" action="create" id="${profesionalInstance?.id}"><g:message code="default.new.label" args="['Movimiento']" /></g:link></li>
                    </ul>
                </div>

                <h1><g:message code="profesional.cuentacorriente"  /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset class="form">
                    <table>
                        <tbody>

                        <tr id="filaoculta" class="prop">
                            <td valign="top" class="name">
                                <label for="profesional">Profesional</label>
                            </td>
                            <td valign="top" class="value ">
                                <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id"  noSelection="['null':'Seleccione un Profesional']"
                                          onchange="${remoteFunction(controller: 'movimientoProfesional',
                                                  action: 'getmovimientosProfesional',
                                                  params: '\'idProfesional=\' + this.value',
                                                  update: 'divprofesional')}"
                                />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td></td>
                            <td><div id="divprofesional">
                                <g:render  template="/movimientoProfesional/movimientos"
                                           model="[movimientoProfesionalInstanceList: movimientos, movimientoProfesionalInstanceCount: movimientos?.size(), total: total]"    />
                            </div>
                            </td>
                        </tr>



                        </tbody>
                    </table>
                </fieldset>

            </div>




            <script>
                $(function() {

                    $('#profesional').change(function(e){

                        $("#profesional").val('${profesionalInstance?.id}');
                        $("#profesional").prop("disabled", true);
                        $("#filaoculta").hide();
                    });

                    // And now fire change event when the DOM is ready
                    $('#profesional').trigger('change');

                    // $("#obrasocial").attr('readonly',true).select2({allowClear: true});
                   // $("#obrasocial").attr('readonly',true);

                })

            </script>



        </div>
	</body>
</html>
