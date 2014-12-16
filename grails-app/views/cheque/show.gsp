
<%@ page import="maternidad.Cheque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cheque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cheque" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cheque">
			
				<g:if test="${chequeInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="cheque.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${chequeInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.fechaEmision}">
				<li class="fieldcontain">
					<span id="fechaEmision-label" class="property-label"><g:message code="cheque.fechaEmision.label" default="Fecha Emision" /></span>
					
						<span class="property-value" aria-labelledby="fechaEmision-label"><g:formatDate date="${chequeInstance?.fechaEmision}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.fechaVencimientoCobro}">
				<li class="fieldcontain">
					<span id="fechaVencimientoCobro-label" class="property-label"><g:message code="cheque.fechaVencimientoCobro.label" default="Fecha Vencimiento Cobro" /></span>
					
						<span class="property-value" aria-labelledby="fechaVencimientoCobro-label"><g:formatDate date="${chequeInstance?.fechaVencimientoCobro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.fechaRealCobro}">
				<li class="fieldcontain">
					<span id="fechaRealCobro-label" class="property-label"><g:message code="cheque.fechaRealCobro.label" default="Fecha Real Cobro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRealCobro-label"><g:formatDate date="${chequeInstance?.fechaRealCobro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="cheque.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${chequeInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="cheque.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${chequeInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="cheque.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${chequeInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="cheque.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:link controller="banco" action="show" id="${chequeInstance?.banco?.id}">${chequeInstance?.banco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chequeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chequeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
