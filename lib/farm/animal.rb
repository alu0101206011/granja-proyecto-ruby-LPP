# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Animal
  # Contiene información sobre animales
  class Animal
    attr_reader :id, :edad, :sexo, :peso

    # Constructor
    # @param [id] integer Contiene el identificador del animal
    # @param [edad] integer Contiene la edad del animal en días
    # @param [sexo] string Contiene el sexo del animal
    # @param [peso] integer Contiene el peso del animal en gramos
    def initialize(id, edad, sexo, peso)
      @id = id
      @edad = edad
      @sexo = sexo
      @peso = peso
    end

    def to_s
      return "Animal con id: #{id}\nEdad (días): #{edad}\nSexo: #{sexo}\nPeso (gramos): #{peso}"
    end
  end
end