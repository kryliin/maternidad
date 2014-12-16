<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />

        <script>
            $(function() {


                if($("#personaFisica").is(':checked')) {

                    $("#divnombre").addClass("required").show();
                    $("#nombre").attr("required",true);
                    $("#divapellido").addClass("required").show();
                    $("#apellido").attr("required",true);
                    $("#divTipoDocumento").show();
                    $("#divnrodoc").addClass("required").show();

                    $("#nroDocumento").attr("required",true);
                    $("#divestadocivil").show();

                    $("#divrazonsocial").removeClass("required").hide();
                    $("#razonSocial").attr("required",false);
                    $("#divcuit").hide();
                    $("#cuit").attr("required",false);

                } else {
                    $("#divnombre").removeClass("required").hide();
                    $("#nombre").attr("required",false);
                    $("#divapellido").removeClass("required").hide();
                    $("#apellido").attr("required",false);
                    $("#divTipoDocumento").hide();
                    $("#divnrodoc").removeClass("required").hide();
                    $("#nroDocumento").attr("required",false);
                    $("#divestadocivil").hide();

                    $("#divrazonsocial").addClass("required").show();
                    $("#razonSocial").attr("required",true);

                    $("#cuit").attr("required",true);
                    $("#divcuit").addClass("required").show();
                }


                $("#personaFisica").click(function() {
                    if($("#personaFisica").is(':checked')) {

                        $("#divnombre").addClass("required").show();
                        $("#nombre").attr("required",true);
                        $("#divapellido").addClass("required").show();
                        $("#apellido").attr("required",true);
                        $("#divTipoDocumento").show();
                        $("#divnrodoc").addClass("required").show();
                        $("#nroDocumento").attr("required",true);
                        $("#divestadocivil").show();

                        $("#divrazonsocial").hide();
                        $("#razonSocial").attr("required",false);
                        $("#divcuit").hide();
                        $("#cuit").attr("required",false);

                    } else {
                        $("#divnombre").removeClass("required").hide();
                        $("#nombre").attr("required",false);
                        $("#divapellido").removeClass("required").hide();
                        $("#apellido").attr("required",false);
                        $("#divTipoDocumento").hide();
                        $("#divnrodoc").removeClass("required").hide();
                        $("#nroDocumento").attr("required",false);
                        $("#divestadocivil").hide();

                        $("#divrazonsocial").addClass("required").show();
                        $("#razonSocial").attr("required",true);

                        $("#cuit").attr("required",true);
                        $("#divcuit").addClass("required").show();
                    }
                });


                //idioma de los calendar
                jQuery.datepicker.regional[ "es" ];
                updateDatePicker();

                jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                    updateDatePicker();
                });

                $("#banco").select2({allowClear: true});
                $("#persona").select2({allowClear: true});

            })

        </script>

        <title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-profesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-profesional" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profesionalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profesionalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
            <g:hasErrors bean="${personaInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${personaInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
			<g:form url="[resource:profesionalInstance, action:'save']" >
				<fieldset class="form">
                    <g:render  template="/persona/form"/>
						<g:render  template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
