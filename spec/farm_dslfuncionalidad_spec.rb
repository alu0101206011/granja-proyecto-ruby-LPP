require 'spec_helper'
require './lib/farm/dslfuncionalidad'

RSpec.describe Farm do
  describe Farm::DSLFuncionalidad do 
    before :each do
      @ganado1 = Farm::Ganado.new(5, 1215, "F", 34246, "ovino", "leche", "herbívoro")
      @ganado2 = Farm::Ganado.new(6, 1245, "M", 3999, "ovino", "sacrificio", "herbívoro")
      @ganado3 = Farm::Ganado.new(7, 992, "M", 35353, "ovino", "sacrificio", "herbívoro")
      @ganado4 = Farm::Ganado.new(8, 2003, "F", 3400, "ovino", "leche", "herbívoro")
      @grupo_ovino = [@ganado1, @ganado2, @ganado3, @ganado4]
      @granja_1 = Farm::Ganadera.new(1, "Granja Labrador", "ganadera", "Granja que tiene ovejas situada al norte de Tenerife.", "ovino", "sacrificio", 4, 6.7, 20.30, @grupo_ovino)
    end      
    context "Atributos de la clase DSLFuncionalidad" do
      it "Tiene una clase para almacenar las funcionalidades de la granja" do
        @funcionalidad = Farm::DSLFuncionalidad.new(12345678)
        expect(@funcionalidad).to be_instance_of(Farm::DSLFuncionalidad)
      end

      it "Tiene un método para calcular el beneficio de una granja" do
        granja = @granja_1
        @funcionalidad = Farm::DSLFuncionalidad.new(3214) do 
          beneficio granja
        end    
        expect(@funcionalidad.to_s).to eq("3214\n====\n\nBeneficios: 54.44\n\n")
      end

      it "Tiene un método para calcular el bienestar de una granja" do
        granja = @granja_1
        @funcionalidad = Farm::DSLFuncionalidad.new(3214) do 
          bienestar granja
        end    
        expect(@funcionalidad.to_s).to eq("3214\n====\n\nBeneficios: 54.44\n\n")
      end
    end
  end
end