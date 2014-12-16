package maternidad



class FacturaProveedor {

    Double monto
    Date fechaEmision
    Date fechaVencimientoPago
    Date fechaRealPago
    String descripcion
    Boolean activo=true
    String numero


    Proveedor proveedor

    static constraints = {

        monto(nullable: true,blank:true)
        fechaEmision(attributes:[precision:"day"])
        fechaVencimientoPago(attributes:[precision:"day"])
        fechaRealPago(attributes:[precision:"day"],nullable: true)
        descripcion(size:0..5000, nullable:true, blank:true)
        numero(nullable:false,blank:false)
        proveedor(nullable: false,blank:false)

    }
}
