module Farm
  class Funcion
    attr_reader :vida, :cuidados, :reproduccion
    def initialize(vida, cuidados, reproduccion)
      @vida = vida
      @cuidados = cuidados
      @reproduccion = reproduccion
    end
  end
end