module Farm
  class Datos
    attr_reader :id, :nombre, :tipo
    def initialize(id, nombre, tipo)
      @id = id
      @nombre = nombre
      @tipo = tipo
    end
  end
end