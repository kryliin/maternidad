package maternidad

class MovimientoProveedor {

    Double monto
    Date fecha
    String observacion
    Boolean credito
    Banco banco
    FacturaProveedor facturaProveedor
    TipoPago tipoPago
    ConceptoProveedor conceptoProveedor
    Proveedor proveedor


    static constraints = {
        proveedor(nullable: false,blank:false)
        monto(nullable: true,blank:true)
        fecha(attributes:[precision:"day"])
        observacion(size:0..5000, nullable:true, blank:true)
        facturaProveedor(nullable:true,blank:true )
        tipoPago(nullable: false,blank:false)
        conceptoProveedor(nullable: false,blank:false)
    }
}
