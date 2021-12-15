require 'spec_helper'
require './lib/farm/ganadera'

RSpec.describe Farm do
  context "Representación de una granja ganadera - Farm::Ganadera" do
    describe Farm::Ganadera do
      before :each do 
        @granja_ganadera = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene gallinas y vacas situada al norte de Tenerife.")
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
