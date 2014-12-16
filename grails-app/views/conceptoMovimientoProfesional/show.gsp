
<%@ page import="maternidad.ConceptoMovimientoProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoMovimientoProfesional.label', default: 'ConceptoMovimientoProfesional')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conceptoMovimientoProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conceptoMovimientoProfesional" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conceptoMovimientoProfesional">
			
				<g:if test="${conceptoMovimientoProfesionalInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="conceptoMovimientoProfesional.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${conceptoMovimientoProfesionalInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoMovimientoProfesionalInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="conceptoMovimientoProfesional.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${conceptoMovimientoProfesionalInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoMovimientoProfesionalInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="conceptoMovimientoProfesional.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${conceptoMovimientoProfesionalInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoMovimientoProfesionalInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="conceptoMovimientoProfesional.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${conceptoMovimientoProfesionalInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoMovimientoProfesionalInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="conceptoMovimientoProfesional.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${conceptoMovimientoProfesionalInstance?.usuario?.id}">${conceptoMovimientoProfesionalInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoMovimientoProfesionalInstance?.conceptoLiquidacion}">
				<li class="fieldcontain">
					<span id="conceptoLiquidacion-label" class="property-label"><g:message code="conceptoMovimientoProfesional.conceptoLiquidacion.label" default="Concepto Liquidacion" /></span>
					
						<span class="property-value" aria-labelledby="conceptoLiquidacion-label"><g:link controller="conceptoProfesional" action="show" id="${conceptoMovimientoProfesionalInstance?.conceptoLiquidacion?.id}">${conceptoMovimientoProfesionalInstance?.conceptoLiquidacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:conceptoMovimientoProfesionalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${conceptoMovimientoProfesionalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
