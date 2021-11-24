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

    it "Se espera que el método to_s no esté vacío" do
      expect(@funcionalidades_granja1.to_s).not_to be(nil)
    end
  end

  describe Farm::Datos do
    before :each do
      @datos_granja1 = Farm::Datos.new("121", "Granja Labrador", "Tradicional", "Granja que tiene gallinas y vacas situada al norte de Tenerife.")
    end   

    it "Se espera un atributo que contenga la identificación la granja" do
      expect(@datos_granja1.id).to eq("121")
    end 

    it "Se espera un atributo que contenga el nombre de la granja" do
      expect(@datos_granja1.nombre).to eq("Granja Labrador")
    end
    
    it "Se espera un atributo que contenga el tipo de granja" do
      expect(@datos_granja1.tipo).to eq("Tradicional")
    end

    it "Se espera un atributo que contenga una descripción de la granja" do
      expect(@datos_granja1.descripcion).to eq("Granja que tiene gallinas y vacas situada al norte de Tenerife.")
    end

    it "Se espera que el método to_s contenga un string" do
      expect(@datos_granja1.to_s).to eq("Identificador de la granja: 121\nNombre de la granja: Granja Labrador\nTipo de granja: Tradicional\nDescripción: Granja que tiene gallinas y vacas situada al norte de Tenerife.")
    end
  end
end