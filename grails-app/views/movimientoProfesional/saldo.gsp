<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-movimientoProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
      <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-movimientoProfesional" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>

    <fieldset class="form">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="profesional">Profesional</label>
                </td>
                <td valign="top" class="value ">
                    <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" noSelection="['null':'Seleccione un Profesional']"
                              onchange="${remoteFunction(controller: 'movimientoProfesional',
                                      action: 'getmovimientosProfesional',
                                      params: '\'idProfesional=\' + this.value',
                                      update: 'divpprofesional')}"
                    />
                </td>
            </tr>
            <tr class="prop">
                <td></td>
                <td><div id="divpprofesional">
                    <g:render  template="/movimientoProfesional/movimientos"
                               model="[movimientoProfesionalInstanceList: movimientos, movimientoProfesionalInstanceCount: movimientos?.size(), total: total]"    />
                </div>
                </td>
            </tr>



            </tbody>
        </table>
    </fieldset>


</div>
</body>
</html>