<%@ page import="maternidad.FacturaProveedor" %>

<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'proveedor', 'error')} required">
    <label for="proveedor">
        <g:message code="facturaProveedor.proveedor.label" default="Proveedor" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="proveedor" name="proveedor.id" from="${maternidad.Proveedor.list()}" optionKey="id" required="" value="${facturaProveedorInstance?.proveedor?.id}" class="many-to-one"/>

</div>


<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'numero', 'error')} required">
    <label for="numero">
        <g:message code="facturaProveedor.numero.label" default="Numero" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="numero" required="" value="${facturaProveedorInstance?.numero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="facturaProveedor.monto.label" default="Monto" />
		
	</label>
	<g:field name="monto" value="${fieldValue(bean: facturaProveedorInstance, field: 'monto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'fechaEmision', 'error')} ">
	<label for="fechaEmision">
		<g:message code="facturaProveedor.fechaEmision.label" default="Fecha Emision" />
		
	</label>
	<g:datePicker name="fechaEmision" precision="day"  value="${facturaProveedorInstance?.fechaEmision}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'fechaVencimientoPago', 'error')} ">
	<label for="fechaVencimientoPago">
		<g:message code="facturaProveedor.fechaVencimientoPago.label" default="Fecha Vencimiento Pago" />
		
	</label>
	<g:datePicker name="fechaVencimientoPago" precision="day"  value="${facturaProveedorInstance?.fechaVencimientoPago}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'fechaRealPago', 'error')} ">
	<label for="fechaRealPago">
		<g:message code="facturaProveedor.fechaRealPago.label" default="Fecha Real Pago" />
		
	</label>
	<g:datePicker name="fechaRealPago" precision="day"  value="${facturaProveedorInstance?.fechaRealPago}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="facturaProveedor.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${facturaProveedorInstance?.descripcion}"/>

</div>




<div class="fieldcontain ${hasErrors(bean: facturaProveedorInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="facturaProveedor.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${facturaProveedorInstance?.activo}" />

</div>

