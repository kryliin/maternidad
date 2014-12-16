<%@ page import="maternidad.MovimientoProfesional" %>

<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'profesional', 'error')} required">
    <label for="profesional">
        <g:message code="movimientoProfesional.profesional.label" default="Profesional" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${movimientoProfesionalInstance?.profesional?.id}" class="many-to-one"/>

</div>



<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'conceptoProfesional', 'error')} ">
    <label for="conceptoProfesional">
        <g:message code="movimientoProfesional.conceptoProfesional.label" default="Concepto Profesional" />

    </label>
    <g:select id="conceptoProfesional" name="conceptoProfesional.id" from="${maternidad.ConceptoMovimientoProfesional.list()}" optionKey="id" value="${movimientoProfesionalInstance?.conceptoProfesional?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="movimientoProfesional.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" format="dd-MM-yyyy" precision="day"  value="${movimientoProfesionalInstance?.fecha}"  />

</div>


<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'credito', 'error')} ">
    <label for="ingreso">
        <g:message code="movimientoProfesional.credito.label" default="Credito" />
    </label>
    <g:radio name="credito" value="true" checked="true" />
    <label for="ingreso">
        <g:message code="movimientoProfesional.credito.label" default="Debito" />
    </label><g:radio name="credito" value="false" />
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="movimientoProfesional.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="monto" name="monto" value="${fieldValue(bean: movimientoProfesionalInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="movimientoProfesional.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${movimientoProfesionalInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoProfesionalInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="movimientoProfesional.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${maternidad.Usuario.list()}" optionKey="id" value="${movimientoProfesionalInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<g:if test="params.id">
    <script>
        $(function() {

            $('#profesional').change(function(e){

                $("#profesional").val('${params.id}');
                $("#profesional").prop("disabled", true);
                // $("#filaoculta").hide();
            });

            // And now fire change event when the DOM is ready
            $('#profesional').trigger('change');


        })
    </script>

</g:if>