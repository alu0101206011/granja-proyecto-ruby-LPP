# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Modulo Funcion
  # Contiene las funcionalidades de la granja
  module Funcion
    # Constantes con las condiciones de vida
    CAMPO_ABIERTO = :campo_abierto

    ESTABLO = :establo

    # Constante que contiene el sistema de gestion de los animales por jaula
    JAULA = :jaula

    # Constante que contiene el sistema de gestion de los animales por campo abierto
    CAMPO_ABIERTO = :campo_abierto

    # Procedimiento para cuidados
    # @param [integer] cantidad_antibiotico Cuanto aumentaremos la vida a nuestros queridos animales
    # @param [array] grupo Grupo de ganado
    def self.cuidados (cantidad_antibiotico, grupo)
      return grupo.map {|ganado| ganado + cantidad_antibiotico }
    end

    # Procedimiento para la reproduccion
    # @param [integer] dias Días mínimos para la reproducción
    # @param [array] grupo Grupo de ganado
    def self.reproduccion (dias, grupo)
      return grupo.select { |ganado| ganado.edad >= dias }
    end
  end
end