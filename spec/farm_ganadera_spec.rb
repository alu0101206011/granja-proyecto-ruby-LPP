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
      end
    end
  end
end
