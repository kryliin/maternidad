package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ConceptoMovimientoProfesionalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoMovimientoProfesional.list(params), model: [conceptoMovimientoProfesionalInstanceCount: ConceptoMovimientoProfesional.count()]
    }

    def show(ConceptoMovimientoProfesional conceptoMovimientoProfesionalInstance) {
        respond conceptoMovimientoProfesionalInstance
    }

    def create() {
        respond new ConceptoMovimientoProfesional(params)
    }

    @Transactional
    def save(ConceptoMovimientoProfesional conceptoMovimientoProfesionalInstance) {
        if (conceptoMovimientoProfesionalInstance == null) {
            notFound()
            return
        }

        if (conceptoMovimientoProfesionalInstance.hasErrors()) {
            respond conceptoMovimientoProfesionalInstance.errors, view: 'create'
            return
        }

        conceptoMovimientoProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoMovimientoProfesional.label', default: 'ConceptoMovimientoProfesional'), conceptoMovimientoProfesionalInstance.id])
                redirect conceptoMovimientoProfesionalInstance
            }
            '*' { respond conceptoMovimientoProfesionalInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoMovimientoProfesional conceptoMovimientoProfesionalInstance) {
        respond conceptoMovimientoProfesionalInstance
    }

    @Transactional
    def update(ConceptoMovimientoProfesional conceptoMovimientoProfesionalInstance) {
        if (conceptoMovimientoProfesionalInstance == null) {
            notFound()
            return
        }

        if (conceptoMovimientoProfesionalInstance.hasErrors()) {
            respond conceptoMovimientoProfesionalInstance.errors, view: 'edit'
            return
        }

        conceptoMovimientoProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoMovimientoProfesional.label', default: 'ConceptoMovimientoProfesional'), conceptoMovimientoProfesionalInstance.id])
                redirect conceptoMovimientoProfesionalInstance
            }
            '*' { respond conceptoMovimientoProfesionalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoMovimientoProfesional conceptoMovimientoProfesionalInstance) {

        if (conceptoMovimientoProfesionalInstance == null) {
            notFound()
            return
        }

        conceptoMovimientoProfesionalInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoMovimientoProfesional.label', default: 'ConceptoMovimientoProfesional'), conceptoMovimientoProfesionalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoMovimientoProfesional.label', default: 'ConceptoMovimientoProfesional'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
