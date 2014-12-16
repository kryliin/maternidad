package maternidad

class MovimientoBanco {


    Double monto
    Date fecha
    String observacion
    Boolean credito
    Banco banco
    String numeroTransferencia
    String cuentaTransferencia
    Cheque cheque
    FacturaProveedor facturaProveedor
    TipoPago tipoPago
    ConceptoBanco conceptoBanco

    static constraints = {
        monto(nullable: true,blank:true)
        fecha(attributes:[precision:"day"])
        observacion(size:0..5000, nullable:true, blank:true)
        cheque(nullable: true,blank:true)
        numeroTransferencia(nullable: true,blank:true)
        cuentaTransferencia(nullable: true,blank:true)
        facturaProveedor(nullable:true,blank:true )
        tipoPago(nullable: false,blank:false)
        conceptoBanco(nullable: false,blank:false)
    }
}
