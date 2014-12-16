<%@ page import="maternidad.ConceptoBanco" %>



<div class="fieldcontain ${hasErrors(bean: conceptoBancoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="conceptoBanco.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${conceptoBancoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoBancoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="conceptoBanco.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="35" value="${conceptoBancoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoBancoInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoBanco.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoBancoInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoBancoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="conceptoBanco.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${conceptoBancoInstance?.descripcion}"/>

</div>

