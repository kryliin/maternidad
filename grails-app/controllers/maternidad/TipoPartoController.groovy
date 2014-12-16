package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class TipoPartoController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoParto.list(params), model: [tipoPartoInstanceCount: TipoParto.count()]
    }

    def show(TipoParto tipoPartoInstance) {
        respond tipoPartoInstance
    }

    def create() {
        respond new TipoParto(params)
    }

    @Transactional
    def save(TipoParto tipoPartoInstance) {
        if (tipoPartoInstance == null) {
            notFound()
            return
        }

        if (tipoPartoInstance.hasErrors()) {
            respond tipoPartoInstance.errors, view: 'create'
            return
        }

        tipoPartoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoParto.label', default: 'TipoParto'), tipoPartoInstance.id])
                redirect tipoPartoInstance
            }
            '*' { respond tipoPartoInstance, [status: CREATED] }
        }
    }

    def edit(TipoParto tipoPartoInstance) {
        respond tipoPartoInstance
    }

    @Transactional
    def update(TipoParto tipoPartoInstance) {
        if (tipoPartoInstance == null) {
            notFound()
            return
        }

        if (tipoPartoInstance.hasErrors()) {
            respond tipoPartoInstance.errors, view: 'edit'
            return
        }

        tipoPartoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoParto.label', default: 'TipoParto'), tipoPartoInstance.id])
                redirect tipoPartoInstance
            }
            '*' { respond tipoPartoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoParto tipoPartoInstance) {

        if (tipoPartoInstance == null) {
            notFound()
            return
        }

        tipoPartoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoParto.label', default: 'TipoParto'), tipoPartoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoParto.label', default: 'TipoParto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
