RSpec.describe Farm do
  it "has a version number" do
    expect(Farm::VERSION).to match(/\d.\d.\d/)
  end


end
