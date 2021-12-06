require 'spec_helper'
require './lib/farm/animal'

RSpec.describe Farm do
  context "Representación de un Animal - Granja::Animal\n" do
    describe Farm::Animal do
      before :each do
        @animal1 = Farm::Animal.new(1, 400, "M")
      end  
      it "Tiene una clase para representar animales" do
        expect(@animal1).not_to be_nil
        expect(@animal1).to be_kind_of(Farm::Animal)
      end

      it "Tiene un atributo para identificar al animal" do
        expect(@animal1.id).to eq(1)
      end
      
      it "Tiene un atributo para representar la edad del animal en días" do
        expect(@animal1.edad).to eq(400)
      end

      it "Tiene un atributo para representar el sexo del animal" do
        expect(@animal1.sexo).to eq("M")
      end
    end
  end
end