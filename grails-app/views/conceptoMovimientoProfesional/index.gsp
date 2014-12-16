
<%@ page import="maternidad.ConceptoMovimientoProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoMovimientoProfesional.label', default: 'ConceptoMovimientoProfesional')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoMovimientoProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoMovimientoProfesional" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'conceptoMovimientoProfesional.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'conceptoMovimientoProfesional.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'conceptoMovimientoProfesional.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'conceptoMovimientoProfesional.activo.label', default: 'Activo')}" />
					
						<th><g:message code="conceptoMovimientoProfesional.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="conceptoMovimientoProfesional.conceptoLiquidacion.label" default="Concepto Liquidacion" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoMovimientoProfesionalInstanceList}" status="i" var="conceptoMovimientoProfesionalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoMovimientoProfesionalInstance.id}">${fieldValue(bean: conceptoMovimientoProfesionalInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoMovimientoProfesionalInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: conceptoMovimientoProfesionalInstance, field: "descripcion")}</td>
					
						<td><g:formatBoolean boolean="${conceptoMovimientoProfesionalInstance.activo}" /></td>
					
						<td>${fieldValue(bean: conceptoMovimientoProfesionalInstance, field: "usuario")}</td>
					
						<td>${fieldValue(bean: conceptoMovimientoProfesionalInstance, field: "conceptoLiquidacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoMovimientoProfesionalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
