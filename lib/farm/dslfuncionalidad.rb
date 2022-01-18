require './lib/farm/funcion'

# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase DSLFuncionalidad
  # Clase para representar las funcionalidades con DSL
  class DSLFuncionalidad
    include Funcion
    # Constructor
    # @param [integer] id Identificador de la funcionalidad
    # @param [Farm::DSLFuncionalidades] block bloque dado para meter la información en la clase
    def initialize(id, &block)
      @id = id.to_s
      @beneficios = []
      @bienestares = []
      @productividades = []

      if block_given?  
        if block.arity == 1
          yield self
        else
          instance_eval(&block) 
        end
      end
    end

    def beneficio (granja)
      beneficio = "De la granja con id " + granja.id.to_s
      beneficio << ": " + Farm::Funcion::beneficio(granja).to_s
      @beneficios << beneficio
    end

    def bienestar (granja, condicion)
      bienestar = "De la granja con id " + granja.id.to_s
      bienestar << ": " + Farm::Funcion::bienestar(granja, condicion).to_s
      @bienestares << bienestar
    end

    def productividad (granja, condicion)
      productividad = "De la granja con id " + granja.id.to_s
      productividad << ": " + Farm::Funcion::productividad(granja, condicion).to_s
      @productividades << productividad
    end

    # Método para formatear la información de la clase
    def to_s
      output = @id
      output << "\n#{'=' * @id.size}\n\n"
      if (!@beneficios.empty?) 
        output << "Beneficios: #{@beneficios.join(', ')}\n\n"
      end
      if (!@bienestares.empty?) 
        output << "Diferentes bienestares: #{@bienestares.join(', ')}\n\n"
      end
      if (!@productividades.empty?) 
        output << "Diferentes productividades: #{@productividades.join(', ')}\n\n"
      end
      output      
    end
  end
end