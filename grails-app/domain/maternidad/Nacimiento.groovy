package maternidad

class Nacimiento {


    Date fecha_hora_parto
    TipoParto tipo_parto_id
    Integer peso_bebe
    String condicion_al_nacer
    String sexo
    String observaciones

    static constraints = {
        fecha_hora_parto(nullable: false,blank:false, attributes:[precision:"minute"])
        tipo_parto_id(nullable: false,blank:false)
        peso_bebe(nullable: false,blank:false,matches:"[0-9]")
        sexo(nullable: false,blank:false,inList: ["Masculino", "Femenino"])
        condicion_al_nacer(widget:'textarea',nullable: false,blank:false, size: 0..5000)
        observaciones(widget:'textarea',nullable: true,blank:true, size: 0..5000)
    }

    static belongsTo = [
            planillainternacion : PlanillaInternacion
    ]

    String toString() { "Nº ${id}" }
}
