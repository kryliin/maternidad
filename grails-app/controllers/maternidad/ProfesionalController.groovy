package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ProfesionalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profesional.list(params), model: [profesionalInstanceCount: Profesional.count()]
    }
    */

    def index = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {
            if (params.dni) {
                persona{
                    eq('nroDocumento',  params.dni as Long)
                }

            }
            if (params.cuit) {
              persona{
                  eq('cuit',  params.cuit as Long)

              }

            }

            if (params.nombre) {
                persona{  or{
                    ilike('nombre', '%' + params.nombre + '%' )
                    ilike('apellido', '%' + params.nombre + '%' )
                }
                }
            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = Profesional.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def profesionales = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [dni: params.dni,cuit:params.cuit,nombre:params.nombre]

        def model = [profesionalInstanceList: profesionales, profesionalInstanceCount:profesionales.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def show(Profesional profesionalInstance) {
        respond profesionalInstance
    }

    def create() {
        //respond new Profesional(params)
        render(view: "create", model: [profesionalInstance: new Profesional(params),personaInstance:new Persona(params)])
    }

    @Transactional
    def save(Profesional profesionalInstance,Persona personaInstance) {
        if (profesionalInstance == null) {
            notFound()
            return
        }

        if (personaInstance == null) {
            notFound()
            return
        }

        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view: 'create'
            return
        }

        personaInstance.save flush: true
        profesionalInstance.persona=personaInstance

        if (profesionalInstance.hasErrors()) {
            respond profesionalInstance.errors, view: 'create'
            return
        }


        profesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'profesional.label', default: 'Profesional'), profesionalInstance.id])
                redirect action:'index'
            }
            '*' { respond profesionalInstance, [status: CREATED],view:'index' }
        }
    }

    def edit(Profesional profesionalInstance) {
     //   respond profesionalInstance
        render(view: "edit", model: [profesionalInstance: profesionalInstance,personaInstance:profesionalInstance?.persona])
    }

    @Transactional
    def update(Profesional profesionalInstance,Persona personaInstance) {
        if (profesionalInstance == null) {
            notFound()
            return
        }


        profesionalInstance.persona.apellido=params?.apellido
        profesionalInstance.persona.calle=params?.calle
        profesionalInstance.persona.codigoPostal=params?.codigoPostal
        profesionalInstance.persona.cuit=(params?.cuit != '')?params?.cuit as Long:null
        profesionalInstance.persona.departamento=params?.departamento
        profesionalInstance.persona?.estadoCivil=(params?.estadoCivil.id!='null')?EstadoCivil.get(params?.estadoCivil.id as Long):null
        profesionalInstance.persona?.localidad=(params?.localidad.id!='null')?Localidad.get(params?.localidad.id as Long):null
        profesionalInstance.persona?.nacionalidad=(params?.nacionalidad.id!='null')?Pais.get(params?.nacionalidad.id as Long):null
        profesionalInstance.persona.nombre=params?.nombre
        profesionalInstance.persona.nroDocumento=params?.nroDocumento as Long
        profesionalInstance.persona.numero=params?.numero
        profesionalInstance.persona.piso=params?.piso
        profesionalInstance.persona.razonSocial=params?.razonSocial
        profesionalInstance.persona?.tipoDocumento=TipoDocumento.get(params?.tipoDocumento.id as Long)

        profesionalInstance.persona.save flush: true
       // profesionalInstance.persona=personaInstance

        if (profesionalInstance.hasErrors()) {
            respond profesionalInstance.errors, view: 'edit'
            return
        }

        profesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Profesional.label', default: 'Profesional'), profesionalInstance.id])
                redirect action:'index'
            }
            '*' { respond profesionalInstance, [status: OK],view:'index' }
        }
    }

    @Transactional
    def delete(Profesional profesionalInstance) {

        if (profesionalInstance == null) {
            notFound()
            return
        }

        profesionalInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profesional.label', default: 'Profesional'), profesionalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesional.label', default: 'Profesional'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }










}
