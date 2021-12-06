# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Ganado
  # Contiene información sobre el ganado. Es una clase heredada de Animal.
  class Ganado < Animal
    attr_reader :raza

    # Constructor
    # Usando super podemos usar los atributos del padre
    # @param [raza] integer Contiene el identificador del animal
    def initialize(id, edad, sexo, peso, raza)
      super(id, edad, sexo, peso)
      @raza = raza
    end
  end
end