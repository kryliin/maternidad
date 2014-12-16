
<%@ page import="maternidad.MovimientoProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movimientoProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movimientoProfesional" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movimientoProfesional">
			
				<g:if test="${movimientoProfesionalInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="movimientoProfesional.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${movimientoProfesionalInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProfesionalInstance?.profesional}">
				<li class="fieldcontain">
					<span id="profesional-label" class="property-label"><g:message code="movimientoProfesional.profesional.label" default="Profesional" /></span>
					
						<span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional" action="show" id="${movimientoProfesionalInstance?.profesional?.id}">${movimientoProfesionalInstance?.profesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProfesionalInstance?.conceptoProfesional}">
				<li class="fieldcontain">
					<span id="conceptoProfesional-label" class="property-label"><g:message code="movimientoProfesional.conceptoProfesional.label" default="Concepto Profesional" /></span>
					
						<span class="property-value" aria-labelledby="conceptoProfesional-label"><g:link controller="conceptoMovimientoProfesional" action="show" id="${movimientoProfesionalInstance?.conceptoProfesional?.id}">${movimientoProfesionalInstance?.conceptoProfesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProfesionalInstance?.credito}">
				<li class="fieldcontain">
					<span id="credito-label" class="property-label"><g:message code="movimientoProfesional.credito.label" default="Credito" /></span>
					
						<span class="property-value" aria-labelledby="credito-label"><g:formatBoolean boolean="${movimientoProfesionalInstance?.credito}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProfesionalInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="movimientoProfesional.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${movimientoProfesionalInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProfesionalInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="movimientoProfesional.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${movimientoProfesionalInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProfesionalInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="movimientoProfesional.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${movimientoProfesionalInstance?.usuario?.id}">${movimientoProfesionalInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:movimientoProfesionalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movimientoProfesionalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
