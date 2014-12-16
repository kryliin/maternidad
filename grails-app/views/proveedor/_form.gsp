<%@ page import="maternidad.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'cuit', 'error')} ">
	<label for="cuit">
		<g:message code="proveedor.cuit.label" default="Cuit" />
		
	</label>
	<g:field name="cuit" type="number" value="${proveedorInstance.cuit}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${proveedorInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="proveedor.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${proveedorInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="proveedor.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${proveedorInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="proveedor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${proveedorInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'localidad', 'error')} ">
	<label for="localidad">
		<g:message code="proveedor.localidad.label" default="Localidad" />
		
	</label>
	<g:select id="localidad" name="localidad.id" from="${maternidad.Localidad.list()}" optionKey="id" value="${proveedorInstance?.localidad?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="proveedor.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${proveedorInstance?.activo}" />

</div>

