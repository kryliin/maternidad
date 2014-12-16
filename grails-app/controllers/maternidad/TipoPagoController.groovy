package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")


@Transactional(readOnly = true)
class TipoPagoController {


    static scaffold = true
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoPago.list(params), model: [tipoPagoInstanceCount: TipoPago.count()]
    }

    def show(TipoPago tipoPagoInstance) {
        respond tipoPagoInstance
    }

    def create() {
        respond new TipoPago(params)
    }

    @Transactional
    def save(TipoPago tipoPagoInstance) {
        if (tipoPagoInstance == null) {
            notFound()
            return
        }

        if (tipoPagoInstance.hasErrors()) {
            respond tipoPagoInstance.errors, view: 'create'
            return
        }

        tipoPagoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPago.label', default: 'TipoPago'), tipoPagoInstance.id])
                redirect tipoPagoInstance
            }
            '*' { respond tipoPagoInstance, [status: CREATED] }
        }
    }

    def edit(TipoPago tipoPagoInstance) {
        respond tipoPagoInstance
    }

    @Transactional
    def update(TipoPago tipoPagoInstance) {
        if (tipoPagoInstance == null) {
            notFound()
            return
        }

        if (tipoPagoInstance.hasErrors()) {
            respond tipoPagoInstance.errors, view: 'edit'
            return
        }

        tipoPagoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoPago.label', default: 'TipoPago'), tipoPagoInstance.id])
                redirect tipoPagoInstance
            }
            '*' { respond tipoPagoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoPago tipoPagoInstance) {

        if (tipoPagoInstance == null) {
            notFound()
            return
        }

        tipoPagoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoPago.label', default: 'TipoPago'), tipoPagoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPago.label', default: 'TipoPago'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
