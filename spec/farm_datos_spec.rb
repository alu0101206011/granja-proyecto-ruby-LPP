require 'spec_helper'
require './lib/farm/datos'

RSpec.describe Farm do
  describe Farm::Datos do
    before :each do
      @datos_granja1 = Farm::Datos.new("121", "Granja Labrador", "Tradicional", "Granja que tiene gallinas y vacas situada al norte de Tenerife.")
    end   

    context "Representación de los Datos de una Granja - Farm::Datos" do
      context "Atributos de la clase Datos" do
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
      
      context "Herencia de la clase Datos" do
        it "Se espera que una instancia de la clase Datos sea un Datos" do
          expect(@datos_granja1).to be_instance_of(Farm::Datos)
        end

        it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
          expect(@datos_granja1).to be_kind_of(Object)
        end

        it "Se espera que una instancia de la clase Datos sea un básico (BasicObject)" do
          expect(@datos_granja1).to be_kind_of(BasicObject)
        end
        
        it "No se espera que una instancia de la clase Datos sea una cadena (String)" do
          expect(@datos_granja1).not_to be_kind_of(String)
        end

        it "No se espera que una instancia de la clase Datos sea un número (Numeric)" do
          expect(@datos_granja1).not_to be_kind_of(Numeric)
        end
      end
    end
  end
end