require 'spec_helper'
require './lib/farm/ganadera'

RSpec.describe Farm do
  context "Representación de una granja ganadera - Farm::Ganadera" do
    describe Farm::Ganadera do
      before :each do 
        @ganado1 = Farm::Ganado.new(1, 400, "M", 15000, "caprino", "leche", "omnívoro")
        @ganado2 = Farm::Ganado.new(1, 235, "M", 40000, "bovino", "leche", "herbívoro")
        @grupo1 = [@ganado1, @ganado2]
        @granja_ganadera = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene gallinas y vacas situada al norte de Tenerife.", "ovino", "sacrificio", 2, 4.7, 10.21, @grupo1)
      end

      context "Atributos de la clase Ganadera" do
        it "Tiene una clase para almacenar los datos de la granja" do
          expect(@granja_ganadera.instance_of?Farm::Ganadera).to eq(true)
        end

        it "Tiene un atributo para el tipo de ganado (bovino, ovino, caprino o porcino)" do
          expect(@granja_ganadera.tipo_ganado).to eq("ovino")
        end

        it "Tiene un atributo para el destino de los animales (leche, sacrificio)" do
          expect(@granja_ganadera.destino).to eq("sacrificio")
        end

        it "Tiene un atributo para el número de animales de la granja" do
          expect(@granja_ganadera.numero_animales).to eq(2)
        end

        it "Tiene un atributo para el precio unitario de los animales" do
          expect(@granja_ganadera.precio_unitario).to eq(4.7)
        end

        it "Tiene un atributo para el precio de venta unitario de los animales" do
          expect(@granja_ganadera.precio_venta).to eq(10.21)
        end

        it "Tiene un atributo para almacenar los animales de la granja" do
          expect(@granja_ganadera.censo).to eq(@grupo1)
        end
      end

      context "Herencia de la clase Ganadera" do
        it "Se espera que una instancia de la clase Ganadera sea una granja Ganadera" do
          expect(@granja_ganadera).to be_instance_of(Farm::Ganadera)
        end

        it "Se espera que una instancia de la clase Ganadera sea un Dato" do
          expect(@granja_ganadera).to be_kind_of(Farm::Datos)
        end

        it "Se espera que una instancia de la clase Ganadera sea un Object" do
          expect(@granja_ganadera).to be_kind_of(Object)
        end

        it "Se espera que una instancia de la clase Ganadera sea un Basic Object" do
          expect(@granja_ganadera).to be_kind_of(BasicObject)
        end

        it "No se espera que una instancia de la clase Ganadera sea un Animal" do
          expect(@granja_ganadera).not_to be_kind_of(Farm::Animal)
        end

        it "No se espera que una instancia de la clase Ganadera sea un Ganado" do
          expect(@granja_ganadera).not_to be_kind_of(Farm::Ganado)
        end        
      end
    end
  end
end
