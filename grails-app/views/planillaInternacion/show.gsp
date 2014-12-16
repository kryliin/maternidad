<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="planillaInternacion.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="list" action="create" controller="nacimiento" id="${planillaInternacionInstance?.id}"><g:message code="nacimiento.edit.label" args="[entityName]"/></g:link></li>

    </ul>
</div>

<div id="show-planillaInternacion" class="content scaffold-show" role="main">
    <h1><g:message code="planillaInternacion.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list planillaInternacion">

        <g:if test="${planillaInternacionInstance?.paciente}">
            <li class="fieldcontain">
                <span id="paciente-label" class="property-label"><g:message code="planillaInternacion.paciente.label"
                                                                            default="Paciente"/></span>
                <span class="property-value" aria-labelledby="paciente-label">${planillaInternacionInstance?.paciente?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.plan}">
            <li class="fieldcontain">
                <span id="plan-label" class="property-label"><g:message code="planillaInternacion.plan.label"
                                                                        default="Plan"/></span>

                <span class="property-value" aria-labelledby="plan-label">
                    ${planillaInternacionInstance?.plan?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.fechaInternacion}">
            <li class="fieldcontain">
                <span id="fechaInternacion-label" class="property-label"><g:message
                        code="planillaInternacion.fechaInternacion.label" default="Fecha Internacion"/></span>

                <span class="property-value" aria-labelledby="fechaInternacion-label"><g:formatDate style="LONG" type="date"
                        date="${planillaInternacionInstance?.fechaInternacion}"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.nombreFamiliarResponsable}">
            <li class="fieldcontain">
                <span id="nombreFamiliarResponsable-label" class="property-label"><g:message
                        code="planillaInternacion.nombreFamiliarResponsable.label"
                        default="Nombre Familiar Responsable"/></span>

                <span class="property-value" aria-labelledby="nombreFamiliarResponsable-label"><g:fieldValue
                        bean="${planillaInternacionInstance}" field="nombreFamiliarResponsable"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.telefonoFamiliarResponsable}">
            <li class="fieldcontain">
                <span id="telefonoFamiliarResponsable-label" class="property-label"><g:message
                        code="planillaInternacion.telefonoFamiliarResponsable.label"
                        default="Telefono Familiar Responsable"/></span>

                <span class="property-value" aria-labelledby="telefonoFamiliarResponsable-label"><g:fieldValue
                        bean="${planillaInternacionInstance}" field="telefonoFamiliarResponsable"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.fechaAlta}">
            <li class="fieldcontain">
                <span id="fechaAlta-label" class="property-label"><g:message code="planillaInternacion.fechaAlta.label"
                                                                             default="Fecha Alta"/></span>

                <span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate  style="LONG" type="date"
                        date="${planillaInternacionInstance?.fechaAlta}"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.observaciones}">
            <li class="fieldcontain">
                <span id="observaciones-label" class="property-label"><g:message
                        code="planillaInternacion.observaciones.label" default="Observaciones"/></span>

                <span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue
                        bean="${planillaInternacionInstance}" field="observaciones"/></span>

            </li>
        </g:if>

    </ol>
    <!-- Listado de Nacimientos -->
    <g:if test="${planillaInternacionInstance?.nacimientos}">
        <fieldset class="form">
            <g:render template="nacimientos" />
        </fieldset>
    </g:if>
    <g:form url="[resource: planillaInternacionInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${planillaInternacionInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <!--
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            -->
        </fieldset>
    </g:form>
</div>
</body>
</html>
