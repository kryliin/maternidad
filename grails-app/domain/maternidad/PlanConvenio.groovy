package maternidad

class PlanConvenio {

    Plan plan
    Convenio convenio
    Boolean activo=true

    static hasMany = [valoresGalenoGasto:ValorGalenoGasto,valoresGalenoHonorario:ValorGalenoHonorario,valoresPracticas:ValorPractica]

    static belongsTo = [plan:Plan,convenio:Convenio]

    static mapping = {
        convenio cascade:'all-delete-orphan'
                valoresPracticas cascade:'all-delete-orphan'
        valoresGalenoGasto cascade:'all-delete-orphan'
        valoresGalenoHonorario cascade:'all-delete-orphan'
    }

    static constraints = {

    plan (nullable: false , blank:false)
    convenio (nullable: true , blank:false)
    }
}
