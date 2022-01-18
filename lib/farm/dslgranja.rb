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

    def dato (texto, descripcion = {}, tipo = {})
      dato = texto
      dato << " (#{descripcion[:descripcion]})" if descripcion[:descripcion]
      dato << " (#{tipo[:tipo]})" if tipo[:tipo]
      @datos << dato      
    end

    def ejemplar (texto, edad = {}, peso = {}, precio_compra = {}, precio_venta = {})
      ejemplar = texto
      ejemplar << " (#{edad[:edad]})" if edad[:edad]
      ejemplar << " (#{peso[:peso]})" if peso[:peso]
      ejemplar << " (#{precio_compra[:precio_compra]})" if precio_compra[:precio_compra]
      ejemplar << " (#{precio_venta[:precio_venta]})" if precio_venta[:precio_venta]
      @ejemplares << ejemplar      
    end

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