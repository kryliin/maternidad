
<%@ page import="maternidad.ConceptoBanco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoBanco.label', default: 'ConceptoBanco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoBanco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoBanco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'conceptoBanco.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'conceptoBanco.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'conceptoBanco.activo.label', default: 'Activo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'conceptoBanco.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoBancoInstanceList}" status="i" var="conceptoBancoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoBancoInstance.id}">${fieldValue(bean: conceptoBancoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoBancoInstance, field: "nombre")}</td>
					
						<td><g:formatBoolean boolean="${conceptoBancoInstance.activo}" /></td>
					
						<td>${fieldValue(bean: conceptoBancoInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoBancoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
