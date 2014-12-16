<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title><g:message code="planillaInternacion.buscapaciente.label" args="[entityName]"/></title>
    <script>
        $(function() {

            //idioma de los calendar
            jQuery.datepicker.regional[ "es" ];
            updateDatePicker();

            jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                updateDatePicker();
            });

        })

    </script>
</head>

<body>
<a href="#edit-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="planillaInternacion.list.label" args="[entityName]"/></g:link></li>

    </ul>
</div>

<div id="edit-planillaInternacion" class="content scaffold-edit" role="main">
    <h1><g:message code="planillaInternacion.buscarpaciente.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${planillaInternacionInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${planillaInternacionInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: planillaInternacionInstance, action: 'derivarpaciente']" method="PUT">
        <div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'paciente', 'error')} ">
            <label for="paciente">
                <g:message code="planillaInternacion.dnipaciente.label" default="D.N.I. Paciente"/>
            </label>
            <g:textField name="paciente"
                         value="${planillaInternacionInstance?.nombreFamiliarResponsable}" required="required"/>
        </div>
        <fieldset class="buttons">
            <g:actionSubmit class="search" action="derivarpaciente"
                            value="${message(code: 'planillainternacion.button.buscapaciente.label', default: 'Buscar')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
