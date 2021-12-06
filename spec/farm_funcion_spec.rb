require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  describe Farm::Funcion do
    before :each do
      @funcionalidades_granja1 = Farm::Funcion.new("Regular", "Especiales", "Vivíparo")
    end

    context "El funcionamiento de la granja: " do
      it "Se espera un atributo para las condiciones de vida de los animales" do
        expect(@funcionalidades_granja1.vida).to eq("Regular")
      end

      it "Se espera un atributo para los tipos de cuidados que requieren los animales" do
        expect(@funcionalidades_granja1.cuidados).to eq("Especiales")
      end

      it "Se espera un atributo para la reproducción de los animales" do
        expect(@funcionalidades_granja1.reproduccion).to eq("Vivíparo")
      end

      it "Se espera que el método to_s no esté vacío" do
        expect(@funcionalidades_granja1.to_s).not_to be(nil)
      end
    end
  end
end