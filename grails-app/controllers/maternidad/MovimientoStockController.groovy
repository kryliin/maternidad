package maternidad


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MovimientoStockController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoStock.list(params), model: [movimientoStockInstanceCount: MovimientoStock.count()]
    } */



    def index = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {
            if (params.fechaDesde && params.fechaHasta) {
                between('fecha', params.fechaDesde, params.fechaHasta)
            }
            if (params.codigo) {
              producto{  ilike('codigo', '%' + params.codigo + '%') }
            }

            if (params.nombre) {
                producto{ilike('nombre', '%' + params.nombre + '%')}

            }

            if (params.codigoDestino) {
                destino{  ilike('codigo', '%' + params.codigoDestino + '%') }
            }

            if (params.nombreDestino) {
                destino{ilike('nombre', '%' + params.nombreDestino + '%')}

            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = MovimientoStock.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def movimientos = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [fechaDesde: params.fechaDesde,fechaHasta: params.fechaHasta,codigo:params.codigo,nombre:params.nombre,codigoDestino:params.codigoDestino,nombreDestino:params.nombreDestino]

        def model = [movimientoStockInstanceList: movimientos, movimientoStockInstanceTotal:movimientos.size(), filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def show(MovimientoStock movimientoStockInstance) {
        respond movimientoStockInstance
    }

    def create() {
        respond new MovimientoStock(params)
    }

    @Transactional
    def save(MovimientoStock movimientoStockInstance) {
        if (movimientoStockInstance == null) {
            notFound()
            return
        }

        if (movimientoStockInstance.hasErrors()) {
            respond movimientoStockInstance.errors, view: 'create'
            return
        }

        movimientoStockInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoStock.label', default: 'MovimientoStock'), movimientoStockInstance.id])
                redirect movimientoStockInstance
            }
            '*' { respond movimientoStockInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoStock movimientoStockInstance) {
        respond movimientoStockInstance
    }

    @Transactional
    def update(MovimientoStock movimientoStockInstance) {
        if (movimientoStockInstance == null) {
            notFound()
            return
        }

        if (movimientoStockInstance.hasErrors()) {
            respond movimientoStockInstance.errors, view: 'edit'
            return
        }

        movimientoStockInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoStock.label', default: 'MovimientoStock'), movimientoStockInstance.id])
                redirect movimientoStockInstance
            }
            '*' { respond movimientoStockInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoStock movimientoStockInstance) {

        if (movimientoStockInstance == null) {
            notFound()
            return
        }

        movimientoStockInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoStock.label', default: 'MovimientoStock'), movimientoStockInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoStock.label', default: 'MovimientoStock'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def stock={

def movimientos = MovimientoStock.findAllById(0)



        return [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: 0, total: 0]

    }

    def getStock = {

       if(params.idProducto && params.idProducto!='null' ) {
           def productoInstance = Producto.read(params?.idProducto as String)
           def movimientos = MovimientoStock.findAllByProducto(productoInstance, [sort: "fecha", order: "desc"])

           def ingreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                   "where ms.ingreso=true and  ms.producto = :producto",
                   [producto: productoInstance])

           def egreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                   "where ms.ingreso=false and  ms.producto = :producto",
                   [producto: productoInstance])

        def ing  = (ingreso[0])? ingreso[0]:0

           def egr  = (egreso[0])? egreso[0]:0

           def total = ing- egr

           render(template: 'movimientos', model: [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: movimientos.size(), total: total])
       }
        else {
           def movimientos = MovimientoStock.findAllById(0)

           render(template: 'movimientos', model: [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: 0, total: 0])
       }
    }

}