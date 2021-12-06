require 'spec_helper'
require './lib/farm/animal'

RSpec.describe Farm do
  context "Representación de un Animal - Granja::Animal\n" do
    describe Farm::Animal do
      before :each do
        @animal1 = Farm::Animal.new()
      end  
      it "Tiene una clase para representar animales" do
        expect(@animal1).not_to be_nil
      end
    end
  end
end