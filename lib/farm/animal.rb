# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Animal
  # Contiene información sobre animales
  class Animal
    attr_reader :id, :edad, :sexo

    # Constructor
    # @param [id] integer Contiene el identificador del animal
    # @param [edad] integer Contiene la edad del animal en días
    # @param [sexo] string Contiene el sexo del animal
    def initialize(id, edad, sexo)
      @id = id
      @edad = edad
      @sexo = sexo
    end
  end
end