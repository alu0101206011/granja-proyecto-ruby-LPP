# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Modulo Funcion
  # Contiene las funcionalidades de la granja
  module Funcion
    # Constante campo abierto
    CAMPO_ABIERTO = :campo_abierto

    # Constante establo
    ESTABLO = :establo

    # Constante que contiene el sistema de gestion de los animales por jaula
    JAULA = :jaula

    # Procedimiento para cuidados
    # @param [integer] cantidad_antibiotico Cuanto aumentaremos la vida a nuestros queridos animales
    # @param [array] grupo Grupo de ganado
    def self.cuidados(cantidad_antibiotico, grupo)
      return grupo.map {|ganado| ganado + cantidad_antibiotico }
    end

    # Procedimiento para la reproduccion
    # @param [integer] dias Días mínimos para la reproducción
    # @param [array] grupo Grupo de ganado
    def self.reproduccion(dias, grupo)
      return grupo.select { |ganado| ganado.edad >= dias }
    end

    # Procedimiento para el bienestar
    # @param [class] ganado
    # @param [symbol] condicion Condiciones de vida de los animales
    def self.bienestar(ganado, condicion)
      array_ratios = ganado.censo.collect { |animal| animal.peso / animal.edad }
      mediaRatios = (array_ratios.reduce (:+)) / ganado.numero_animales
      mediaRatios * (condicion == :campo_abierto ? 100 : 50) / array_ratios.max # Si el maximo de los ratios es (100 | 50), la media de ellos es x
    end

    # Procedimiento para el beneficio
    # @param [class] ganado objeto Ganado
    def self.beneficio(ganado)
      arrayPeso = ganado.censo.collect do |i| 
        (ganado.destino == "sacrificio" ? i.peso : i.edad) / ganado.precio_venta
      end
      mediaPeso = (arrayPeso.reduce (:+)) / ganado.numero_animales
      (mediaPeso * 100 / arrayPeso.max).truncate(2)
    end

    # Procedimiento para la productividad
    # @param [class] ganado objeto Ganado
    # @param [symbol] condicion Condiciones de vida de los animales
    def self.productividad(ganado, condicion)
      indice_bienestar = bienestar(ganado, condicion) >= 80 ? 3 : bienestar(ganado, condicion) > 20 && bienestar(ganado, condicion) < 80 ? 2 : 1
      indice_beneficio = beneficio(ganado) > 50 ? 3 : beneficio(ganado) >= 10 && beneficio(ganado) <= 50 ? 2 : 1
      ((indice_bienestar + indice_beneficio) / 2).truncate(0)
    end
  end
end