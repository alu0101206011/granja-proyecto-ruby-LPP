require 'spec_helper'
require './lib/farm/dslfuncionalidades'

RSpec.describe Farm do
  describe Farm::DSLFuncionalidades do 
    context "Atributos de la clase DSLFuncionalidad" do
      it "Tiene una clase para almacenar las funcionalidades de la granja" do
        @granja_1 = Farm::DSLFuncionalidades.new(12345678)
        expect(@granja_1).to be_instance_of(Farm::DSLFuncionalidades)
      end
    end
  end
end