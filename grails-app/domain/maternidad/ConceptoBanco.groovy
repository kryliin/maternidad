package maternidad

class ConceptoBanco {

    String codigo
    String nombre
    Boolean activo = true
    String descripcion

    static constraints = {
        codigo(size:2..10, nullable:true, blank:true)
        nombre(size:2..35, nullable:true, blank:true)
        activo(nullable:false, blank:false)
        descripcion(size:0..5000, nullable:true, blank:true)
    }

    String toString() { "${nombre}" }
}
