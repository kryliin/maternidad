package maternidad

class ObraSocial {

    String sigla
    String nombre
    String codigo
    Long cuit
    String observacion
    Boolean activa=true

    static hasMany = [planes:Plan,convenios:Convenio,practicas:Practica]

    static constraints = {
        sigla(size:1..15, nullable:false, blank:false)
        nombre(size:2..35, nullable:true, blank:true)
        codigo(size:2..10, nullable:true, blank:true)
        cuit(nullable:true, unique:true, blank:true, validator: { it.toString() ==~ /^(20|23|27|30|33)[0-9]{9}$/ })
        observacion(size:0..5000, nullable:true, blank:true)
        activa(nullable:true, blank:true)

    }


}
