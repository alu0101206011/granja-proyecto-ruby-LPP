require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  describe Farm::Funcion do
    context "Interfaz de las funcionalidades - Farm::Funcion" do
      context "Componentes del módulo Funcion" do
        it "Existe un módulo para almacenar las funcionalidades" do
          expect(Farm::Funcion).to be_instance_of(Module)
        end

        it "Existe una constante para representar las condiciones de vida (campo abierto, establo)" do
          expect(Farm::Funcion::CONDICIONES_VIDA).to eq(["campo abierto", "establo"])
        end

        it "Existe un procedimiento para establecer los cuidados de los animales" do
          expect(Farm::Funcion::cuidados("Bueno")).to eq("Bueno")
        end

        it "Existe un procedimiento para establecer la reproducción de los animales" do
          expect(Farm::Funcion::reproduccion("Vivíparo")).to eq("Vivíparo")
        end
      end
      context "Herencia del módulo Funcion" do
        it "Se espera que sea un objeto de la clase Module" do
          expect(Farm::Funcion).to be_instance_of(Module)
        end
        it "Se espera que sea un objeto (Object)" do
          expect(Farm::Funcion).to be_kind_of(Object)
        end
        it "Se espera que sea un objeto básico (BasicObject)" do
          expect(Farm::Funcion).to be_kind_of(BasicObject)
        end
        it "No se espera que sea una instancia de la clase que representa una cadena (String)" do
          expect(Farm::Funcion).not_to be_kind_of(String)
        end
        it "No se espera que sea una instancia de la clase que representa un número (Numeric)" do
          expect(Farm::Funcion).not_to be_kind_of(Numeric)
        end        
      end
    end
  end
end