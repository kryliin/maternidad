<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor')}" />

        <script>
            $(function() {

                //idioma de los calendar
                jQuery.datepicker.regional[ "es" ];
                updateDatePicker();

                jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                    updateDatePicker();
                });

          //        $("#cheque").select2({allowClear: true});
                $("#facturaProveedor").select2({allowClear: true});

/*
                $("#divcheque").hide();
                $("#divcuentatransferencia").hide();
                $("#divnrotransferencia").hide();

                var seleccionado=$('#tipoPago').find("option:selected").text();

                if (seleccionado.toUpperCase()=='cheque'.toUpperCase()){

                    $("#divcheque").show();
                    $("#divcuentatransferencia").hide();
                    $("#divnrotransferencia").hide();
                }

                if (seleccionado.toUpperCase()=='transferencia'.toUpperCase()){
                    $("#divcuentatransferencia").show();
                    $("#divnrotransferencia").show();
                    $("#divcheque").hide();
                }


                $('#tipoPago').on('change', function() {
                    var seleccionado=$(this).find("option:selected").text();

                    if (seleccionado.toUpperCase()=='cheque'.toUpperCase()){

                        $("#divcheque").show();
                        $("#divcuentatransferencia").hide();
                        $("#divnrotransferencia").hide();
                    }

                    if (seleccionado.toUpperCase()=='transferencia'.toUpperCase()){
                        $("#divcuentatransferencia").show();
                        $("#divnrotransferencia").show();
                        $("#divcheque").hide();
                    }

                });
  */

            })

        </script>

        <title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-movimientoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-movimientoProveedor" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${movimientoProveedorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${movimientoProveedorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:movimientoProveedorInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>