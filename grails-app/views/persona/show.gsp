
<%@ page import="maternidad.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-persona" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list persona">
			
				<g:if test="${personaInstance?.cuit}">
				<li class="fieldcontain">
					<span id="cuit-label" class="property-label"><g:message code="persona.cuit.label" default="Cuit" /></span>
					
						<span class="property-value" aria-labelledby="cuit-label"><g:fieldValue bean="${personaInstance}" field="cuit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="persona.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${personaInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.razonSocial}">
				<li class="fieldcontain">
					<span id="razonSocial-label" class="property-label"><g:message code="persona.razonSocial.label" default="Razon Social" /></span>
					
						<span class="property-value" aria-labelledby="razonSocial-label"><g:fieldValue bean="${personaInstance}" field="razonSocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.tipoDocumento}">
				<li class="fieldcontain">
					<span id="tipoDocumento-label" class="property-label"><g:message code="persona.tipoDocumento.label" default="Tipo Documento" /></span>
					
						<span class="property-value" aria-labelledby="tipoDocumento-label"><g:link controller="tipoDocumento" action="show" id="${personaInstance?.tipoDocumento?.id}">${personaInstance?.tipoDocumento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nroDocumento}">
				<li class="fieldcontain">
					<span id="nroDocumento-label" class="property-label"><g:message code="persona.nroDocumento.label" default="Nro Documento" /></span>
					
						<span class="property-value" aria-labelledby="nroDocumento-label"><g:fieldValue bean="${personaInstance}" field="nroDocumento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nacionalidad}">
				<li class="fieldcontain">
					<span id="nacionalidad-label" class="property-label"><g:message code="persona.nacionalidad.label" default="Nacionalidad" /></span>
					
						<span class="property-value" aria-labelledby="nacionalidad-label"><g:link controller="pais" action="show" id="${personaInstance?.nacionalidad?.id}">${personaInstance?.nacionalidad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="persona.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${personaInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.piso}">
				<li class="fieldcontain">
					<span id="piso-label" class="property-label"><g:message code="persona.piso.label" default="Piso" /></span>
					
						<span class="property-value" aria-labelledby="piso-label"><g:fieldValue bean="${personaInstance}" field="piso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.departamento}">
				<li class="fieldcontain">
					<span id="departamento-label" class="property-label"><g:message code="persona.departamento.label" default="Departamento" /></span>
					
						<span class="property-value" aria-labelledby="departamento-label"><g:fieldValue bean="${personaInstance}" field="departamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="persona.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${personaInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.localidad}">
				<li class="fieldcontain">
					<span id="localidad-label" class="property-label"><g:message code="persona.localidad.label" default="Localidad" /></span>
					
						<span class="property-value" aria-labelledby="localidad-label"><g:link controller="localidad" action="show" id="${personaInstance?.localidad?.id}">${personaInstance?.localidad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.estadoCivil}">
				<li class="fieldcontain">
					<span id="estadoCivil-label" class="property-label"><g:message code="persona.estadoCivil.label" default="Estado Civil" /></span>
					
						<span class="property-value" aria-labelledby="estadoCivil-label"><g:link controller="estadoCivil" action="show" id="${personaInstance?.estadoCivil?.id}">${personaInstance?.estadoCivil?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="persona.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${personaInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.personaFisica}">
				<li class="fieldcontain">
					<span id="personaFisica-label" class="property-label"><g:message code="persona.personaFisica.label" default="Persona Fisica" /></span>
					
						<span class="property-value" aria-labelledby="personaFisica-label"><g:formatBoolean boolean="${personaInstance?.personaFisica}" /></span>
					
				</li>
				</g:if>




			</ol>
			<g:form url="[resource:personaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
