module Farm
  class Funcion
    attr_reader :vida, :cuidados, :reproduccion
    def initialize(vida, cuidados, reproduccion)
      @vida = vida
      @cuidados = cuidados
      @reproduccion = reproduccion
    end

    def to_s 
      return "Condiciones de vida: #{@vida}\nTipos de cuidados: #{@cuidados}\nReproducción: #{@reproduccion}"
    end    
  end
end