package maternidad

class Profesional {


    Persona persona
    Boolean activo=true
    String matriculaProvincial
    Date fechaMatriculacion
    String cbu
    Banco banco
    //SortedSet<ConceptoPorProfesional> listaConceptos

    static belongsTo = [
            persona : Persona,
            banco : Banco
    ]

    static hasMany = [
            listaConceptos        : ConceptoPorProfesional,
            movimientosProfesional: MovimientoProfesional
    ]


    static mapping = {
       persona cascade: 'all'
    }

    static constraints = {

    persona(nullable: true , blank:true)
    activo(nullable: true , blank:true)
    matriculaProvincial(nullable: true , blank:true)
    fechaMatriculacion(nullable: true , blank:true)
    cbu(nullable: true , blank:true)
    banco(nullable: true , blank:true)

    }

    String toString() { if(persona){"${persona.razonSocial?:persona.apellido+', '+persona.nombre}"} else {""} }

}




