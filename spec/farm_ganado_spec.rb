require 'spec_helper'
require './lib/farm/ganado'

RSpec.describe Farm do
  context "Representación de un ganado - Farm::Ganado" do
    describe Farm::Ganado do
      before :each do
        @ganado1 = Farm::Ganado.new(1, 400, "M", 15000, "caprino")
      end  
      
      context "Atributos de la clase Ganado" do
        it "Tiene una clase para representar ganado" do
          expect(@ganado1).to be_kind_of(Farm::Ganado)
        end

        it "Tiene un atributo para representar la raza (bovino, porcino, ovino o caprino)" do
          expect(@ganado1.raza).to eq("caprino")
        end

        it "Tiene un atributo para el tipo de aprovechamiento (carne, piel, leche)" do
          expect(@ganado1.aprovechamiento).to eq("leche")
        end
        

      end
        
    end
  end
end