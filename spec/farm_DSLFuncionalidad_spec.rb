require 'spec_helper'
require './lib/farm/dslfuncionalidades'

RSpec.describe Farm do
  describe Farm::DSLFuncionalidades do 
    before :each do
      @granja1 = Farm::DSLGranja.new(12345678) do
        dato "Pollos muertos",
        :descripcion => "PyME - Pequeña y mediana empresa",
        :tipo => :pollos
        ejemplar "12345678-00000001",
        :edad => 365,
        :peso => 700.2,
        :precio_compra => 4.25,
        :precio_venta => 4.75
        ejemplar "12345678-00000002",
        :edad => 465,
        :peso => 1200.2,
        :precio_compra => 1.25,
        :precio_venta => 2.75
      end      
    end      
    context "Atributos de la clase DSLFuncionalidad" do
      it "Tiene una clase para almacenar las funcionalidades de la granja" do
        @funcionalidad = Farm::DSLFuncionalidades.new(12345678)
        expect(@funcionalidad).to be_instance_of(Farm::DSLFuncionalidades)
      end

      it "Tiene un método para calcular el beneficio de una granja" do
        funcionalidad = Farm::DSLFuncionalidad.new(12345678) do
          beneficio @granja_1
        end        
      end
    end
  end
end