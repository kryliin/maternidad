
<%@ page import="maternidad.Nacimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nacimiento.label', default: 'Nacimiento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nacimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nacimiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nacimiento">
			
				<g:if test="${nacimientoInstance?.fecha_hora_parto}">
				<li class="fieldcontain">
					<span id="fecha_hora_parto-label" class="property-label"><g:message code="nacimiento.fecha_hora_parto.label" default="Fechahoraparto" /></span>
					
						<span class="property-value" aria-labelledby="fecha_hora_parto-label"><g:formatDate date="${nacimientoInstance?.fecha_hora_parto}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nacimientoInstance?.tipo_parto_id}">
				<li class="fieldcontain">
					<span id="tipo_parto_id-label" class="property-label"><g:message code="nacimiento.tipo_parto_id.label" default="Tipopartoid" /></span>
					
						<span class="property-value" aria-labelledby="tipo_parto_id-label"><g:link controller="tipoParto" action="show" id="${nacimientoInstance?.tipo_parto_id?.id}">${nacimientoInstance?.tipo_parto_id?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${nacimientoInstance?.peso_bebe}">
				<li class="fieldcontain">
					<span id="peso_bebe-label" class="property-label"><g:message code="nacimiento.peso_bebe.label" default="Pesobebe" /></span>
					
						<span class="property-value" aria-labelledby="peso_bebe-label"><g:fieldValue bean="${nacimientoInstance}" field="peso_bebe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nacimientoInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="nacimiento.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${nacimientoInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nacimientoInstance?.condicion_al_nacer}">
				<li class="fieldcontain">
					<span id="condicion_al_nacer-label" class="property-label"><g:message code="nacimiento.condicion_al_nacer.label" default="Condicionalnacer" /></span>
					
						<span class="property-value" aria-labelledby="condicion_al_nacer-label"><g:fieldValue bean="${nacimientoInstance}" field="condicion_al_nacer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nacimientoInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="nacimiento.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${nacimientoInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nacimientoInstance?.planillainternacion}">
				<li class="fieldcontain">
					<span id="planillainternacion-label" class="property-label"><g:message code="nacimiento.planillainternacion.label" default="Planillainternacion" /></span>
					
						<span class="property-value" aria-labelledby="planillainternacion-label"><g:link controller="planillaInternacion" action="show" id="${nacimientoInstance?.planillainternacion?.id}">${nacimientoInstance?.planillainternacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:nacimientoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${nacimientoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
