require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  describe Farm::Funcion do
    context "Interfaz de las funcionalidades - Farm::Funcion" do
      context "Componentes del módulo Funcion" do
        it "Existe un módulo para almacenar las funcionalidades" do
          expect(Farm::Funcion).to be_instance_of(Module)
        end
      end
    end
  end
end