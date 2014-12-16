
<%@ page import="maternidad.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="Factura" action="abrirPagarFactura"><g:message code="default.new.pagoFactura" default="Pagar Facturas Por Obra Social" args="pagarFacturasPorObraSocial" /></g:link></li>
            </ul>

        </div>
		<div id="list-factura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="anulada" title="${message(code: 'factura.anulada.label', default: 'Anulada')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'factura.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="nrofactura" title="${message(code: 'factura.nrofactura.label', default: 'Nrofactura')}" />
					
						<g:sortableColumn property="pagoCompleto" title="${message(code: 'factura.pagoCompleto.label', default: 'Pago Completo')}" />
					
						<g:sortableColumn property="periodo" title="${message(code: 'factura.periodo.label', default: 'Periodo')}" />
					
						<th><g:message code="factura.plan.label" default="Plan" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${facturaInstance.id}">${fieldValue(bean: facturaInstance, field: "anulada")}</g:link></td>
					
						<td><g:formatDate date="${facturaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: facturaInstance, field: "nrofactura")}</td>
					
						<td><g:formatBoolean boolean="${facturaInstance.pagoCompleto}" /></td>
					
						<td>${fieldValue(bean: facturaInstance, field: "periodo")}</td>
					
						<td>${fieldValue(bean: facturaInstance, field: "plan")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${facturaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
