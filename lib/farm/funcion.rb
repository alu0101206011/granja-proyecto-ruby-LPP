# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Modulo Funcion
  # Contiene las funcionalidades de la granja
  module Funcion
    # Constante con las condiciones de vida
    CONDICIONES_VIDA = ["campo abierto", "establo"]
    JAULA = :jaula
    CAMPO_ABIERTO = :campo_abierto

    # Procedimiento para cuidados
    # @param [integer] valor Cuanto aumentaremos la vida a nuestros queridos animales
    # @param [array] grupo Grupo de ganado
    def self.cuidados (valor, grupo)
      return grupo.map {|element| element + valor}
    end

    # Procedimiento para la reproduccion
    def self.reproduccion (estado)
      return estado
    end
  end
end