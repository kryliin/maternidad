
<%@ page import="maternidad.FacturaProveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'facturaProveedor.label', default: 'FacturaProveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-facturaProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-facturaProveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list facturaProveedor">
			
				<g:if test="${facturaProveedorInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="facturaProveedor.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${facturaProveedorInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.fechaEmision}">
				<li class="fieldcontain">
					<span id="fechaEmision-label" class="property-label"><g:message code="facturaProveedor.fechaEmision.label" default="Fecha Emision" /></span>
					
						<span class="property-value" aria-labelledby="fechaEmision-label"><g:formatDate date="${facturaProveedorInstance?.fechaEmision}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.fechaVencimientoPago}">
				<li class="fieldcontain">
					<span id="fechaVencimientoPago-label" class="property-label"><g:message code="facturaProveedor.fechaVencimientoPago.label" default="Fecha Vencimiento Pago" /></span>
					
						<span class="property-value" aria-labelledby="fechaVencimientoPago-label"><g:formatDate date="${facturaProveedorInstance?.fechaVencimientoPago}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.fechaRealPago}">
				<li class="fieldcontain">
					<span id="fechaRealPago-label" class="property-label"><g:message code="facturaProveedor.fechaRealPago.label" default="Fecha Real Pago" /></span>
					
						<span class="property-value" aria-labelledby="fechaRealPago-label"><g:formatDate date="${facturaProveedorInstance?.fechaRealPago}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="facturaProveedor.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${facturaProveedorInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="facturaProveedor.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${facturaProveedorInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="facturaProveedor.proveedor.label" default="Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${facturaProveedorInstance?.proveedor?.id}">${facturaProveedorInstance?.proveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaProveedorInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="facturaProveedor.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${facturaProveedorInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:facturaProveedorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${facturaProveedorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
