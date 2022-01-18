# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase DSLFuncionalidades
  # Clase para representar las funcionalidades con DSL
  class DSLFuncionalidades
    # Constructor
    # @param [integer] id Identificador de la funcionalidad
    # @param [Farm::DSLFuncionalidades] block bloque dado para meter la información en la clase
    def initialize(id, &block)
      @id = id
      @beneficio = []
      @bienestar = []
      @producto = []

      if block_given?  
        if block.arity == 1
          yield self
        else
        instance_eval(&block) 
        end
      end
    end

    # Método para formatear la información de la clase
    def to_s

    end
  end
end