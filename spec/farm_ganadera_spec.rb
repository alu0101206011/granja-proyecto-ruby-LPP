require 'spec_helper'
require './lib/farm/ganadera'

RSpec.describe Farm do
  context "Representación de una granja ganadera - Farm::Ganadera" do
    describe Farm::Ganado do
      before :each do 
        @granja_ganadera = Farm::Ganadera.new()
      end
      context "Herencia de la clase Ganadera"
      it "Se espera que una instancia de la clase Ganadera sea una granja Ganadera" do
        expect(@granja_ganadera).to be_instance_of(Farm::Ganadera)
      end
    end
  end
end
