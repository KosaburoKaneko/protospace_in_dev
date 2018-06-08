require 'rails_helper'

describe CommentsController do
  context 'POST #create' do
    it "saves the new comment in the database" do
      prototype = create(:prototype)
      user = create(:user)
      login user

      expect{
        post :create, comment: { content: "aaa", user_id: @user, prototype_id: @prototype }
      }.to change(Comment, :count).by(1)
    end
  end

  context 'delete #destroy' do #FIXME
    it "deletes the comment" do
      comment = create(:comment)
      expect{
        delete :destroy, id: comment
      }.to change(Comment,:count).by(-1)
    end
  end
end
