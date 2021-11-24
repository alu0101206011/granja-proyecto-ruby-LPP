module Farm
  class Funcion
    attr_reader :vida, :cuidados
    def initialize(vida, cuidados)
      @vida = vida
      @cuidados = cuidados
    end
  end
end