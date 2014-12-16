package maternidad

class PlanillaInternacion {

    Persona paciente
    Plan plan
    Date fechaInternacion
    String nombreFamiliarResponsable
    String telefonoFamiliarResponsable
    Date fechaAlta
    String observaciones

    static constraints = {
        paciente(nullable: true,blank:true)
        plan(nullable: false,blank:false)
        fechaInternacion(nullable: false,blank:false, attributes:[precision:"day"])
        nombreFamiliarResponsable(nullable: false,blank:false)
        telefonoFamiliarResponsable(phoneNumber:true)
        fechaAlta(nullable: true,blank:true,validator: { val, obj ->val?.after(obj.fechaInternacion) || val?.equals(obj.fechaInternacion)},attributes:[precision:"day"])
        observaciones(nullable: true,blank:true, size: 0..5000)
    }

    static hasMany = [
            nacimientos: Nacimiento
    ]

    String toString() { "Nº ${id}" }
}
