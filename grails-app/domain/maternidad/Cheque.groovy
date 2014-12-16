package maternidad

class Cheque {

    Double monto
    Date fechaEmision
    Date fechaVencimientoCobro
    Date fechaRealCobro
    String descripcion
    Boolean activo = true
    Integer numero
    Banco banco



    static constraints = {

        monto(nullable: true,blank:true)
        fechaEmision(attributes:[precision:"day"])
        fechaVencimientoCobro(attributes:[precision:"day"])
        fechaRealCobro(attributes:[precision:"day"],nullable: true)
        descripcion(size:0..5000, nullable:true, blank:true)
        numero(nullable:false,blank:false)

    }

    String toString() { "${numero}"  }

}
