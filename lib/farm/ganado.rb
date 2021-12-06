# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Ganado
  # Contiene información sobre el ganado. Es una clase heredada de Animal.
  class Ganado < Animal
    attr_reader :raza, :aprovechamiento

    # Constructor
    # Usando super podemos usar los atributos del padre
    # @param [raza] integer Contiene la representación de la raza del animal
    # @param [aprovechamiento] string Contiene la representación del tipo de aprovechamiento 
    def initialize(id, edad, sexo, peso, raza, aprovechamiento)
      super(id, edad, sexo, peso)
      @raza = raza
      @aprovechamiento = aprovechamiento
    end
  end
end