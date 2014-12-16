package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class NacimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Nacimiento.list(params), model: [nacimientoInstanceCount: Nacimiento.count()]
    }

    def show(Nacimiento nacimientoInstance) {
        respond nacimientoInstance
    }

    def create() {
        //Buscamos la planilla para la cual se asignara el nacimiento
            def planilla = PlanillaInternacion.findById(params?.id)
            //Si la planilla existe, la asignamos al nacimiento
            if(planilla !=null){
            def nacimiento = new Nacimiento()
            nacimiento.properties = params
            nacimiento.planillainternacion = planilla
            //respond new Nacimiento(params)
            respond nacimiento
        }
        //Si la planilla no existe, redireccionamos a crear planilla
        else
            {redirect action: "create", method: "POST", controller: "planillaInternacion"}
    }

    @Transactional
    def save(Nacimiento nacimientoInstance) {
        /*
        //Buscamos la planilla para la cual se asignara el nacimiento
        def planilla = PlanillaInternacion.findById(params?.id)
        //Si la planilla existe, la asignamos al nacimiento
        if(planilla !=null){
            nacimientoInstance.planillainternacion = planilla
        }
        //Si la planilla no existe, redireccionamos a crear planilla
        else
        {   }
        */

        if (nacimientoInstance == null) {
            notFound()
            return
        }

        if (nacimientoInstance.hasErrors()) {
            respond nacimientoInstance.errors, view: 'create'
            return
        }

        nacimientoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nacimiento.label', default: 'Nacimiento'), nacimientoInstance.id])
                redirect nacimientoInstance.planillainternacion
            }
            '*' { respond nacimientoInstance.planillainternacion, [status: CREATED] }
        }
    }

    def edit(Nacimiento nacimientoInstance) {
        respond nacimientoInstance
    }

    @Transactional
    def update(Nacimiento nacimientoInstance) {
        if (nacimientoInstance == null) {
            notFound()
            return
        }

        if (nacimientoInstance.hasErrors()) {
            respond nacimientoInstance.errors, view: 'edit'
            return
        }

        nacimientoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Nacimiento.label', default: 'Nacimiento'), nacimientoInstance.id])
                redirect nacimientoInstance
            }
            '*' { respond nacimientoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Nacimiento nacimientoInstance) {

        if (nacimientoInstance == null) {
            notFound()
            return
        }

        nacimientoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Nacimiento.label', default: 'Nacimiento'), nacimientoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nacimiento.label', default: 'Nacimiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
