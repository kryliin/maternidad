<span class="label_input">
    <label>Pagos de factura ${factura}</label>
</span>

<table>
    <thead>
    <tr>
        <th>Numero Comprobante</th>
        <th>Tipo Pago</th>
        <th>Total Pagado</th>
        <th>Total Retencion</th>
        <th>% Liquidado</th>
        <th>% A Liquidar</th>
        <th>Fecha Pago</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${listaPagos}" status="i" var="it">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${it?.numeroComprobante}</td>
            <td>${it?.tipoPago}</td>
            <td>${it?.monto}</td>
            <td>${it?.retencion}</td>
            <td>${it?.porcentajeLiquidado}</td>
            <td>${it?.porcentajeALiquidar}</td>
            <td>${it?.fecha?.format('dd/MM/yyyy')}</td>
        </tr>
    </g:each>
    </tbody>
</table>


<div class="buttons">
    <span class="button">
        <g:form controller="PagoFactura">

            <g:hiddenField name="id" value="${factura?.id}"/>
            <g:actionSubmit controller="PagoFactura"
                            action="create"
                            value="Agregar Pago"
                            class="btn-link"/>
        </g:form>
    </span>

</div>