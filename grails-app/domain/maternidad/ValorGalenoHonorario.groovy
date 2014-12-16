package maternidad

class ValorGalenoHonorario {
    Double valor
    TipoHonorario tipoHonorario
    PlanConvenio planConvenio

    static belongsTo = [planConvenio:PlanConvenio]

    static mapping = {
        planConvenio cascade:'all-delete-orphan'
    }


    static constraints = {

        valor(nullable: true,blank:true)
        tipoHonorario(nullable: true,blank:true)
        planConvenio(nullable: false,blank:false)
    }
}
