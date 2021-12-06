require 'spec_helper'
require './lib/farm/animal'

RSpec.describe Farm do
  context "Representación de un Animal - Farm::Animal" do
    describe Farm::Animal do
      before :each do
        @animal1 = Farm::Animal.new(1, 400, "M", 10000)
        @animal2 = Farm::Animal.new(2, 30, "F", 3000)
      end  
      
      context "Atributos de instancia de la clase Animal" do
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
      end

      context "Atributos de clase de la clase Animal" do
        it "Se espera contar el número de objetos que se han instanciado de Animal" do
          expect(Farm::Animal.animal_count).to eq(12)
        end
      end

      context "Métodos de instancia de la clase Animal" do
        it "Se espera una string con la información del animal correctamente formateada" do
          expect(@animal1.to_s).to eq("Animal con id: 1\nEdad (días): 400\nSexo: M\nPeso (gramos): 10000")
        end

        it "Se espera que los animales sean comparables por su peso." do
          expect(@animal1 < @animal2).to eq(false)
        end
      end

      context "Herencia de la clase Animal" do 
        it "Se espera que una instancia de la clase Animal sea un Animal" do
          expect(@animal1).to be_instance_of(Farm::Animal)
        end

        it "Se espera que una instancia de la clase Animal sea un objeto (Object)" do
          expect(@animal1.is_a? Object).to be(true)
        end

        it "Se espera que una instancia de la clase Animal sea un objeto básico (BasicObject)" do
          expect(@animal1.is_a? BasicObject).to be(true)
        end

        it "No se espera que una instancia de la clase Animal sea una cadena (String)" do
          expect(@animal1.is_a? String).not_to be(true)
        end

        it "No se espera que una instancia de la clase Animal sea un número (Numeric)" do
          expect(@animal1.is_a? Numeric).not_to be(true)
        end
      end
    end
  end
end