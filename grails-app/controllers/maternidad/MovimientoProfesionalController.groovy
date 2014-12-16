package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MovimientoProfesionalController {

    static scaffold = true

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoProfesional.list(params), model: [movimientoProfesionalInstanceCount: MovimientoProfesional.count()]
    }

    def show(MovimientoProfesional movimientoProfesionalInstance) {
        respond movimientoProfesionalInstance
    }

    def create() {
        def profesional = Profesional.get(params?.id)
        def movimientoProfesional= new MovimientoProfesional(params)
        movimientoProfesional?.profesional=profesional
        respond  movimientoProfesional,model: [profesional:profesional]

    }

    @Transactional
    def save(MovimientoProfesional movimientoProfesionalInstance) {
        if (movimientoProfesionalInstance == null) {
            notFound()
            return
        }

        if (movimientoProfesionalInstance.hasErrors()) {
            respond movimientoProfesionalInstance.errors, view: 'create'
            return
        }

        movimientoProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional'), movimientoProfesionalInstance.id])
              //  redirect movimientoProfesionalInstance
                redirect(controller:"profesional",action: "edit",params: [id:movimientoProfesionalInstance?.profesional?.id])
            }
            '*' { respond movimientoProfesionalInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoProfesional movimientoProfesionalInstance) {
        respond movimientoProfesionalInstance
    }

    @Transactional
    def update(MovimientoProfesional movimientoProfesionalInstance) {
        if (movimientoProfesionalInstance == null) {
            notFound()
            return
        }

        if (movimientoProfesionalInstance.hasErrors()) {
            respond movimientoProfesionalInstance.errors, view: 'edit'
            return
        }

        movimientoProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoProfesional.label', default: 'MovimientoProfesional'), movimientoProfesionalInstance.id])
                redirect movimientoProfesionalInstance
            }
            '*' { respond movimientoProfesionalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoProfesional movimientoProfesionalInstance) {

        if (movimientoProfesionalInstance == null) {
            notFound()
            return
        }

        movimientoProfesionalInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoProfesional.label', default: 'MovimientoProfesional'), movimientoProfesionalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }



    def saldo={

        def movimientos = MovimientoProfesional.findAllById(0)



        return [movimientoProfesionalInstanceList: movimientos, movimientoProfesionalInstanceCount: 0, total: 0]

    }

    def getmovimientosProfesional = {

        if(params.idProfesional && params.idProfesional!='null' ) {
            def profesionalInstance = Profesional.read(params?.idProfesional as String)
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def movimientos = MovimientoProfesional.findAllByProfesional(profesionalInstance,[sort: "fecha", order: "desc",max: params.max, offset: params.offset])

            def credito = MovimientoProfesional.executeQuery("select sum(monto) from MovimientoProfesional mp " +
                    "where mp.credito=true and  mp.profesional = :profesional",
                    [profesional: profesionalInstance])

            def debito = MovimientoProfesional.executeQuery("select sum(monto) from MovimientoProfesional mp " +
                    "where mp.credito=false and  mp.profesional = :profesional",
                    [profesional: profesionalInstance])

            def ing  = (credito[0])? credito[0]:0

            def egr  = (debito[0])? debito[0]:0

            def total = ing- egr

            render(template: 'movimientos', model: [movimientoProfesionalInstanceList: movimientos, movimientoProfesionalInstanceCount: MovimientoProfesional.findAllByProfesional(profesionalInstance).size(), total: total,idProfesional:profesionalInstance?.id])
        }
        else {
            def movimientos = MovimientoProfesional.findAllById(0)

            render(template: 'movimientos', model: [movimientoProfesionalInstanceList: movimientos, movimientoProfesionalInstanceCount: 0, total: 0])
        }
    }




}
