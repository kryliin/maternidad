
<%@ page import="maternidad.MovimientoProveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimientoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimientoProveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="movimientoProveedor.proveedor.label" default="Proveedor" /></th>
					
						<g:sortableColumn property="monto" title="${message(code: 'movimientoProveedor.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'movimientoProveedor.fecha.label', default: 'Fecha')}" />
					

						<th><g:message code="movimientoProveedor.facturaProveedor.label" default="Factura Proveedor" /></th>
					
						<th><g:message code="movimientoProveedor.tipoPago.label" default="Tipo Pago" /></th>

                        <th></th>
                        <th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${movimientoProveedorInstanceList}" status="i" var="movimientoProveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: movimientoProveedorInstance, field: "proveedor")}</td>
					
						<td>${fieldValue(bean: movimientoProveedorInstance, field: "monto")}</td>
					
						<td><g:formatDate date="${movimientoProveedorInstance.fecha}" /></td>

					
						<td>${fieldValue(bean: movimientoProveedorInstance, field: "facturaProveedor")}</td>
					
						<td>${fieldValue(bean: movimientoProveedorInstance, field: "tipoPago")}</td>

                        <td><g:link class="linkEdit" action="edit" id="${movimientoProveedorInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                        <td><g:link class="linkShow" action="show" id="${movimientoProveedorInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoProveedorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
