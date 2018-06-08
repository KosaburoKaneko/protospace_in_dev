require 'rails_helper'

describe TagsController do
  context 'POST #create' do
    it "saves the new contact in the database" do
      @prototype = create(:prototype)
      expect{
        post :create, tag: { name: "aaa", prototype_ids: [@prototype] }
      }.to change(Tag, :count).by(1)
    end
  end

  context 'delete #destroy' do #FIXME
    it "deletes the tag" do
      tag = create(:tag)
      expect{
        delete :destroy, id: tag
      }.to change(Tag,:count).by(-1)
    end
  end
end
