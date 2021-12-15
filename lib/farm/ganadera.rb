# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Ganadera
  # Clase para representar Ganadera
  class Ganadera < Datos
    attr_reader :tipo_ganado

    # Constructor
    # Usando super podemos usar los atributos del padre
    # @param [string] tipo_ganado Contiene el tipo de ganado que se encuentra en la granja
    def initialize(id, nombre, tipo, descripcion, tipo_ganado) 
      super(id, nombre, tipo, descripcion)
      @tipo_ganado = tipo_ganado
    end
  end
end