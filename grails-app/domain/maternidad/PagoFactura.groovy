package maternidad

class PagoFactura {

    Factura factura
    Double monto
    Liquidacion liquidacion
    Date fecha
    TipoPago tipoPago
    Double retencion
    Integer numeroComprobante
    String aclaracionComprobante
    Double porcentajeALiquidar
    Double porcentajeLiquidado

    SortedSet<RetencionPago> retencionPagos

    static hasMany = [
            retencionPagos: RetencionPago
    ]


    static constraints = {
        retencion(nullable: true)
        //retencion(nullable: true, validator: validadorRetencion)
        monto(nullable: false)//, validator: validadorMonto)
        factura(nullable: false)
        numeroComprobante(nullable: false)
        tipoPago(nullable: false)

    }

    def beforeInsert = {
    }

    def beforeUpdate = {
    }

//    private void actualizarRetencion() {
//        Double total = 0
//        retencionPagos?.each {
//            total += it?.monto
//        }
//        retencion = total
//    }

    static def validadorRetencion = {
        val, Factura obj ->
            def resp = true
            if (retencion > obj?.totalFacturado) {
                resp = "pagoFactura.monto.invalido"
            }
            resp
    }


    static def validadorMonto = {
        val, Factura obj ->

            println 'val'
            println val


            def resp = true
            def totalPagos = obj?.getTotalPagos() - obj?.getTotalRetencion()
            if (val > totalPagos) {
                resp = "pagoFactura.pago.mayor.a.monto"
            } else {
            obj?.totalPagado = obj?.totalPagado +  val
            }
            resp
    }

//    static pagosFacturaOrdenar(Factura factura) {
//        def pagos = []
//        if (factura) {
//            pagos = PagoFactura.findAllByFactura(factura)
//            pagos.sort { it.nrofactura }
//        }
//        pagos
//    }


    String toString() { "${fecha?.format('dd/MM/yyyy')} ++ ${monto}" }
}
