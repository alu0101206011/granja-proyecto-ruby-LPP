require 'spec_helper'
require './lib/farm/funcion'
require './lib/farm/datos'

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
    before :each do
      @datos_granja1 = Farm::Datos.new("121", "Granja Labrador")
    end   

    it "Se espera un atributo que contenga la identificación la granja" do
      expect(@datos_granja1.id).to eq("121")
    end 

    it "Se espera un atributo que contenga el nombre de la granja" do
      expect(@datos_granja1.nombre).to eq("Granja Labrador")
    end
  end
end