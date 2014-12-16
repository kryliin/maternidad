<%@ page import="maternidad.ConceptoProveedor" %>



<div class="fieldcontain ${hasErrors(bean: conceptoProveedorInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="conceptoProveedor.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${conceptoProveedorInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProveedorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="conceptoProveedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="35" value="${conceptoProveedorInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProveedorInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoProveedor.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoProveedorInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProveedorInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="conceptoProveedor.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${conceptoProveedorInstance?.descripcion}"/>

</div>

