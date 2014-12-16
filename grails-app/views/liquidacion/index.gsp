
<%@ page import="maternidad.Liquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'liquidacion.label', default: 'Liquidacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-liquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-liquidacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'liquidacion.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="montoBruto" title="${message(code: 'liquidacion.montoBruto.label', default: 'Monto Bruto')}" />
					
						<g:sortableColumn property="montoNeto" title="${message(code: 'liquidacion.montoNeto.label', default: 'Monto Neto')}" />
					
						<g:sortableColumn property="nuemroLiquidacion" title="${message(code: 'liquidacion.nuemroLiquidacion.label', default: 'Nuemro Liquidacion')}" />
					
						<g:sortableColumn property="numeroRecibo" title="${message(code: 'liquidacion.numeroRecibo.label', default: 'Numero Recibo')}" />
					
						<g:sortableColumn property="periodo" title="${message(code: 'liquidacion.periodo.label', default: 'Periodo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${liquidacionInstanceList}" status="i" var="liquidacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${liquidacionInstance.id}">${fieldValue(bean: liquidacionInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "montoBruto")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "montoNeto")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "nuemroLiquidacion")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "numeroRecibo")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "periodo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${liquidacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
