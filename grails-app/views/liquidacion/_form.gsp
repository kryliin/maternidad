<%@ page import="maternidad.Liquidacion" %>



<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'detallesLiquidacion', 'error')} ">
	<label for="detallesLiquidacion">
		<g:message code="liquidacion.detallesLiquidacion.label" default="Detalles Liquidacion" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${liquidacionInstance?.detallesLiquidacion?}" var="d">
    <li><g:link controller="detalleLiquidacion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleLiquidacion" action="create" params="['liquidacion.id': liquidacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleLiquidacion.label', default: 'DetalleLiquidacion')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="liquidacion.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${liquidacionInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'montoBruto', 'error')} required">
	<label for="montoBruto">
		<g:message code="liquidacion.montoBruto.label" default="Monto Bruto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="montoBruto" value="${fieldValue(bean: liquidacionInstance, field: 'montoBruto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'montoNeto', 'error')} required">
	<label for="montoNeto">
		<g:message code="liquidacion.montoNeto.label" default="Monto Neto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="montoNeto" value="${fieldValue(bean: liquidacionInstance, field: 'montoNeto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'nuemroLiquidacion', 'error')} required">
	<label for="nuemroLiquidacion">
		<g:message code="liquidacion.nuemroLiquidacion.label" default="Nuemro Liquidacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuemroLiquidacion" type="number" value="${liquidacionInstance.nuemroLiquidacion}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'numeroRecibo', 'error')} required">
	<label for="numeroRecibo">
		<g:message code="liquidacion.numeroRecibo.label" default="Numero Recibo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroRecibo" type="number" value="${liquidacionInstance.numeroRecibo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'periodo', 'error')} required">
	<label for="periodo">
		<g:message code="liquidacion.periodo.label" default="Periodo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periodo" type="number" value="${liquidacionInstance.periodo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'profesional', 'error')} required">
	<label for="profesional">
		<g:message code="liquidacion.profesional.label" default="Profesional" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${liquidacionInstance?.profesional?.id}" class="many-to-one"/>

</div>

