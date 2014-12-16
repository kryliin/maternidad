<table>
    <thead>
    <tr>

        <g:sortableColumn property="fecha" title="${message(code: 'movimientoProfesional.fecha.label', default: 'Fecha')}" />


        <th><g:message code="movimientoProfesional.conceptoPlan.label" default="Concepto Profesional" /></th>



        <th>Ingreso</th>

        <th>Egreso</th>
        <!--
        <g:sortableColumn property="observacion" title="${message(code: 'movimientoProfesional.observacion.label', default: 'Observacion')}" />

        -->

    </tr>
    </thead>
    <tbody>
    <g:each in="${movimientoProfesionalInstanceList}" status="i" var="movimientoProfesionalInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:formatDate date="${movimientoProfesionalInstance.fecha}" /></td>


            <td>${fieldValue(bean: movimientoProfesionalInstance, field: "conceptoProfesional")}</td>



            <td><g:if test="${movimientoProfesionalInstance.credito}">
                ${movimientoProfesionalInstance.monto}
            </g:if></td>

            <td>

                <g:if test="${!movimientoProfesionalInstance.credito}">
                    ${movimientoProfesionalInstance.monto}
                </g:if>

            </td>

            <!--
            <td>${fieldValue(bean: movimientoProfesionalInstance, field: "observacion")}</td>
-->




        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <util:remotePaginate  total="${movimientoProfesionalInstanceCount ?: 0}" update="divprofesional" action="getmovimientosProfesional" pageSizes="[5: '5 por Página',10:'10 por Página',15:'15 por Página']" params="${[idProfesional:idProfesional]}"  />
</div>
<div class="fieldcontain">
    Saldo Total=${total}
</div>