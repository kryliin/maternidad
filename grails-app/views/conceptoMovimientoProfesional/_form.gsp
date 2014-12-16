<%@ page import="maternidad.ConceptoMovimientoProfesional" %>



<div class="fieldcontain ${hasErrors(bean: conceptoMovimientoProfesionalInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="conceptoMovimientoProfesional.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="10" required="" value="${conceptoMovimientoProfesionalInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoMovimientoProfesionalInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="conceptoMovimientoProfesional.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="35" required="" value="${conceptoMovimientoProfesionalInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoMovimientoProfesionalInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="conceptoMovimientoProfesional.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${conceptoMovimientoProfesionalInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoMovimientoProfesionalInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoMovimientoProfesional.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoMovimientoProfesionalInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoMovimientoProfesionalInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="conceptoMovimientoProfesional.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${maternidad.Usuario.list()}" optionKey="id" required="" value="${conceptoMovimientoProfesionalInstance?.usuario?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoMovimientoProfesionalInstance, field: 'conceptoLiquidacion', 'error')} required">
	<label for="conceptoLiquidacion">
		<g:message code="conceptoMovimientoProfesional.conceptoLiquidacion.label" default="Concepto Liquidacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conceptoLiquidacion" name="conceptoLiquidacion.id" from="${maternidad.ConceptoProfesional.list()}" optionKey="id" required="" value="${conceptoMovimientoProfesionalInstance?.conceptoLiquidacion?.id}" class="many-to-one"/>

</div>

