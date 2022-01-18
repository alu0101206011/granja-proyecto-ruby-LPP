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
      @ejemplar = []

      if block_given?  
        if block.arity == 1
          yield self
        else
        instance_eval(&block) 
        end
      end
    end

    def dato (texto, descripcion = {}, tipo = {})
      dato = texto
      dato << " (#{descripcion[:descripcion]})" if descripcion[:descripcion]
      dato << " (#{tipo[:tipo]})" if tipo[:tipo]
      @datos << dato      
    end

    def to_s
      output = @id
      output << "\n#{'=' * @id.size}\n\n"
      output << "Datos: #{@datos.join(', ')}\n\n"
  
      output
    end
  end
end