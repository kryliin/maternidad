package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class PagoFacturaController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PagoFactura.list(params), model: [pagoFacturaInstanceCount: PagoFactura.count()]
    }

    def show(PagoFactura pagoFacturaInstance) {
        respond pagoFacturaInstance
    }

    def create() {

        println 'params'
        println params.dump()

        respond new PagoFactura(params)
    }

    @Transactional
    def save(PagoFactura pagoFacturaInstance) {
        if (pagoFacturaInstance == null) {
            notFound()
            return
        }

        if (pagoFacturaInstance.hasErrors()) {
            respond pagoFacturaInstance.errors, view: 'create'
            return
        }

        println 'params save'
        println params.dump()

        //LOGICA DE GUARDAR UN NUEVO PAGO Y REDUCIR EL MONTO DE LA FACTURA


        pagoFacturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pagoFactura.label', default: 'PagoFactura'), pagoFacturaInstance.id])
                redirect pagoFacturaInstance
            }
            '*' { respond pagoFacturaInstance, [status: CREATED] }
        }
    }

    def edit(PagoFactura pagoFacturaInstance) {
        respond pagoFacturaInstance
    }

    @Transactional
    def update(PagoFactura pagoFacturaInstance) {
        if (pagoFacturaInstance == null) {
            notFound()
            return
        }

        if (pagoFacturaInstance.hasErrors()) {
            respond pagoFacturaInstance.errors, view: 'edit'
            return
        }

        pagoFacturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PagoFactura.label', default: 'PagoFactura'), pagoFacturaInstance.id])
                redirect pagoFacturaInstance
            }
            '*' { respond pagoFacturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PagoFactura pagoFacturaInstance) {

        if (pagoFacturaInstance == null) {
            notFound()
            return
        }

        pagoFacturaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PagoFactura.label', default: 'PagoFactura'), pagoFacturaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoFactura.label', default: 'PagoFactura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}