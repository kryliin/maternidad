package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ConceptoBancoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoBanco.list(params), model: [conceptoBancoInstanceCount: ConceptoBanco.count()]
    }

    def show(ConceptoBanco conceptoBancoInstance) {
        respond conceptoBancoInstance
    }

    def create() {
        respond new ConceptoBanco(params)
    }

    @Transactional
    def save(ConceptoBanco conceptoBancoInstance) {
        if (conceptoBancoInstance == null) {
            notFound()
            return
        }

        if (conceptoBancoInstance.hasErrors()) {
            respond conceptoBancoInstance.errors, view: 'create'
            return
        }

        conceptoBancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoBanco.label', default: 'ConceptoBanco'), conceptoBancoInstance.id])
                redirect conceptoBancoInstance
            }
            '*' { respond conceptoBancoInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoBanco conceptoBancoInstance) {
        respond conceptoBancoInstance
    }

    @Transactional
    def update(ConceptoBanco conceptoBancoInstance) {
        if (conceptoBancoInstance == null) {
            notFound()
            return
        }

        if (conceptoBancoInstance.hasErrors()) {
            respond conceptoBancoInstance.errors, view: 'edit'
            return
        }

        conceptoBancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoBanco.label', default: 'ConceptoBanco'), conceptoBancoInstance.id])
                redirect conceptoBancoInstance
            }
            '*' { respond conceptoBancoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoBanco conceptoBancoInstance) {

        if (conceptoBancoInstance == null) {
            notFound()
            return
        }

        conceptoBancoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoBanco.label', default: 'ConceptoBanco'), conceptoBancoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoBanco.label', default: 'ConceptoBanco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
