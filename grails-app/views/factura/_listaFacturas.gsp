<span class="label_input">
    <label>Facturas adeudadas de ${obrasocialNombre}</label>
</span>

<table>
    <thead>
    <tr>
        <th>Numero/Periodo</th>
        <th>Plan</th>
        <th>Total Facturado</th>

        <th>Total Pagado</th>
        <th>Saldo</th>
        <th>Fecha de Cobro</th>
        <th>Pagos</th>

    </tr>
    </thead>

    <tbody>
    <g:each in="${listaFacturasSinPagar}" status="i" var="item">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td>${item?.nrofactura} - ${item?.periodo}</td>
            <td>${item?.plan}</td>
            <td>${item?.totalFacturado}</td>
            <td>${item?.totalPagado}</td>
            <td>${item?.totalFacturado - item?.totalPagado}</td>
            <td>${item?.fecha?.format('dd/MM/yyyy')}</td>
            <td>

                <g:set var="pagos" value="${item?.pagosFactura?.size()}"/>
                <g:if test="${pagos > 0}">
                    <g:form controller="factura">
                        <g:hiddenField name="id" value="${item?.id}"/>
                        <g:submitToRemote
                                url="[controller: 'Factura', action: 'verPagos']"
                                id="verPagos" class="btn-link"
                                value="Ver Pagos" update="remotoDivListaPagos"/>
                    </g:form>
                </g:if>


                <g:else>
                    <g:form controller="PagoFactura">
                        <g:hiddenField name="id" value="${item?.id}"/>
                        <g:actionSubmit controller="PagoFactura"
                                        action="create"
                                        value="Agregar Pago"
                                        class="btn-link"/>
                    </g:form>
                </g:else>

            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="list" id="remotoDivListaPagos">
    <g:render template="listaPagos"
              model="['listaPagos': listaPagos, 'factura': factura]"/>

</div>


