<%@ page import="maternidad.Nacimiento" %>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'planillainternacion', 'error')} required">
    <label for="planillainternacion">
        <g:message code="nacimiento.planillainternacion.label" default="Planillainternacion" />
    </label>
    Nº <g:fieldValue bean="${nacimientoInstance?.planillainternacion}" field="id"/>
    <g:hiddenField name="planillainternacion" value="${nacimientoInstance?.planillainternacion?.id}"></g:hiddenField>
</div>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'fecha_hora_parto', 'error')} required">
	<label for="fecha_hora_parto">
		<g:message code="nacimiento.fecha_hora_parto.label" default="Fechahoraparto" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha_hora_parto" precision="minute"  value="${nacimientoInstance?.fecha_hora_parto}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'tipo_parto_id', 'error')} required">
	<label for="tipo_parto_id">
		<g:message code="nacimiento.tipo_parto_id.label" default="Tipopartoid" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo_parto_id" name="tipo_parto_id.id" from="${maternidad.TipoParto.list()}" optionKey="id" required="" value="${nacimientoInstance?.tipo_parto_id?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'peso_bebe', 'error')} required">
	<label for="peso_bebe">
		<g:message code="nacimiento.peso_bebe.label" default="Pesobebe" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="peso_bebe" type="number" value="${nacimientoInstance.peso_bebe}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="nacimiento.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${nacimientoInstance.constraints.sexo.inList}" required="" value="${nacimientoInstance?.sexo}" valueMessagePrefix="nacimiento.sexo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'condicion_al_nacer', 'error')} required">
	<label for="condicion_al_nacer">
		<g:message code="nacimiento.condicion_al_nacer.label" default="Condicionalnacer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="condicion_al_nacer" cols="40" rows="5" maxlength="5000" required="" value="${nacimientoInstance?.condicion_al_nacer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nacimientoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="nacimiento.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${nacimientoInstance?.observaciones}"/>

</div>



