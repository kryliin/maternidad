
<%@ page import="maternidad.MovimientoProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimientoProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimientoProfesional" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'movimientoProfesional.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="movimientoProfesional.profesional.label" default="Profesional" /></th>
					
						<th><g:message code="movimientoProfesional.conceptoProfesional.label" default="Concepto Profesional" /></th>
					
						<g:sortableColumn property="credito" title="${message(code: 'movimientoProfesional.credito.label', default: 'Credito')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'movimientoProfesional.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="observacion" title="${message(code: 'movimientoProfesional.observacion.label', default: 'Observacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${movimientoProfesionalInstanceList}" status="i" var="movimientoProfesionalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${movimientoProfesionalInstance.id}">${fieldValue(bean: movimientoProfesionalInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: movimientoProfesionalInstance, field: "profesional")}</td>
					
						<td>${fieldValue(bean: movimientoProfesionalInstance, field: "conceptoProfesional")}</td>
					
						<td><g:formatBoolean boolean="${movimientoProfesionalInstance.credito}" /></td>
					
						<td>${fieldValue(bean: movimientoProfesionalInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: movimientoProfesionalInstance, field: "observacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoProfesionalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
