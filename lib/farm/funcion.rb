# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Funcion
  # Contiene las funcionalidades de la granja
  class Funcion
    attr_reader :vida, :cuidados, :reproduccion

    # Constructor
    # @param [vida] string Contiene las condiciones de vida
    # @param [cuidados] string Contiene los tipos de cuidados
    # @param [reproduccion] string Contiene la reproducción 
    def initialize(vida, cuidados, reproduccion)
      @vida = vida
      @cuidados = cuidados
      @reproduccion = reproduccion
    end

    # Método que pasa el objeto Funcion a string
    def to_s 
      return "Condiciones de vida: #{@vida}\nTipos de cuidados: #{@cuidados}\nReproducción: #{@reproduccion}"
    end    
  end
end