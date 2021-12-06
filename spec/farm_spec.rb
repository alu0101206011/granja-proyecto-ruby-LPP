require 'spec_helper'

RSpec.describe Farm do
  context "Versión de la gema:" do
    it "Tiene numero de versión del modo X.Y.Z" do
      expect(Farm::VERSION).to match(/\d.\d.\d/)
    end
  end
end