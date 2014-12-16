
<%@ page import="maternidad.MovimientoProveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movimientoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movimientoProveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movimientoProveedor">
			
				<g:if test="${movimientoProveedorInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="movimientoProveedor.proveedor.label" default="Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${movimientoProveedorInstance?.proveedor?.id}">${movimientoProveedorInstance?.proveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="movimientoProveedor.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${movimientoProveedorInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="movimientoProveedor.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${movimientoProveedorInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="movimientoProveedor.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${movimientoProveedorInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.facturaProveedor}">
				<li class="fieldcontain">
					<span id="facturaProveedor-label" class="property-label"><g:message code="movimientoProveedor.facturaProveedor.label" default="Factura Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="facturaProveedor-label"><g:link controller="facturaProveedor" action="show" id="${movimientoProveedorInstance?.facturaProveedor?.id}">${movimientoProveedorInstance?.facturaProveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.tipoPago}">
				<li class="fieldcontain">
					<span id="tipoPago-label" class="property-label"><g:message code="movimientoProveedor.tipoPago.label" default="Tipo Pago" /></span>
					
						<span class="property-value" aria-labelledby="tipoPago-label"><g:link controller="tipoPago" action="show" id="${movimientoProveedorInstance?.tipoPago?.id}">${movimientoProveedorInstance?.tipoPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.conceptoProveedor}">
				<li class="fieldcontain">
					<span id="conceptoProveedor-label" class="property-label"><g:message code="movimientoProveedor.conceptoProveedor.label" default="Concepto Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="conceptoProveedor-label"><g:link controller="conceptoProveedor" action="show" id="${movimientoProveedorInstance?.conceptoProveedor?.id}">${movimientoProveedorInstance?.conceptoProveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="movimientoProveedor.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:link controller="banco" action="show" id="${movimientoProveedorInstance?.banco?.id}">${movimientoProveedorInstance?.banco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoProveedorInstance?.credito}">
				<li class="fieldcontain">
					<span id="credito-label" class="property-label"><g:message code="movimientoProveedor.credito.label" default="Credito" /></span>
					
						<span class="property-value" aria-labelledby="credito-label"><g:formatBoolean boolean="${movimientoProveedorInstance?.credito}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:movimientoProveedorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movimientoProveedorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
