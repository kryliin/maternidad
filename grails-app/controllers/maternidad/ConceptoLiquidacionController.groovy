package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional



@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ConceptoLiquidacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoLiquidacion.list(params), model: [conceptoLiquidacionInstanceCount: ConceptoLiquidacion.count()]
    }

    def show(ConceptoLiquidacion conceptoLiquidacionInstance) {
        respond conceptoLiquidacionInstance
    }

    def create() {
        respond new ConceptoLiquidacion(params)
    }

    @Transactional
    def save(ConceptoLiquidacion conceptoLiquidacionInstance) {
        if (conceptoLiquidacionInstance == null) {
            notFound()
            return
        }

        if (conceptoLiquidacionInstance.hasErrors()) {
            respond conceptoLiquidacionInstance.errors, view: 'create'
            return
        }

        conceptoLiquidacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoLiquidacion.label', default: 'ConceptoLiquidacion'), conceptoLiquidacionInstance.id])
                redirect conceptoLiquidacionInstance
            }
            '*' { respond conceptoLiquidacionInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoLiquidacion conceptoLiquidacionInstance) {
        respond conceptoLiquidacionInstance
    }

    @Transactional
    def update(ConceptoLiquidacion conceptoLiquidacionInstance) {
        if (conceptoLiquidacionInstance == null) {
            notFound()
            return
        }

        if (conceptoLiquidacionInstance.hasErrors()) {
            respond conceptoLiquidacionInstance.errors, view: 'edit'
            return
        }

        conceptoLiquidacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoLiquidacion.label', default: 'ConceptoLiquidacion'), conceptoLiquidacionInstance.id])
                redirect conceptoLiquidacionInstance
            }
            '*' { respond conceptoLiquidacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoLiquidacion conceptoLiquidacionInstance) {

        if (conceptoLiquidacionInstance == null) {
            notFound()
            return
        }

        conceptoLiquidacionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoLiquidacion.label', default: 'ConceptoLiquidacion'), conceptoLiquidacionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoLiquidacion.label', default: 'ConceptoLiquidacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
