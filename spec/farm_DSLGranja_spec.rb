require 'spec_helper'
require './lib/farm/dslgranja'



RSpec.describe Farm do
  describe Farm::DSLGranja do 
    before :each do
      @granja_1 = Farm::DSLGranja.new(12345678) do

      end
    end
    context "Atributos de la clase DSLGranja" do
      it "Tiene una clase para almacenar los datos de la granja." do
        expect(@granja_1).to be_instance_of(Farm::DSLGranja)
      end
      
      it "Tiene un método para los datos"  do
        @granja1 = Farm::DSLGranja.new(12345678) do
          dato "Pollos muertos",
          :descripcion => "PyME - Pequeña y mediana empresa",
          :tipo => :pollos
        end
        expect(@granja1.to_s).to eq("12345678\n========\n\nDatos: Pollos muertos (PyME - Pequeña y mediana empresa)\n\n")
      end
    end

  end
end