<div id="list-detalleCaja" class="content scaffold-list" role="main">
    <h1><g:message code="detalleCaja.list.label" args="[entityName]" /></h1>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="fecha" title="${message(code: 'detalleCaja.fecha.label', default: 'Fecha')}" />

            <th><g:message code="detalleCaja.planillainternacion.label" default="Planillainternacion" /></th>

            <th><g:message code="detalleCaja.conceptocaja.label" default="Conceptocaja" /></th>

            <g:sortableColumn property="credito" title="${message(code: 'detalleCaja.credito.label', default: 'Credito')}" />

            <g:sortableColumn property="monto" title="${message(code: 'detalleCaja.monto.label', default: 'Monto')}" />

            <th></th>

            <th></th>


        </tr>
        </thead>
        <tbody>
        <g:each in="${cajaDiariaInstance?.detallesCaja}" status="i" var="detalleCajaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:formatDate date="${detalleCajaInstance.fecha}" type="datetime" style="SHORT" timeStyle="SHORT"/>
                </td>

                <td>${fieldValue(bean: detalleCajaInstance, field: "planillainternacion")}</td>

                <td>${fieldValue(bean: detalleCajaInstance, field: "conceptocaja")}</td>

                <td><g:formatBoolean true="Crédito" false="Débito" boolean="${detalleCajaInstance.credito}" /></td>

                <td>$ ${fieldValue(bean: detalleCajaInstance, field: "monto")}</td>


            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${detalleCajaInstanceCount ?: 0}" />
    </div>
</div>