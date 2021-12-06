# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Animal
  # Contiene información sobre animales
  class Animal
    attr_reader :id, :edad

    # Constructor
    # @param [id] integer Contiene el identificador del animal
    # @param [edad] integer Contiene la edad del animal en días
    def initialize(id, edad)
      @id = id
      @edad = edad
    end
  end
end