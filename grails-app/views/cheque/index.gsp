
<%@ page import="maternidad.Cheque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cheque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cheque" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="monto" title="${message(code: 'cheque.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="fechaEmision" title="${message(code: 'cheque.fechaEmision.label', default: 'Fecha Emision')}" />
					
						<g:sortableColumn property="fechaVencimientoCobro" title="${message(code: 'cheque.fechaVencimientoCobro.label', default: 'Fecha Vencimiento Cobro')}" />
					
						<g:sortableColumn property="fechaRealCobro" title="${message(code: 'cheque.fechaRealCobro.label', default: 'Fecha Real Cobro')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'cheque.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'cheque.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chequeInstanceList}" status="i" var="chequeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chequeInstance.id}">${fieldValue(bean: chequeInstance, field: "monto")}</g:link></td>
					
						<td><g:formatDate date="${chequeInstance.fechaEmision}" /></td>
					
						<td><g:formatDate date="${chequeInstance.fechaVencimientoCobro}" /></td>
					
						<td><g:formatDate date="${chequeInstance.fechaRealCobro}" /></td>
					
						<td>${fieldValue(bean: chequeInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chequeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
