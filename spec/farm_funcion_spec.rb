require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  describe Farm::Funcion do
    context "Interfaz de las funcionalidades - Farm::Funcion" do
      context "Componentes del módulo Funcion" do
        before :all do 
          @ganado1 = Farm::Ganado.new(1, 1333, "M", 15000, "caprino", "sacrificio", "omnívoro")
          @ganado2 = Farm::Ganado.new(2, 2535, "F", 33453, "caprino", "leche", "carnívoro")
          @ganado3 = Farm::Ganado.new(3, 124, "F", 1468, "caprino", "leche", "carnívoro")
          @ganado4 = Farm::Ganado.new(4, 3345, "M", 33218, "caprino", "sacrificio", "omnívoro")
          @grupo_caprino = [@ganado1, @ganado2, @ganado3, @ganado4]

          @ganado5 = Farm::Ganado.new(5, 1215, "F", 34246, "ovino", "leche", "herbívoro")
          @ganado6 = Farm::Ganado.new(6, 1245, "M", 3999, "ovino", "sacrificio", "herbívoro")
          @ganado7 = Farm::Ganado.new(7, 992, "M", 35353, "ovino", "sacrificio", "herbívoro")
          @ganado8 = Farm::Ganado.new(8, 2003, "F", 3400, "ovino", "leche", "herbívoro")
          @grupo_ovino = [@ganado5, @ganado6, @ganado7, @ganado8]

          @ganado9 = Farm::Ganado.new(3, 1056, "F", 345034, "porcino", "leche", "herbívoro")
          @ganado10 = Farm::Ganado.new(3, 34, "F", 4682, "porcino", "leche", "herbívoro")
          @ganado11 = Farm::Ganado.new(3, 990, "F", 8000, "porcino", "leche", "herbívoro")
          @ganado12 = Farm::Ganado.new(3, 730, "F", 89256, "porcino", "leche", "herbívoro")
          @grupo_porcino = [@ganado9, @ganado10, @ganado11, @ganado12]

          @grupo1 = [@ganado1,@ganado2]
          @grupo2 = [@ganado4, @ganado2, @ganado3, @ganado1]
          @grupo3 = [@ganado4, @ganado2, @ganado1]

          @granja_ganadera1 = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene ovejas situada al norte de Tenerife.", "ovino", "sacrificio", 4, 6.7, 20.30, @grupo_ovino)
          @granja_ganadera2 = Farm::Ganadera.new(2, "Granja Casa Jaime", "ganadera", "Granja que tiene cerdos situada en la matanza.", "porcino", "leche", 4, 4.7, 10.21, @grupo_porcino)
          @granja_ganadera3 = Farm::Ganadera.new(3, "Granja Casa Saúl", "ganadera", "Granja que tiene cabras situada en la matanza.", "caprino", "sacrificio", 4, 0.7, 4.24, @grupo_caprino)
          @cooperativa1 = [@granja_ganadera1, @granja_ganadera2, @granja_ganadera3]

        end        

        it "Existe un módulo para almacenar las funcionalidades" do
          expect(Farm::Funcion).to be_instance_of(Module)
        end

        it "Existe una constante para representar las condiciones de vida (campo abierto, establo)" do
          expect(Farm::Funcion::CAMPO_ABIERTO).to eq(:campo_abierto)
        end

        it "Existe una constante para representar el sistema de gestión por jaulas" do
          expect(Farm::Funcion::JAULA).to eq(:jaula)
        end

        it "Existe una constante para representar el sistema de gestión por campo abierto" do
          expect(Farm::Funcion::CAMPO_ABIERTO).to eq(:campo_abierto)
        end

        it "Existe un procedimiento para establecer los cuidados de los animales" do
          @ganadoCuidado1 = Farm::Ganado.new(1, 1343, "M", 15000, "caprino", "sacrificio", "omnívoro")
          @ganadoCuidado2 = Farm::Ganado.new(2, 2545, "F", 33453, "caprino", "leche", "carnívoro")
          @grupoCuidado1 = [@ganadoCuidado1, @ganadoCuidado2]

          expect(Farm::Funcion::cuidados(10,@grupo1)).to eq(@grupoCuidado1)
        end

        it "Existe un procedimiento para establecer la reproducción de los animales (24 meses)" do
          expect(Farm::Funcion::reproduccion(730,@grupo2)).to eq(@grupo3)
        end

        it "Existe un procedimiento para calcular el bienestar animal" do 
          expect(Farm::Funcion::bienestar(@granja_ganadera1, Farm::Funcion::CAMPO_ABIERTO)).to eq(45)
          expect(Farm::Funcion::bienestar(@granja_ganadera1, Farm::Funcion::JAULA)).to eq(22)
          expect(Farm::Funcion::bienestar(@granja_ganadera2, Farm::Funcion::CAMPO_ABIERTO)).to eq(45)
          expect(Farm::Funcion::bienestar(@granja_ganadera2, Farm::Funcion::JAULA)).to eq(22)
          expect(Farm::Funcion::bienestar(@granja_ganadera3, Farm::Funcion::CAMPO_ABIERTO)).to eq(84)
          expect(Farm::Funcion::bienestar(@granja_ganadera3, Farm::Funcion::JAULA)).to eq(42)
        end

        it "Existe un procedimiento para calcular el beneficio neto de una granja" do
          expect(Farm::Funcion::beneficio(@granja_ganadera1)).to eq(54.44)
          expect(Farm::Funcion::beneficio(@granja_ganadera2)).to eq(66.52)
          expect(Farm::Funcion::beneficio(@granja_ganadera3)).to eq(62.13)
        end

        it "Existe un procedimiento para calcular el indice de productividad (entre 1, 2 y 3)" do
          expect(Farm::Funcion::productividad(@granja_ganadera1, Farm::Funcion::CAMPO_ABIERTO)).to eq(2)
          expect(Farm::Funcion::productividad(@granja_ganadera2, Farm::Funcion::CAMPO_ABIERTO)).to eq(2)
          expect(Farm::Funcion::productividad(@granja_ganadera3, Farm::Funcion::CAMPO_ABIERTO)).to eq(3)
          expect(Farm::Funcion::productividad(@granja_ganadera1, Farm::Funcion::JAULA)).to eq(2)
          expect(Farm::Funcion::productividad(@granja_ganadera2, Farm::Funcion::JAULA)).to eq(2)
          expect(Farm::Funcion::productividad(@granja_ganadera3, Farm::Funcion::JAULA)).to eq(2)

        end

        it "Granja con mayor indice de productividad dentro de una cooperativa" do
          expect(@cooperativa1.max_by { |granja| Farm::Funcion::productividad(granja, Farm::Funcion::CAMPO_ABIERTO) }).to eq(@granja_ganadera3)
          expect(@cooperativa1.max_by { |granja| Farm::Funcion::productividad(granja, Farm::Funcion::JAULA) }).to eq(@granja_ganadera1)
        end

        it "Se espera que el precio de la cooperativa aumente de forma proporcional al de máximo indicador de productividad" do
          @granja_ganadera4 = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene ovejas situada al norte de Tenerife.", "ovino", "sacrificio", 4, 6.7, 22.42, @grupo_ovino)
          @granja_ganadera5 = Farm::Ganadera.new(2, "Granja Casa Jaime", "ganadera", "Granja que tiene cerdos situada en la matanza.", "porcino", "leche", 4, 4.7, 12.33, @grupo_porcino)
          @granja_ganadera6 = Farm::Ganadera.new(3, "Granja Casa Saúl", "ganadera", "Granja que tiene cabras situada en la matanza.", "caprino", "sacrificio", 4, 0.7, 6.36, @grupo_caprino)
          @cooperativaProporcion = [@granja_ganadera4, @granja_ganadera5, @granja_ganadera6]

          maxProdGranja = @cooperativa1.max_by {|granja| Farm::Funcion::productividad(granja, Farm::Funcion::CAMPO_ABIERTO)}
          proporcion = (maxProdGranja.precio_venta / 2)
          expect(@cooperativa1.collect { |granja| granja = granja + proporcion }).to eq(@cooperativaProporcion)
        end
      end

      context "Herencia del módulo Funcion" do
        it "Se espera que sea un objeto de la clase Module" do
          expect(Farm::Funcion).to be_instance_of(Module)
        end
        it "Se espera que sea un objeto (Object)" do
          expect(Farm::Funcion).to be_kind_of(Object)
        end
        it "Se espera que sea un objeto básico (BasicObject)" do
          expect(Farm::Funcion).to be_kind_of(BasicObject)
        end
        it "No se espera que sea una instancia de la clase que representa una cadena (String)" do
          expect(Farm::Funcion).not_to be_kind_of(String)
        end
        it "No se espera que sea una instancia de la clase que representa un número (Numeric)" do
          expect(Farm::Funcion).not_to be_kind_of(Numeric)
        end        
      end
    end
  end
end