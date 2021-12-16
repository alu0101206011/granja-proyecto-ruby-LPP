# @author Anabel Díaz Labrador
# Gema Farm
module Farm
  # Clase Ganadera
  # Clase para representar Ganadera
  class Ganadera < Datos
    attr_reader :tipo_ganado, :destino, :numero_animales, :precio_unitario, :precio_venta, :censo

    # Constructor
    # Usando super podemos usar los atributos del padre
    # @param [string] tipo_ganado Contiene el tipo de ganado que se encuentra en la granja (bovino, ovino, caprino o porcino)
    # @param [string] destino Contiene el destino de los animales (leche, sacrificio)
    # @param [integer] numero_animales Contiene el numero de animales de la granja
    # @param [float] precio_unitario Contiene el precio unitario de los animales.
    # @param [float] precio_venta Contiene el precio de venta de los animales
    # @param [array] censo Contiene animales de la granja
    def initialize(id, nombre, tipo, descripcion, tipo_ganado, destino, numero_animales, precio_unitario, precio_venta, censo) 
      super(id, nombre, tipo, descripcion)
      @tipo_ganado = tipo_ganado
      @destino = destino
      @numero_animales = numero_animales
      @precio_unitario = precio_unitario
      @precio_venta = precio_venta
      @censo = censo
    end
  end
end