# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Animal
  # Contiene información sobre animales
  class Animal
    include Comparable
    attr_reader :id, :edad, :sexo, :peso

    # Atributo de clase para contar el número de  de objetos que se instancia de la clase.
    @@animal_count = 0

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
      @@animal_count += 1
    end

    # Método que retorna un string con la información perfectamente formateada
    def to_s
      return "Animal con id: #{id}\nEdad (días): #{edad}\nSexo: #{sexo}\nPeso (gramos): #{peso}"
    end

    # Método de clase que retorna el valor del atributo de clase animal_count
    def self.animal_count
      @@animal_count
    end

    def <(other)
      return peso < other.peso
    end
  end
end