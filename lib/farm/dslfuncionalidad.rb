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

    # Método para introducir los beneficios
    def beneficio (granja)
      beneficio = "De la granja con id " + granja.id.to_s
      beneficio << ": " + Farm::Funcion::beneficio(granja).to_s
      @beneficios << beneficio
    end

    # Métodos para introducir el bienestar de los animales en la granja
    def bienestar (granja, condicion)
      if (condicion)
        bienestar = "De la granja con id " + granja.id.to_s
        bienestar << ": " + Farm::Funcion::bienestar(granja, condicion).to_s
        @bienestares << bienestar
      else
        raise "Debe haber una condicion de vida para los animales."
      end
    end

    # Método para introducir la productividad
    def productividad (granja, condicion)
      if (condicion)
        productividad = "De la granja con id " + granja.id.to_s
        productividad << ": " + Farm::Funcion::productividad(granja, condicion).to_s
        @productividades << productividad
      else
        raise "Debe haber una condicion de vida para los animales."
      end
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