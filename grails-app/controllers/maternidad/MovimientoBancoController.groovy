package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MovimientoBancoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoBanco.list(params), model: [movimientoBancoInstanceCount: MovimientoBanco.count()]
    }

    def show(MovimientoBanco movimientoBancoInstance) {
        respond movimientoBancoInstance
    }

    def create() {
        respond new MovimientoBanco(params)
    }

    @Transactional
    def save(MovimientoBanco movimientoBancoInstance) {
        if (movimientoBancoInstance == null) {
            notFound()
            return
        }

        if (movimientoBancoInstance.hasErrors()) {
            respond movimientoBancoInstance.errors, view: 'create'
            return
        }

        movimientoBancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoBanco.label', default: 'MovimientoBanco'), movimientoBancoInstance.id])
                redirect movimientoBancoInstance
            }
            '*' { respond movimientoBancoInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoBanco movimientoBancoInstance) {
        respond movimientoBancoInstance
    }

    @Transactional
    def update(MovimientoBanco movimientoBancoInstance) {
        if (movimientoBancoInstance == null) {
            notFound()
            return
        }

        if (movimientoBancoInstance.hasErrors()) {
            respond movimientoBancoInstance.errors, view: 'edit'
            return
        }

        movimientoBancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoBanco.label', default: 'MovimientoBanco'), movimientoBancoInstance.id])
                redirect movimientoBancoInstance
            }
            '*' { respond movimientoBancoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoBanco movimientoBancoInstance) {

        if (movimientoBancoInstance == null) {
            notFound()
            return
        }

        movimientoBancoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoBanco.label', default: 'MovimientoBanco'), movimientoBancoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoBanco.label', default: 'MovimientoBanco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
