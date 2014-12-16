package maternidad

class Factura {
    Date fecha
    Plan plan
    Boolean anulada
    Integer nrofactura
    Boolean pagoCompleto
    Integer periodo
    Double totalFacturado
    Double totalPagado

    SortedSet detallesFactura
    // SortedSet pagosFactura

    static hasMany = [
            detallesFactura: DetalleFactura,
            pagosFactura: PagoFactura
    ]

    static belongsTo = [
            plan: Plan
    ]

    static constraints = {
        fecha(nullable: false)
        plan(nullable: false)
        nrofactura(nullable: false)
        periodo(nullable: false)
        totalFacturado(nullable: false, validator: pagoCompletoValidator)
        totalPagado(nulleable: true, blank: true)

    }

    def beforeInsert = {
        //getTotalRetencion()
        totalPagado = new Double(getTotalPagos())
    }

    def beforeUpdate = {
        // getTotalRetencion()
        totalPagado = new Double(getTotalPagos())
    }

    def beforeValidate() {
        totalPagado = new Double(getTotalPagos())
    }


    def Double getTotalRetencion() {
        Double total = 0
        pagosFactura?.each() {
            total += it?.retencion
        }
        return total
    }


    def Double getTotalPagos() {
        Double totalPagado = 0
        pagosFactura?.each() {
            totalPagado += it?.monto
        }
        return totalPagado
    }

    static def pagoCompletoValidator = {
        val, Factura obj ->
            def resp = true
            def totalPagos = obj?.getTotalPagos()

            if (totalPagos >= obj?.totalFacturado) {
                obj?.pagoCompleto = true
            } else {
                obj?.pagoCompleto = false
            }
            resp
    }


    String toString() { "${nrofactura} (${fecha?.format('dd/MM/yyyy')} - ${totalFacturado} - ${totalPagado})" }

}
