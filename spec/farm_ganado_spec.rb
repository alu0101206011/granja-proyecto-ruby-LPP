require 'spec_helper'
require './lib/farm/ganado'

RSpec.describe Farm do
  context "Representación de un ganado - Farm::Ganado" do
    describe Farm::Ganado do
      before :each do
        @ganado1 = Farm::Ganado.new(1, 400, "M", 15000, "caprino", "leche", "omnívoro")
        @ganado2 = Farm::Ganado.new(1, 235, "M", 40000, "bovino", "leche", "herbívoro")
      end  
      
      context "Atributos de instancia de la clase Ganado" do
        it "Tiene una clase para representar ganado" do
          expect(@ganado1).to be_kind_of(Farm::Ganado)
        end

        it "Tiene un atributo para representar la raza (bovino, porcino, ovino o caprino)" do
          expect(@ganado1.raza).to eq("caprino")
        end

        it "Tiene un atributo para el tipo de aprovechamiento (carne, piel, leche)" do
          expect(@ganado1.aprovechamiento).to eq("leche")
        end

        it "Tiene un atributo para su tipo de alimentación (herbívoro u omnívoro)" do
          expect(@ganado1.alimentacion).to eq("omnívoro")
        end
      end

      context "Métodos de instancia de la clase Ganado" do
        it "Se obtiene una cadena con la información del ganado correctamente formateada" do
          expect(@ganado1.to_s).to eq("Animal con id: 1\nEdad (días): 400\nSexo: M\nPeso (gramos): 15000\nGanado de raza: caprino\nTipo de aprovechamiento: leche\nTipo de alimentación omnívoro")
        end

        it "Se espera que el ganado sea comparable por su edad." do
          expect(@ganado1 < @ganado2).to eq(false)
          expect(@ganado1 >= @ganado2).to eq(true)
        end
      end

      context "Herencia de la clase Ganado" do
        it "Se espera que una instancia de la clase Ganado sea un Ganado" do
          expect(@ganado1).to be_instance_of(Farm::Ganado)
        end

        it "Se espera que una instancia de la clase Ganado sea un Animal" do
          expect(@ganado1).to be_kind_of(Farm::Animal)
        end

        it "Se espera que una instancia de la clase Ganado sea un objeto (Object)" do
          expect(@ganado1).to be_kind_of(Object)
        end

        it "Se espera que una instancia de la clase Ganado sea un objeto básico (BasicObject)" do
          expect(@ganado1).to be_kind_of(BasicObject)
        end

        it "No se espera que una instancia de la clase Ganado sea una cadena (String)" do
          expect(@ganado1).not_to be_kind_of(String)
        end

        it "No se espera que una instancia de la clase Ganado sea un número (Numeric)" do
          expect(@ganado1).not_to be_kind_of(Numeric)
        end        
      end
    end
  end
end