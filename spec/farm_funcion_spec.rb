require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  describe Farm::Funcion do
    context "Interfaz de las funcionalidades - Farm::Funcion" do
      context "Componentes del módulo Funcion" do
        before :all do 
          @ganado1 = Farm::Ganado.new(1, 1333, "M", 15000, "caprino", "leche", "omnívoro")
          @ganado2 = Farm::Ganado.new(2, 235, "M", 40000, "bovino", "leche", "herbívoro")
          @grupo1 = [@ganado1, @ganado2]

          @ganado3 = Farm::Ganado.new(3, 730, "F", 40000, "bovino", "leche", "herbívoro")
          @grupo2 = [@ganado1, @ganado2, @ganado3]

          @grupo3 = [@ganado1, @ganado3]

          @granja_ganadera = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene ovejas y vacas situada al norte de Tenerife.", "ovino", "sacrificio", 3, 4.7, 10.21, @grupo2)
          @granja_ganadera1 = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene ovejas y vacas situada al norte de Tenerife.", "ovino", "leche", 3, 4.7, 10.21, @grupo2)

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
          @ganadoCuidado1 = Farm::Ganado.new(1, 1343, "M", 15000, "caprino", "leche", "omnívoro")
          @ganadoCuidado2 = Farm::Ganado.new(2, 245, "M", 40000, "bovino", "leche", "herbívoro")
          @grupoCuidado1 = [@ganadoCuidado1, @ganadoCuidado2]

          expect(Farm::Funcion::cuidados(10,@grupo1)).to eq(@grupoCuidado1)
        end

        it "Existe un procedimiento para establecer la reproducción de los animales (24 meses)" do
          expect(Farm::Funcion::reproduccion(730,@grupo2)).to eq(@grupo3)
        end

        it "Existe un procedimiento para calcular el bienestar animal" do 
          expect(Farm::Funcion::bienestar(@granja_ganadera, Farm::Funcion::CAMPO_ABIERTO)).to eq(45)
          expect(Farm::Funcion::bienestar(@granja_ganadera, Farm::Funcion::JAULA)).to eq(22)
        end

        it "Existe un procedimiento para calcular el beneficio neto de una granja" do
          expect(Farm::Funcion::beneficio(@granja_ganadera)).to eq(79.16)
          expect(Farm::Funcion::beneficio(@granja_ganadera1)).to eq(57.46)
        end

        it "Existe un procedimiento para calcular el indice de productividad (entre 1, 2 y 3)" do
          expect(Farm::Funcion::productividad(@granja_ganadera, Farm::Funcion::CAMPO_ABIERTO)).to eq(2)
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