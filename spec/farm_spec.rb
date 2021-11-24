require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  it "has a version number" do
    expect(Farm::VERSION).to match(/\d.\d.\d/)
  end

  describe Farm::Funcion do
    before :each do
      @funcionalidades_granja1 = Farm::Funcion.new("Regular", "Especiales", "Vivíparo")
    end

    it "Se espera un atributo para las condiciones de vida de los animales" do
      expect(@funcionalidades_granja1.vida).to eq("Regular")
    end

    it "Se espera un atributo para los tipos de cuidados que requieren los animales" do
      expect(@funcionalidades_granja1.cuidados).to eq("Especiales")
    end

    it "Se espera un atributo para la reproducción de los animales" do
      expect(@funcionalidades_granja1.reproduccion).to eq("Vivíparo")
    end
  end

  describe Farm::Datos do
  end
end