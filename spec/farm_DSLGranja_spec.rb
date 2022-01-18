require 'spec_helper'
require './lib/farm/dslgranja'



RSpec.describe Farm do
  describe Farm::DSLGranja do 
    context "Atributos de la clase DSLGranja" do
      it "Tiene una clase para almacenar los datos de la granja." do
        @granja_1 = Farm::DSLGranja.new(12345678)
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

      it "Tiene un método para los ejemplares" do
        @granja1 = Farm::DSLGranja.new(12345678) do
          ejemplar "12345678-00000001",
          :edad => 365,
          :peso => 700.2,
          :precio_compra => 4.25,
          :precio_venta => 4.75
        end
        expect(@granja1.to_s).to eq("12345678\n========\n\nEjemplares: 12345678-00000001 (365)\n\n")
      end

      it "Se obtiene una cadena con la información de la granja correctamente formateada" do
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
          expect(@granja1.to_s).to eq("12345678\n========\n\nDatos: Pollos muertos (PyME - Pequeña y mediana empresa)\n\nEjemplares: 12345678-00000001 (365), 12345678-00000002 (465)\n\n")
      end
    end

  end
end