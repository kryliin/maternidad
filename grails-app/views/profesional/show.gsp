
<%@ page import="maternidad.Profesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profesional" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profesional">

                <g:if test="${profesionalInstance?.persona?.personaFisica}">
                    <li class="fieldcontain">
                        <span id="personaFisica-label" class="property-label"><g:message code="persona.personaFisica.label" default="Persona Fisica" /></span>

                        <span class="property-value" aria-labelledby="personaFisica-label"><g:formatBoolean boolean="${profesionalInstance?.persona?.personaFisica}" /></span>

                    </li>
                </g:if>


                <g:if test="${profesionalInstance?.persona?.cuit}">
                <li class="fieldcontain">
                    <span id="cuit-label" class="property-label"><g:message code="persona.cuit.label" default="Cuit" /></span>

                    <span class="property-value" aria-labelledby="cuit-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="cuit"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.apellido}">
                <li class="fieldcontain">
                    <span id="apellido-label" class="property-label"><g:message code="persona.apellido.label" default="Apellido" /></span>

                    <span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="apellido"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.nombre}">
                <li class="fieldcontain">
                    <span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>

                    <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="nombre"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.razonSocial}">
                <li class="fieldcontain">
                    <span id="razonSocial-label" class="property-label"><g:message code="persona.razonSocial.label" default="Razon Social" /></span>

                    <span class="property-value" aria-labelledby="razonSocial-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="razonSocial"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.tipoDocumento}">
                <li class="fieldcontain">
                    <span id="tipoDocumento-label" class="property-label"><g:message code="persona.tipoDocumento.label" default="Tipo Documento" /></span>

                    <span class="property-value" aria-labelledby="tipoDocumento-label"><g:link controller="tipoDocumento" action="show" id="${profesionalInstance?.persona?.tipoDocumento?.id}">${profesionalInstance?.persona?.tipoDocumento?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.nroDocumento}">
                <li class="fieldcontain">
                    <span id="nroDocumento-label" class="property-label"><g:message code="persona.nroDocumento.label" default="Nro Documento" /></span>

                    <span class="property-value" aria-labelledby="nroDocumento-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="nroDocumento"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.nacionalidad}">
                <li class="fieldcontain">
                    <span id="nacionalidad-label" class="property-label"><g:message code="persona.nacionalidad.label" default="Nacionalidad" /></span>

                    <span class="property-value" aria-labelledby="nacionalidad-label"><g:link controller="pais" action="show" id="${profesionalInstance?.persona?.nacionalidad?.id}">${profesionalInstance?.persona?.nacionalidad?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.calle}">
                <li class="fieldcontain">
                    <span id="calle-label" class="property-label"><g:message code="persona.calle.label" default="Calle" /></span>

                    <span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="calle"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.piso}">
                <li class="fieldcontain">
                    <span id="piso-label" class="property-label"><g:message code="persona.piso.label" default="Piso" /></span>

                    <span class="property-value" aria-labelledby="piso-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="piso"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.departamento}">
                <li class="fieldcontain">
                    <span id="departamento-label" class="property-label"><g:message code="persona.departamento.label" default="Departamento" /></span>

                    <span class="property-value" aria-labelledby="departamento-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="departamento"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.codigoPostal}">
                <li class="fieldcontain">
                    <span id="codigoPostal-label" class="property-label"><g:message code="persona.codigoPostal.label" default="Codigo Postal" /></span>

                    <span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="codigoPostal"/></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.localidad}">
                <li class="fieldcontain">
                    <span id="localidad-label" class="property-label"><g:message code="persona.localidad.label" default="Localidad" /></span>

                    <span class="property-value" aria-labelledby="localidad-label"><g:link controller="localidad" action="show" id="${profesionalInstance?.persona?.localidad?.id}">${profesionalInstance?.persona?.localidad?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.estadoCivil}">
                <li class="fieldcontain">
                    <span id="estadoCivil-label" class="property-label"><g:message code="persona.estadoCivil.label" default="Estado Civil" /></span>

                    <span class="property-value" aria-labelledby="estadoCivil-label"><g:link controller="estadoCivil" action="show" id="${profesionalInstance?.persona?.estadoCivil?.id}">${profesionalInstance?.persona?.estadoCivil?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${profesionalInstance?.persona?.numero}">
                <li class="fieldcontain">
                    <span id="numero-label" class="property-label"><g:message code="persona.numero.label" default="Numero" /></span>

                    <span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${profesionalInstance?.persona}" field="numero"/></span>

                </li>
            </g:if>


                
                
			
				<g:if test="${profesionalInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="profesional.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${profesionalInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.matriculaProvincial}">
				<li class="fieldcontain">
					<span id="matriculaProvincial-label" class="property-label"><g:message code="profesional.matriculaProvincial.label" default="Matricula Provincial" /></span>
					
						<span class="property-value" aria-labelledby="matriculaProvincial-label"><g:fieldValue bean="${profesionalInstance}" field="matriculaProvincial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.fechaMatriculacion}">
				<li class="fieldcontain">
					<span id="fechaMatriculacion-label" class="property-label"><g:message code="profesional.fechaMatriculacion.label" default="Fecha Matriculacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaMatriculacion-label"><g:formatDate date="${profesionalInstance?.fechaMatriculacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.cbu}">
				<li class="fieldcontain">
					<span id="cbu-label" class="property-label"><g:message code="profesional.cbu.label" default="Cbu" /></span>
					
						<span class="property-value" aria-labelledby="cbu-label"><g:fieldValue bean="${profesionalInstance}" field="cbu"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="profesional.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:link controller="banco" action="show" id="${profesionalInstance?.banco?.id}">${profesionalInstance?.banco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.listaConceptos}">
				<li class="fieldcontain">

                    ${message(code: 'profesional.listadeconceptos')}

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
				</li>
				</g:if>

            <h1><g:message code="profesional.cuentacorriente"  /></h1>

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




            </ol>
			<g:form url="[resource:profesionalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${profesionalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>


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
