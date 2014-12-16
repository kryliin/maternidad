
<%@ page import="maternidad.ConceptoProveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoProveedor.label', default: 'ConceptoProveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoProveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'conceptoProveedor.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'conceptoProveedor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'conceptoProveedor.activo.label', default: 'Activo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'conceptoProveedor.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoProveedorInstanceList}" status="i" var="conceptoProveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoProveedorInstance.id}">${fieldValue(bean: conceptoProveedorInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoProveedorInstance, field: "nombre")}</td>
					
						<td><g:formatBoolean boolean="${conceptoProveedorInstance.activo}" /></td>
					
						<td>${fieldValue(bean: conceptoProveedorInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoProveedorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
