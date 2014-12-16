package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import maternidad.Factura

import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class PagoFacturaController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def beforeInterceptor = {

    }



    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PagoFactura.list(params), model: [pagoFacturaInstanceCount: PagoFactura.count()]
    }

    def show(PagoFactura pagoFacturaInstance) {
        respond pagoFacturaInstance
    }

    def create() {

        def pagoFactura = new PagoFactura(params)
        pagoFactura?.factura = Factura?.findById(params?.id)
        respond pagoFactura

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
        } else {
            def facturaSeleccionada = new Factura()
            facturaSeleccionada = Factura?.get(pagoFacturaInstance?.factura?.id)
            def totalFacturaPagado
            def totalRetencionesPago
            pagoFacturaInstance.save(flush: true)

            if (facturaSeleccionada?.pagosFactura?.size() > 0) {
                totalFacturaPagado = facturaSeleccionada.getTotalPagos()
            } else {
                totalFacturaPagado = 0
            }

            if (totalRetencionesPago?.getTotalRetencion?.size() > 0) {
                totalRetencionesPago = facturaSeleccionada.getTotalRetencion()
            } else {
                totalRetencionesPago = 0
            }

            def totalAPagarConRetenciones = totalFacturaPagado - totalRetencionesPago
            def totalDFacturadoSinRetenciones = facturaSeleccionada?.totalFacturado - totalAPagarConRetenciones
            facturaSeleccionada?.totalPagado = totalAPagarConRetenciones + pagoFacturaInstance?.monto


//            println  'facturaSeleccionada?.totalPagado'
//            println  facturaSeleccionada?.totalPagado
//            println  'otalDFacturadoSinRetenciones'
//            println  totalDFacturadoSinRetenciones

            if (facturaSeleccionada?.totalPagado > totalDFacturadoSinRetenciones) {
                flash.message = 'El monto es superior al total facturado'
                render(view: 'index', controller: PagoFactura)
            } else {
                if (facturaSeleccionada?.totalPagado == totalDFacturadoSinRetenciones) facturaSeleccionada?.pagoCompleto = true





                facturaSeleccionada.save(flush: true)
                flash.message = 'Se ha agregado un pago a su factura '
                render(view: 'index', params: [pagoFacturaInstance: pagoFacturaInstance])
            }
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
