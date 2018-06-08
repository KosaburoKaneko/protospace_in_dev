require 'rails_helper'

describe Tag do
  describe '#create' do
    it "is valid tag" do
      expect(build(:tag)).to be_valid 
    end
  end
end
