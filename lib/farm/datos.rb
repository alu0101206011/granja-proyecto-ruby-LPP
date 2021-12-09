# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Datos
  # Contiene la información de la granja.
  class Datos
    attr_reader :id, :nombre, :tipo, :descripcion
    
    # Constructor
    # @param [integer] id Contiene el identificador de la granja
    # @param [string] nombre Contiene el nombre de la granja
    # @param [string] tipo Contiene el tipo de granja
    # @param [string] descripcion Contiene una descripcion sobre la granja
    def initialize(id, nombre, tipo, descripcion)
      @id = id
      @nombre = nombre
      @tipo = tipo
      @descripcion = descripcion
    end

    # Método que pasa el objeto Datos a string
    def to_s 
      return "Identificador de la granja: #{id}\nNombre de la granja: #{nombre}\nTipo de granja: #{tipo}\nDescripción: #{descripcion}"
    end    
  end
end