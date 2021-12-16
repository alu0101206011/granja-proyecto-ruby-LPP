# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Ganado
  # Contiene información sobre el ganado. Es una clase heredada de Animal.
  class Ganado < Animal
    attr_reader :raza, :aprovechamiento, :alimentacion

    # Constructor
    # Usando super podemos usar los atributos del padre
    # @param [integer] raza Contiene la representación de la raza del animal
    # @param [string] aprovechamiento Contiene la representación del tipo de aprovechamiento (carne, piel, leche)
    # @param [string] alimentacion Contiene la representación del tipo de alimentación (herbívoro u omnívoro)
    def initialize(id, edad, sexo, peso, raza, aprovechamiento, alimentacion)
      super(id, edad, sexo, peso)
      @raza = raza
      @aprovechamiento = aprovechamiento
      @alimentacion = alimentacion
    end

    # Método para formatear la información de la clase
    def to_s 
      super + "\nGanado de raza: #{raza}\nTipo de aprovechamiento: #{aprovechamiento}\nTipo de alimentación #{alimentacion}"
    end

    # Método para el módulo comparable
    def <=>(other)
      return @edad <=> other.edad
    end

    # Sobrecarga del operador suma
    def +(valor)
      return Ganado.new(@id, @edad + valor, @sexo, @peso, @raza, @aprovechamiento, @alimentacion)
    end
  end
end