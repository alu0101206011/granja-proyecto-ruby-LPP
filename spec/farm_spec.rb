require 'spec_helper'
require './lib/farm/funcion'

RSpec.describe Farm do
  it "has a version number" do
    expect(Farm::VERSION).to match(/\d.\d.\d/)
  end

  describe Funcion do
  end
end
