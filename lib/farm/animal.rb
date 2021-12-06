# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Animal
  # Contiene información sobre animales
  class Animal
    attr_reader :id

    # Constructor
    # @param [id] integer Contiene el identificador del animal
    def initialize(id)
      @id = id
    end
  end
end