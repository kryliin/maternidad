<%@ page import="maternidad.MovimientoProveedor" %>



<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="movimientoProveedor.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${maternidad.Proveedor.list()}" optionKey="id" required="" value="${movimientoProveedorInstance?.proveedor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="movimientoProveedor.monto.label" default="Monto" />
		
	</label>
	<g:field name="monto" value="${fieldValue(bean: movimientoProveedorInstance, field: 'monto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="movimientoProveedor.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${movimientoProveedorInstance?.fecha}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="movimientoProveedor.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${movimientoProveedorInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'facturaProveedor', 'error')} ">
	<label for="facturaProveedor">
		<g:message code="movimientoProveedor.facturaProveedor.label" default="Factura Proveedor" />
		
	</label>
	<g:select id="facturaProveedor" name="facturaProveedor.id" from="${maternidad.FacturaProveedor.list()}" optionKey="id" value="${movimientoProveedorInstance?.facturaProveedor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'tipoPago', 'error')} required">
	<label for="tipoPago">
		<g:message code="movimientoProveedor.tipoPago.label" default="Tipo Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPago" name="tipoPago.id" from="${maternidad.TipoPago.list()}" optionKey="id" required="" value="${movimientoProveedorInstance?.tipoPago?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'conceptoProveedor', 'error')} required">
	<label for="conceptoProveedor">
		<g:message code="movimientoProveedor.conceptoProveedor.label" default="Concepto Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conceptoProveedor" name="conceptoProveedor.id" from="${maternidad.ConceptoProveedor.list()}" optionKey="id" required="" value="${movimientoProveedorInstance?.conceptoProveedor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'banco', 'error')} ">
	<label for="banco">
		<g:message code="movimientoProveedor.banco.label" default="Banco" />
		
	</label>
	<g:select id="banco" name="banco.id" from="${maternidad.Banco.list()}" optionKey="id" value="${movimientoProveedorInstance?.banco?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProveedorInstance, field: 'credito', 'error')} ">
	<label for="credito">
		<g:message code="movimientoProveedor.credito.label" default="Credito" />
		
	</label>
    <g:radio name="credito" value="true" checked="true" />

    <label for="credito">
        <g:message code="movimientoProveedor.credito.label" default="Débito" />

    </label>
 <g:radio name="credito" value="false" />


</div>

