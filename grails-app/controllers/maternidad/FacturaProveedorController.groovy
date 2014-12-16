package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class FacturaProveedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FacturaProveedor.list(params), model: [facturaProveedorInstanceCount: FacturaProveedor.count()]
    }

    def show(FacturaProveedor facturaProveedorInstance) {
        respond facturaProveedorInstance
    }

    def create() {
        respond new FacturaProveedor(params)
    }

    @Transactional
    def save(FacturaProveedor facturaProveedorInstance) {
        if (facturaProveedorInstance == null) {
            notFound()
            return
        }

        if (facturaProveedorInstance.hasErrors()) {
            respond facturaProveedorInstance.errors, view: 'create'
            return
        }

        facturaProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'facturaProveedor.label', default: 'FacturaProveedor'), facturaProveedorInstance.id])
                redirect facturaProveedorInstance
            }
            '*' { respond facturaProveedorInstance, [status: CREATED] }
        }
    }

    def edit(FacturaProveedor facturaProveedorInstance) {
        respond facturaProveedorInstance
    }

    @Transactional
    def update(FacturaProveedor facturaProveedorInstance) {
        if (facturaProveedorInstance == null) {
            notFound()
            return
        }

        if (facturaProveedorInstance.hasErrors()) {
            respond facturaProveedorInstance.errors, view: 'edit'
            return
        }

        facturaProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FacturaProveedor.label', default: 'FacturaProveedor'), facturaProveedorInstance.id])
                redirect facturaProveedorInstance
            }
            '*' { respond facturaProveedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FacturaProveedor facturaProveedorInstance) {

        if (facturaProveedorInstance == null) {
            notFound()
            return
        }

        facturaProveedorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FacturaProveedor.label', default: 'FacturaProveedor'), facturaProveedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaProveedor.label', default: 'FacturaProveedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
