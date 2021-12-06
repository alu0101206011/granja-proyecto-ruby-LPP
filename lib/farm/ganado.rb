# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Ganado
  # Contiene información sobre el ganado. Es una clase heredada de Animal.
  class Ganado < Animal
    include Comparable
    attr_reader :raza, :aprovechamiento, :alimentacion

    # Constructor
    # Usando super podemos usar los atributos del padre
    # @param [raza] integer Contiene la representación de la raza del animal
    # @param [aprovechamiento] string Contiene la representación del tipo de aprovechamiento (carne, piel, leche)
    # @param [alimentacion] string Contiene la representación del tipo de alimentación (herbívoro u omnívoro)
    def initialize(id, edad, sexo, peso, raza, aprovechamiento, alimentacion)
      super(id, edad, sexo, peso)
      @raza = raza
      @aprovechamiento = aprovechamiento
      @alimentacion = alimentacion
    end

    def to_s 
      super + "\nGanado de raza: #{raza}\nTipo de aprovechamiento: #{aprovechamiento}\nTipo de alimentación #{alimentacion}"
    end

    def <=>(other)
      return edad <=> other.edad
    end
  end
end