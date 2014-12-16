<%@ page import="maternidad.Cheque" %>



<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="cheque.monto.label" default="Monto" />
		
	</label>
	<g:field name="monto" value="${fieldValue(bean: chequeInstance, field: 'monto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'fechaEmision', 'error')} ">
	<label for="fechaEmision">
		<g:message code="cheque.fechaEmision.label" default="Fecha Emision" />
		
	</label>
	<g:datePicker name="fechaEmision" precision="day"  value="${chequeInstance?.fechaEmision}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'fechaVencimientoCobro', 'error')} ">
	<label for="fechaVencimientoCobro">
		<g:message code="cheque.fechaVencimientoCobro.label" default="Fecha Vencimiento Cobro" />
		
	</label>
	<g:datePicker name="fechaVencimientoCobro" precision="day"  value="${chequeInstance?.fechaVencimientoCobro}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'fechaRealCobro', 'error')} ">
	<label for="fechaRealCobro">
		<g:message code="cheque.fechaRealCobro.label" default="Fecha Real Cobro" />
		
	</label>
	<g:datePicker name="fechaRealCobro" precision="day"  value="${chequeInstance?.fechaRealCobro}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="cheque.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${chequeInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="cheque.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${chequeInstance.numero}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="cheque.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${chequeInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'banco', 'error')} ">
	<label for="banco">
		<g:message code="cheque.banco.label" default="Banco" />
		
	</label>
	<g:select id="banco" name="banco.id" from="${maternidad.Banco.list()}" optionKey="id" value="${chequeInstance?.banco?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

