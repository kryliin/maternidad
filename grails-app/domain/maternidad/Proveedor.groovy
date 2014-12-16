package maternidad

import sami.Cuit

class Proveedor {



    Long cuit
    String nombre
    String direccion
    Localidad localidad
    String email
    Boolean activo=true
    String telefono


    static constraints = {

        cuit(nullable: true, validator: { val, obj ->
            if(!Cuit.validar(val.toString())) return ['Cuit Inválido']
        })

        nombre(nullable: false,blank: false)
        direccion(nullable: true,blank: true)
        telefono(nullable: true,blank: true)
        email(email: true,nullable: true)
        localidad(nullable: true)
    }

    String toString() { nombre }

}
