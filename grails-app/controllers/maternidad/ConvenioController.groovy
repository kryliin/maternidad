package maternidad

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.transaction.annotation.Propagation

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ConvenioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static transactional = false
    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Convenio.list(params), model: [convenioInstanceCount: Convenio.count()]
    }*/


    def index = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {
            if (params.sigla) {
              obrasocial{
                  ilike('sigla', '%' + params.sigla + '%')
              }

            }
            if (params.codigo) {
                ilike('codigo', '%' + params.codigo + '%')
            }

            if (params.nombre) {
               obrasocial{ilike('nombre', '%' + params.nombre + '%')}

            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = Convenio.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def convenios = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [sigla: params.sigla,codigo:params.codigo,nombre:params.nombre]

        def model = [convenioInstanceList: convenios, convenioInstanceCount:convenios.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def show(Convenio convenioInstance) {
        respond convenioInstance
    }

    def create() {
        respond new Convenio(params)
    }

    @Transactional
    def save(Convenio convenioInstance) {
        if (convenioInstance == null) {
            notFound()
            return
        }

        if (convenioInstance.hasErrors()) {
            respond convenioInstance.errors, view: 'create'
            return
        }

        for(convenio in convenioInstance?.obrasocial?.convenios){
          convenio.activo=false
          convenio.save(flush: true)
        }

        convenioInstance.save flush: true

        for( plan in convenioInstance?.obrasocial?.planes ) {
           PlanConvenio planConvenio=new PlanConvenio()
            planConvenio.convenio=convenioInstance
            planConvenio.activo=true
            planConvenio.plan=plan
            planConvenio.save flush: true
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'convenio.label', default: 'Convenio'), convenioInstance.id])
                redirect(action: "index")
            }
            '*' { respond convenioInstance, [status: CREATED],view:'index' }
        }
    }

    def edit(Convenio convenioInstance) {
        respond convenioInstance
    }

    @Transactional
    def update(Convenio convenioInstance) {
        if (convenioInstance == null) {
            notFound()
            return
        }

        if (convenioInstance.hasErrors()) {
            respond convenioInstance.errors, view: 'edit'
            return
        }

        convenioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Convenio.label', default: 'Convenio'), convenioInstance.id])
                redirect(action: "index")
            }
            '*' { respond convenioInstance, [status: OK],view:'index' }
        }
    }

    @Transactional
    def delete(Convenio convenioInstance) {

        if (convenioInstance == null) {
            notFound()
            return
        }

        convenioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Convenio.label', default: 'Convenio'), convenioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'convenio.label', default: 'Convenio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }



    def verPlanes={

def convenio=Convenio.get(params.id as Long)

        render(view: "planesDelConvenio", model: [convenio:convenio])

    }


    def agregarPlan={

redirect controller: "plan", method:"POST" ,action: "create",params:["convenio":params.id]

    }

    @Transactional(readOnly = false)
    def duplicar(){


    def convenio=Convenio.get(params.id as Long)

    convenio.activo=false

    convenio.save flush: true

    def convenioAux= new Convenio()

    //convenio
    convenioAux?.fechaInicio= convenio?.fechaFin?.plus(1)//new Date()
    convenioAux?.fechaFin= convenio?.fechaFin?.plus(365)
    convenioAux?.activo=true
    convenioAux?.codigo=''
    convenioAux?.obrasocial=convenio?.obrasocial
    convenioAux?.observacion=convenio?.observacion

    convenioAux.save flush: true

    //Plan Convenio
    for( planConvenio in convenio?.planConvenio ) {
    def planConvenioAux= new PlanConvenio()
    planConvenioAux?.activo=planConvenio?.activo
    planConvenioAux.convenio=convenioAux
    planConvenioAux.plan=planConvenio?.plan
    planConvenioAux.save flush: true

        //valores Galeno Gasto
        for(valorGalenoGasto in planConvenio?.valoresGalenoGasto){
            def valorGalenoGastoAux=new ValorGalenoGasto()
            valorGalenoGastoAux?.planConvenio=planConvenioAux
            valorGalenoGastoAux?.tipoGasto=valorGalenoGasto?.tipoGasto
            valorGalenoGastoAux?.valor=valorGalenoGasto?.valor
            valorGalenoGastoAux.save flush: true
        }

        //valores Galeno Honorario
        for(valorGalenoHonorario in planConvenio?.valoresGalenoHonorario){
            def valorGalenoHonorarioAux=new ValorGalenoHonorario()
            valorGalenoHonorarioAux?.planConvenio=planConvenioAux
            valorGalenoHonorarioAux.tipoHonorario=valorGalenoHonorario?.tipoHonorario
            valorGalenoHonorarioAux?.valor=valorGalenoHonorario?.valor
            valorGalenoHonorarioAux.save flush: true
        }

        //valor practica
        for(valorPractica  in planConvenio?.valoresPracticas){
            def valorPracticaAux=new ValorPractica()
            valorPracticaAux?.planConvenio=planConvenioAux
            valorPracticaAux?.plan=planConvenioAux?.plan
            valorPracticaAux?.fechaActualizado=new Date()
            valorPracticaAux?.practica=valorPractica?.practica
            valorPracticaAux?.valorAnestecista=valorPractica?.valorAnestecista
            valorPracticaAux?.valorHonorario=valorPractica?.valorHonorario
            valorPracticaAux?.valorAyudante=valorPractica?.valorAyudante
            valorPracticaAux?.valorEspecialista=valorPractica?.valorEspecialista
            valorPracticaAux?.valorGasto=valorPractica?.valorGasto
            valorPracticaAux?.valorGastoModulo=valorPractica?.valorGastoModulo
            valorPracticaAux?.valorHonorarioModulo=valorPractica?.valorHonorarioModulo
            valorPracticaAux.save flush: true
        }



     /*   request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Convenio.label', default: 'Convenio'), convenioAux?.id])
                redirect(action: "index")
            }
            '*' { respond convenioAux?.id, [status: OK],view:'index' }
        }
*/

    }
        redirect(action: "index")
}


    def asociarPlanAlConvenio={


        def planconvenio=PlanConvenio.get(params.id as Long)
planconvenio.activo=Boolean.TRUE

        render(view: "planesDelConvenio", model: [convenio:planconvenio?.convenio])

    }


    def desasociarPlan={


        def planconvenio=PlanConvenio.get(params.id as Long)
        planconvenio.activo=Boolean.FALSE

        render(view: "planesDelConvenio", model: [convenio:planconvenio?.convenio])

    }

   def showPlan = {

       def planconvenio=PlanConvenio.get(params.id as Long)


       render(view: "showPlan", model: [planConvenio:planconvenio])

   }

    def editPlan = {

        def planconvenio=PlanConvenio.get(params.id as Long)


        render(view: "editPlan", model: [planConvenio:planconvenio])

    }


    @Transactional
    def updatePlan(Plan planInstance) {
        if (planInstance == null) {
            notFound()
            return
        }

        if (planInstance.hasErrors()) {
            respond planInstance.errors, view: 'editPlan'
            return
        }

        planInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Convenio.label', default: 'Plan'),planInstance.id])
                redirect(action: "editPlan")
            }
            '*' { respond planInstance, [status: OK],view:'editPlan' }
        }
    }



    def saveValorGalenoGasto = {

        def planConvenio= PlanConvenio.get(params.planConvenio as String)


        def lista =  params?.gastos as List

        for(gasto in TipoGasto.list()){


            if ( lista?.contains(gasto?.id as String)  ){
                def valorGalenoGasto = new ValorGalenoGasto()

                valorGalenoGasto.planConvenio=planConvenio
                valorGalenoGasto.tipoGasto=gasto
                valorGalenoGasto.valor=params['valor'+gasto?.id] as Double


                def valorGalenoGastoAux=ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)

                if(valorGalenoGastoAux==null)
                {
                    if (valorGalenoGasto.save(flush: true)){}
                }else {

                    valorGalenoGastoAux.valor=params['valor'+gasto?.id] as Double


                    if (valorGalenoGastoAux.save(flush: true)){}
                }


            } else {


                def valorgaenogastoInstance= ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)

                if(valorgaenogastoInstance!=null){
                    valorgaenogastoInstance.delete()
                }

            }


        }



        redirect(controller:"convenio",action: "editPlan",params: [id:planConvenio?.id])

        return



    }



    def saveValorGalenoHonorario = {

        def planConvenio= PlanConvenio.get(params.planConvenio as String)


        def lista =  params?.honorarios as List

        for(honorario in TipoHonorario.list()){


            if ( lista?.contains(honorario?.id as String)  ){
                def valorGalenoHonorario = new ValorGalenoHonorario()

                valorGalenoHonorario.planConvenio=planConvenio
                valorGalenoHonorario.tipoHonorario=honorario
                valorGalenoHonorario.valor=params['valor'+honorario?.id] as Double


                def valorGalenoHonorarioAux=ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)

                if(valorGalenoHonorarioAux==null)
                {
                    if (valorGalenoHonorario.save(flush: true)){}
                }else {

                    valorGalenoHonorarioAux.valor=params['valor'+honorario?.id] as Double


                    if (valorGalenoHonorarioAux.save(flush: true)){}
                }


            } else {


                def valorgaenohonorarioInstance= ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)

                if(valorgaenohonorarioInstance!=null){
                    valorgaenohonorarioInstance.delete()
                }

            }


        }



        redirect(controller:"convenio",action: "editPlan",params: [id:planConvenio?.id])

        return



    }


def asociarPractica= {

def planConvenio=PlanConvenio.get(params.id)

    render(view: "asociarPractica", model: [planConvenio:planConvenio])


}

   def saveAsociacionPractica = {

   def planConvenio=PlanConvenio.get(params.planConvenio.id)
   def practica=Practica.get(params.practica.id)

def valorPractica= new ValorPractica()

       valorPractica?.planConvenio=planConvenio
       valorPractica?.practica=practica
       valorPractica?.valorHonorario=params.valor as Double
        valorPractica?.fechaActualizado= new Date()
       valorPractica?.plan=planConvenio?.plan

       valorPractica.save flush: true

       request.withFormat {
           form multipartForm {
               flash.message = message(code: 'default.created.message', args: [message(code: 'Convenio.label', default: 'Practica'),valorPractica.id])
               redirect(action: "editPlan",params: [id: planConvenio?.id])
           }
           '*' { respond valorPractica, [status: OK],view:'editPlan' }
       }

   }


    def editAsociarPractica= {

        def valor=ValorPractica.get(params.id)

        render(view: "editAsociarPractica", model: [valorPractica:valor])


    }

    def updateAsociacionPractica={

        def valorPractica=ValorPractica.get(params.valorPractica.id)
        def practica=Practica.get(params.practica.id)


        valorPractica?.practica=practica
        valorPractica?.valorHonorario=params.valor as Double
        valorPractica?.fechaActualizado= new Date()

        valorPractica.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Convenio.label', default: 'Practica'),valorPractica.id])
                redirect(action: "editPlan",params: [id: valorPractica?.planConvenio?.id])
            }
            '*' { respond valorPractica, [status: OK],view:'editPlan' }
        }


    }

}
