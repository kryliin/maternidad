<div id="list-nacimiento" class="content scaffold-list" role="main">
    <h1><g:message code="nacimiento.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="fecha_hora_parto" title="${message(code: 'nacimiento.fecha_hora_parto.label', default: 'Fechahoraparto')}" />

            <th><g:message code="nacimiento.tipo_parto_id.label" default="Tipopartoid" /></th>

            <g:sortableColumn property="peso_bebe" title="${message(code: 'nacimiento.peso_bebe.label', default: 'Pesobebe')}" />

            <g:sortableColumn property="sexo" title="${message(code: 'nacimiento.sexo.label', default: 'Sexo')}" />


        </tr>
        </thead>
        <tbody>
        <g:each in="${nacimientoInstanceList}" status="i" var="nacimientoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:formatDate date="${nacimientoInstance.fecha_hora_parto}" type="datetime" style="SHORT" timeStyle="SHORT"/>
                </td>

                <td>${fieldValue(bean: nacimientoInstance, field: "tipo_parto_id")}</td>

                <td>${fieldValue(bean: nacimientoInstance, field: "peso_bebe")}</td>

                <td>${fieldValue(bean: nacimientoInstance, field: "sexo")}</td>

                <!-- ACCIONES -->
                <td><g:link class="linkShow" action="show" id="${nacimientoInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

                <td><g:link class="linkEdit" action="edit" id="${nacimientoInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${nacimientoInstanceCount ?: 0}" />
    </div>
</div>