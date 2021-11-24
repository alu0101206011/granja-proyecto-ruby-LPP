module Farm
  class Datos
    attr_reader :id, :nombre
    def initialize(id, nombre)
      @id = id
      @nombre = nombre
    end
  end
end