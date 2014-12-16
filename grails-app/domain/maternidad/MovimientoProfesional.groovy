package maternidad

class MovimientoProfesional {

    Date fecha
    Profesional profesional
    ConceptoMovimientoProfesional conceptoProfesional
    Boolean credito
    Double monto
    String observacion
    Usuario usuario


    static constraints = {
        fecha(nullable: false,blank:false,format:'dd-MM-yyyy',validator: { val, obj ->val?.before(new Date())})
        profesional(nullable: false,blank:false)
        conceptoProfesional(nullable: true,blank:true)
        credito(nullable: false,blank:false)
        monto(nullable: false,blank:false, scale: 2, matches: "[0-9]")
        observacion(size:0..5000, nullable:true, blank:true, widget:"textarea")
        usuario(nullable: true,blank:true)
    }

    String toString() { "Nº ${id}" }
}


