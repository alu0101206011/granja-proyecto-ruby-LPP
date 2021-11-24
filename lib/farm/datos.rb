module Farm
  class Datos
    attr_reader :id, :nombre, :tipo, :descripcion
    def initialize(id, nombre, tipo, descripcion)
      @id = id
      @nombre = nombre
      @tipo = tipo
      @descripcion = descripcion
    end

    def to_s 
      return "Identificador de la granja: #{id}\nNombre de la granja: #{nombre}\nTipo de granja: #{tipo}\nDescripción: #{descripcion}"
    end    
  end
end