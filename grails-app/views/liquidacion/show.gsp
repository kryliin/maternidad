
<%@ page import="maternidad.Liquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'liquidacion.label', default: 'Liquidacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-liquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-liquidacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list liquidacion">
			
				<g:if test="${liquidacionInstance?.detallesLiquidacion}">
				<li class="fieldcontain">
					<span id="detallesLiquidacion-label" class="property-label"><g:message code="liquidacion.detallesLiquidacion.label" default="Detalles Liquidacion" /></span>
					
						<g:each in="${liquidacionInstance.detallesLiquidacion}" var="d">
						<span class="property-value" aria-labelledby="detallesLiquidacion-label"><g:link controller="detalleLiquidacion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="liquidacion.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${liquidacionInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.montoBruto}">
				<li class="fieldcontain">
					<span id="montoBruto-label" class="property-label"><g:message code="liquidacion.montoBruto.label" default="Monto Bruto" /></span>
					
						<span class="property-value" aria-labelledby="montoBruto-label"><g:fieldValue bean="${liquidacionInstance}" field="montoBruto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.montoNeto}">
				<li class="fieldcontain">
					<span id="montoNeto-label" class="property-label"><g:message code="liquidacion.montoNeto.label" default="Monto Neto" /></span>
					
						<span class="property-value" aria-labelledby="montoNeto-label"><g:fieldValue bean="${liquidacionInstance}" field="montoNeto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.nuemroLiquidacion}">
				<li class="fieldcontain">
					<span id="nuemroLiquidacion-label" class="property-label"><g:message code="liquidacion.nuemroLiquidacion.label" default="Nuemro Liquidacion" /></span>
					
						<span class="property-value" aria-labelledby="nuemroLiquidacion-label"><g:fieldValue bean="${liquidacionInstance}" field="nuemroLiquidacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.numeroRecibo}">
				<li class="fieldcontain">
					<span id="numeroRecibo-label" class="property-label"><g:message code="liquidacion.numeroRecibo.label" default="Numero Recibo" /></span>
					
						<span class="property-value" aria-labelledby="numeroRecibo-label"><g:fieldValue bean="${liquidacionInstance}" field="numeroRecibo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.periodo}">
				<li class="fieldcontain">
					<span id="periodo-label" class="property-label"><g:message code="liquidacion.periodo.label" default="Periodo" /></span>
					
						<span class="property-value" aria-labelledby="periodo-label"><g:fieldValue bean="${liquidacionInstance}" field="periodo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${liquidacionInstance?.profesional}">
				<li class="fieldcontain">
					<span id="profesional-label" class="property-label"><g:message code="liquidacion.profesional.label" default="Profesional" /></span>
					
						<span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional" action="show" id="${liquidacionInstance?.profesional?.id}">${liquidacionInstance?.profesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:liquidacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${liquidacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
