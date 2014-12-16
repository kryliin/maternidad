<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="buscapaciente"><g:message code="planillaInternacion.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>
<g:render template="lista"/>
</body>
</html>
