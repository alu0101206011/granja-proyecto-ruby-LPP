require 'spec_helper'
require './lib/farm/animal'

RSpec.describe Farm do
  context "Representación de un Animal - Granja::Animal" do
    describe Farm::Animal do
      before :each do
        @animal1 = Farm::Animal.new(1, 400, "M", 10000)
      end  
      
      context "Atributos de la clase Animal" do
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

        it "Tiene un atributo para representar el peso del animal en gramos" do
          expect(@animal1.peso).to eq(10000)
        end

        it "Se espera una string con la información del animal correctamente formateada" do
          expect(@animal1.to_s).to eq("Animal con id: 1\nEdad (días): 400\nSexo: M\nPeso (gramos): 10000")
        end
      end

      context "Herencia de la clase Animal" do 
        it "Se espera que una instancia de la clase Animal sea un Animal" do
          expect(@animal1).to be_instance_of(Farm::Animal)
        end

        it "Se espera que una instancia de la clase Animal sea un objeto (Object)" do
          expect(@animal1.is_a? Object).to be(true)
        end
      end   
    end
  end
end