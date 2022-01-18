require 'spec_helper'
require './lib/farm/dslgranja'



RSpec.describe Farm do
  describe Farm::DSLGranja do 
    before :each do
      @granja_1 = Farm::DSLGranja.new() do

      end
    end
    context "Atributos de la clase DSLGranja" do
      it "Tiene una clase para almacenar los datos de la granja." do
        expect(@granja_1).to be_instance_of(Farm::DSLGranja)
      end
      
      it "Tiene un método para los datos"  do
        @granja1 = Farm::DSLGranja.new(12345678) do
          datos "Pollos muertos",
          :descripcion => "PyME - Pequeña y mediana empresa",
          :tipo => :pollos
        end
        expect(@granja1)
      end
    end

  end
end