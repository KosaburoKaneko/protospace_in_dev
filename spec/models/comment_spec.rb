require 'rails_helper'

describe Comment do
  describe '#create' do
    it "is valid comment" do
      expect(build(:comment)).to be_valid 
    end
  end
end
