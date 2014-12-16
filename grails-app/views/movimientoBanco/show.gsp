
<%@ page import="maternidad.MovimientoBanco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoBanco.label', default: 'MovimientoBanco')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movimientoBanco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movimientoBanco" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movimientoBanco">
			
				<g:if test="${movimientoBancoInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="movimientoBanco.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${movimientoBancoInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="movimientoBanco.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${movimientoBancoInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="movimientoBanco.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${movimientoBancoInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.cheque}">
				<li class="fieldcontain">
					<span id="cheque-label" class="property-label"><g:message code="movimientoBanco.cheque.label" default="Cheque" /></span>
					
						<span class="property-value" aria-labelledby="cheque-label"><g:link controller="cheque" action="show" id="${movimientoBancoInstance?.cheque?.id}">${movimientoBancoInstance?.cheque?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.numeroTransferencia}">
				<li class="fieldcontain">
					<span id="numeroTransferencia-label" class="property-label"><g:message code="movimientoBanco.numeroTransferencia.label" default="Numero Transferencia" /></span>
					
						<span class="property-value" aria-labelledby="numeroTransferencia-label"><g:fieldValue bean="${movimientoBancoInstance}" field="numeroTransferencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.cuentaTransferencia}">
				<li class="fieldcontain">
					<span id="cuentaTransferencia-label" class="property-label"><g:message code="movimientoBanco.cuentaTransferencia.label" default="Cuenta Transferencia" /></span>
					
						<span class="property-value" aria-labelledby="cuentaTransferencia-label"><g:fieldValue bean="${movimientoBancoInstance}" field="cuentaTransferencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.facturaProveedor}">
				<li class="fieldcontain">
					<span id="facturaProveedor-label" class="property-label"><g:message code="movimientoBanco.facturaProveedor.label" default="Factura Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="facturaProveedor-label"><g:link controller="facturaProveedor" action="show" id="${movimientoBancoInstance?.facturaProveedor?.id}">${movimientoBancoInstance?.facturaProveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.tipoPago}">
				<li class="fieldcontain">
					<span id="tipoPago-label" class="property-label"><g:message code="movimientoBanco.tipoPago.label" default="Tipo Pago" /></span>
					
						<span class="property-value" aria-labelledby="tipoPago-label"><g:link controller="tipoPago" action="show" id="${movimientoBancoInstance?.tipoPago?.id}">${movimientoBancoInstance?.tipoPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.conceptoBanco}">
				<li class="fieldcontain">
					<span id="conceptoBanco-label" class="property-label"><g:message code="movimientoBanco.conceptoBanco.label" default="Concepto Banco" /></span>
					
						<span class="property-value" aria-labelledby="conceptoBanco-label"><g:link controller="conceptoBanco" action="show" id="${movimientoBancoInstance?.conceptoBanco?.id}">${movimientoBancoInstance?.conceptoBanco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="movimientoBanco.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:link controller="banco" action="show" id="${movimientoBancoInstance?.banco?.id}">${movimientoBancoInstance?.banco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoBancoInstance?.credito}">
				<li class="fieldcontain">
					<span id="credito-label" class="property-label"><g:message code="movimientoBanco.credito.label" default="Credito" /></span>
					
						<span class="property-value" aria-labelledby="credito-label"><g:formatBoolean boolean="${movimientoBancoInstance?.credito}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:movimientoBancoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movimientoBancoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
