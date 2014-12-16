package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ConceptoProveedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoProveedor.list(params), model: [conceptoProveedorInstanceCount: ConceptoProveedor.count()]
    }

    def show(ConceptoProveedor conceptoProveedorInstance) {
        respond conceptoProveedorInstance
    }

    def create() {
        respond new ConceptoProveedor(params)
    }

    @Transactional
    def save(ConceptoProveedor conceptoProveedorInstance) {
        if (conceptoProveedorInstance == null) {
            notFound()
            return
        }

        if (conceptoProveedorInstance.hasErrors()) {
            respond conceptoProveedorInstance.errors, view: 'create'
            return
        }

        conceptoProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoProveedor.label', default: 'ConceptoProveedor'), conceptoProveedorInstance.id])
                redirect conceptoProveedorInstance
            }
            '*' { respond conceptoProveedorInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoProveedor conceptoProveedorInstance) {
        respond conceptoProveedorInstance
    }

    @Transactional
    def update(ConceptoProveedor conceptoProveedorInstance) {
        if (conceptoProveedorInstance == null) {
            notFound()
            return
        }

        if (conceptoProveedorInstance.hasErrors()) {
            respond conceptoProveedorInstance.errors, view: 'edit'
            return
        }

        conceptoProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoProveedor.label', default: 'ConceptoProveedor'), conceptoProveedorInstance.id])
                redirect conceptoProveedorInstance
            }
            '*' { respond conceptoProveedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoProveedor conceptoProveedorInstance) {

        if (conceptoProveedorInstance == null) {
            notFound()
            return
        }

        conceptoProveedorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoProveedor.label', default: 'ConceptoProveedor'), conceptoProveedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoProveedor.label', default: 'ConceptoProveedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
