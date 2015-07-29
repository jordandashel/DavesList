require 'rspec'
require_relative '../Validator'

describe "validator" do
  describe "#has_title" do
    context "empty title" do
      it "should be false" do
        params = {:title => ""}
        expect(Validator.has_title?(params)).to be_falsey
      end
    end
    context "valid title" do
      it "should be true" do
        params = {:title => "Nathan"}
        expect(Validator.has_title?(params)).to be_truthy
      end
    end
  end
end
