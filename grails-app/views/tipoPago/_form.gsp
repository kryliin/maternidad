<%@ page import="maternidad.TipoPago" %>



<<<<<<< HEAD
<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="tipoPago.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${tipoPagoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoPago.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoPagoInstance?.descripcion}"/>
=======
<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="tipoPago.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${tipoPagoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoPago.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoPagoInstance?.descripcion}"/>
>>>>>>> 2cba226065c50e75d4c3d8096e1cbdd4089e23de

</div>

