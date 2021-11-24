module Farm
  class Datos
    attr_reader :id, :nombre, :tipo, :descripcion
    def initialize(id, nombre, tipo, descripcion)
      @id = id
      @nombre = nombre
      @tipo = tipo
      @descripcion = descripcion
    end
  end
end