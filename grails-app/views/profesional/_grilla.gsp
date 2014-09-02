<table class="ajax">
    <thead>
    <tr>

        <th><g:message code="profesional.persona.label" default="Persona" params="${filters}" /></th>



        <g:sortableColumn property="matriculaProvincial" title="${message(code: 'profesional.matriculaProvincial.label', default: 'Matricula Provincial')}" params="${filters}" />

        <th><g:message code="persona.nroDocumento.label" default="Nº Documento" params="${filters}" /></th>

        <th><g:message code="persona.cuit.label" default="Cuit" params="${filters}" /></th>

        <th><g:message code="profesional.banco.label" default="Banco" params="${filters}" /></th>

        <g:sortableColumn property="activo" title="${message(code: 'profesional.activo.label', default: 'Activo')}" params="${filters}" />

        <th>Conceptos Del Profesional</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${profesionalInstanceList}" status="i" var="profesionalInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${profesionalInstance.id}">${fieldValue(bean: profesionalInstance, field: "persona")}</g:link></td>



            <td>${fieldValue(bean: profesionalInstance, field: "matriculaProvincial")}</td>

            <td>${profesionalInstance.persona.nroDocumento} </td>

            <td>${profesionalInstance.persona.cuit}</td>

            <td>${fieldValue(bean: profesionalInstance, field: "banco")}</td>

            <td><g:formatBoolean boolean="${profesionalInstance.activo}" /></td>

            <td><g:link controller="conceptoPorProfesional" action="create" id="${profesionalInstance?.id}" >Conceptos</g:link> </td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${profesionalInstanceCount ?: 0}" params="${filters}" />
</div>