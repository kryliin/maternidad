<%@ page import="maternidad.PlanillaInternacion" %>


<g:if test="${planillaInternacionInstance?.paciente?.id != null}">
<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'paciente', 'error')} ">
    <label for="paciente">
        <g:message code="planillaInternacion.paciente.label" default="Paciente"/>

    </label>
    <g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="apellido"/>,
    <g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="nombre"/>
    <g:hiddenField name="paciente" value="${planillaInternacionInstance?.paciente?.id}"></g:hiddenField>
    <!--
    <g:select id="paciente" name="paciente.id" from="${maternidad.Persona.list()}" optionKey="id"
              value="${planillaInternacionInstance?.paciente?.id}" class="many-to-one" noSelection="['null': '']"/>
    -->
</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'plan', 'error')} required">
    <label for="plan">
        <g:message code="planillaInternacion.plan.label" default="Plan"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required=""
              value="${planillaInternacionInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'fechaInternacion', 'error')} required">
    <label for="fechaInternacion">
        <g:message code="planillaInternacion.fechaInternacion.label" default="Fecha Internacion"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaInternacion" precision="day" value="${planillaInternacionInstance?.fechaInternacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'nombreFamiliarResponsable', 'error')} required">
    <label for="nombreFamiliarResponsable">
        <g:message code="planillaInternacion.nombreFamiliarResponsable.label" default="Nombre Familiar Responsable"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombreFamiliarResponsable" required=""
                 value="${planillaInternacionInstance?.nombreFamiliarResponsable}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'telefonoFamiliarResponsable', 'error')} required">
    <label for="telefonoFamiliarResponsable">
        <g:message code="planillaInternacion.telefonoFamiliarResponsable.label"
                   default="Telefono Familiar Responsable"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="telefonoFamiliarResponsable" required=""
                 value="${planillaInternacionInstance?.telefonoFamiliarResponsable}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'fechaAlta', 'error')} required">
    <label for="fechaAlta">
        <g:message code="planillaInternacion.fechaAlta.label" default="Fecha Alta"/>

    </label>
    <g:datePicker name="fechaAlta" precision="day" value="${planillaInternacionInstance?.fechaAlta}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'observaciones', 'error')} required">
    <label for="observaciones">
        <g:message code="planillaInternacion.observaciones.label" default="Observaciones"/>

    </label>
    <g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${planillaInternacionInstance?.observaciones}"/>

</div>

