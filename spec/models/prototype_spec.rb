require 'rails_helper'

describe Prototype do
  describe '#create' do
    it "is valid prototype" do
      expect(build(:prototype)).to be_valid 
    end
  end
end
