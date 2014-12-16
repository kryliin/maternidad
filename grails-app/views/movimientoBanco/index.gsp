
<%@ page import="maternidad.MovimientoBanco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoBanco.label', default: 'MovimientoBanco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimientoBanco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimientoBanco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="monto" title="${message(code: 'movimientoBanco.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'movimientoBanco.fecha.label', default: 'Fecha')}" />
					

					
						<th><g:message code="movimientoBanco.cheque.label" default="Cheque" /></th>
					
						<g:sortableColumn property="numeroTransferencia" title="${message(code: 'movimientoBanco.numeroTransferencia.label', default: 'Numero Transferencia')}" />
					
<th></th>
                        <th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${movimientoBancoInstanceList}" status="i" var="movimientoBancoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: movimientoBancoInstance, field: "monto")}</td>
					
						<td><g:formatDate date="${movimientoBancoInstance.fecha}" /></td>
					

					
						<td>${fieldValue(bean: movimientoBancoInstance, field: "cheque")}</td>
					
						<td>${fieldValue(bean: movimientoBancoInstance, field: "numeroTransferencia")}</td>

                        <td><g:link class="linkEdit" action="edit" id="${movimientoBancoInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                        <td><g:link class="linkShow" action="show" id="${movimientoBancoInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoBancoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
