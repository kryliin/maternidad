package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MovimientoProveedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoProveedor.list(params), model: [movimientoProveedorInstanceCount: MovimientoProveedor.count()]
    }

    def show(MovimientoProveedor movimientoProveedorInstance) {
        respond movimientoProveedorInstance
    }

    def create() {
        respond new MovimientoProveedor(params)
    }

    @Transactional
    def save(MovimientoProveedor movimientoProveedorInstance) {
        if (movimientoProveedorInstance == null) {
            notFound()
            return
        }

        if (movimientoProveedorInstance.hasErrors()) {
            respond movimientoProveedorInstance.errors, view: 'create'
            return
        }

        movimientoProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor'), movimientoProveedorInstance.id])
                redirect movimientoProveedorInstance
            }
            '*' { respond movimientoProveedorInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoProveedor movimientoProveedorInstance) {
        respond movimientoProveedorInstance
    }

    @Transactional
    def update(MovimientoProveedor movimientoProveedorInstance) {
        if (movimientoProveedorInstance == null) {
            notFound()
            return
        }

        if (movimientoProveedorInstance.hasErrors()) {
            respond movimientoProveedorInstance.errors, view: 'edit'
            return
        }

        movimientoProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoProveedor.label', default: 'MovimientoProveedor'), movimientoProveedorInstance.id])
                redirect movimientoProveedorInstance
            }
            '*' { respond movimientoProveedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoProveedor movimientoProveedorInstance) {

        if (movimientoProveedorInstance == null) {
            notFound()
            return
        }

        movimientoProveedorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoProveedor.label', default: 'MovimientoProveedor'), movimientoProveedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
