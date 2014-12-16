package maternidad

class RetencionPago {
    TipoRetencionPago tipo
    Double monto
    PagoFactura pagoFactura
    String observaciones

    static belongsTo = [
            pagoFactura : PagoFactura
    ]

    static constraints = {
    }





}
