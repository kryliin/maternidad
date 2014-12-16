
<%@ page import="maternidad.FacturaProveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'facturaProveedor.label', default: 'FacturaProveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-facturaProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-facturaProveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="monto" title="${message(code: 'facturaProveedor.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="fechaEmision" title="${message(code: 'facturaProveedor.fechaEmision.label', default: 'Fecha Emision')}" />
					
						<g:sortableColumn property="fechaVencimientoPago" title="${message(code: 'facturaProveedor.fechaVencimientoPago.label', default: 'Fecha Vencimiento Pago')}" />
					
						<g:sortableColumn property="fechaRealPago" title="${message(code: 'facturaProveedor.fechaRealPago.label', default: 'Fecha Real Pago')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'facturaProveedor.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'facturaProveedor.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaProveedorInstanceList}" status="i" var="facturaProveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${facturaProveedorInstance.id}">${fieldValue(bean: facturaProveedorInstance, field: "monto")}</g:link></td>
					
						<td><g:formatDate date="${facturaProveedorInstance.fechaEmision}" /></td>
					
						<td><g:formatDate date="${facturaProveedorInstance.fechaVencimientoPago}" /></td>
					
						<td><g:formatDate date="${facturaProveedorInstance.fechaRealPago}" /></td>
					
						<td>${fieldValue(bean: facturaProveedorInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: facturaProveedorInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${facturaProveedorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
