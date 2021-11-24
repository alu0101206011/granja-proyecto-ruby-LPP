require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  it "has a version number" do
    expect(Farm::VERSION).to match(/\d.\d.\d/)
  end

  describe Funcion do
    before :each do
      @condiciones_vida = Funcion.new("Regular")
    end

    it "Se espera un atributo para las condiciones de vida de los animales" do
      expect(@condiciones_vida.vida).to eq("Regular")
    end
  end
end