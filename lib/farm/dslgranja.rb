# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase DSLGranja
  # Clase para representar granjas con DSL
  class DSLGranja
    # Constructor
    # @param [integer] id Identificador de la granja
    # @param [Farm::DSLGranja] block bloque dado para meter la información en la clase
    def initialize(id, &block)
      @id = id.to_s
      @datos = []
      @ejemplares = []

      if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval(&block) 
        end
      end
    end

    # Método para introducir datos
    def dato (texto, opciones = {})
      dato = texto
      dato += " (#{opciones[:descripcion]})" if opciones[:descripcion]
      dato += " (#{opciones[:tipo]})" if opciones[:tipo]
      @datos << dato      
    end

    # Método para introducir ejemplares
    def ejemplar (texto, opciones = {})
      ejemplar = texto
      ejemplar += " (#{opciones[:edad]})" if opciones[:edad]
      ejemplar += " (#{opciones[:peso]})" if opciones[:peso]
      ejemplar += " (#{opciones[:precio_compra]})" if opciones[:precio_compra]
      ejemplar += " (#{opciones[:precio_venta]})" if opciones[:precio_venta]
      @ejemplares << ejemplar      
    end

    # Método para formatear la información de la clase.
    def to_s
      output = @id
      output << "\n#{'=' * @id.size}\n\n"
      if (!@datos.empty?) 
        output << "Datos: #{@datos.join(', ')}\n\n"
      end
      if (!@ejemplares.empty?) 
        output << "Ejemplares: #{@ejemplares.join(', ')}\n\n"
      end
      output
    end
  end
end