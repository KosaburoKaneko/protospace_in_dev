require 'rails_helper'

describe PrototypesController do
  context 'POST #create' do
    it "saves the new prototype in the database" do
      expect{
        post :create, prototype: attributes_for(:prototype)
      }.to change(Prototype, :count).by(1)
    end
    it "redirects to prototypes#index" do
      post :create, prototype: attributes_for(:prototype)
      expect(response).to redirect_to root_path
    end
  end

  context 'PATCH #update' do
    it "locates the requersted @prototype" do
      prototype = create(:prototype)
      patch :update, id: prototype, prototype: attributes_for(:prototype)
      expect(assigns(:prototype)).to eq prototype
    end

    it "changes @prototype's attributes" do
      prototype = create(:prototype)
      patch :update, id: prototype, prototype: attributes_for(:prototype, title: 'hoge', catch_copy: 'hogehoge')
      prototype.reload
      expect(prototype.title).to eq("hoge")
      expect(prototype.catch_copy).to eq("hogehoge")
    end

    it "redirects to prototype_path" do
      prototype = create(:prototype)
      patch :update, id: prototype, prototype: attributes_for(:prototype)
      expect(response).to redirect_to prototype_path(prototype)
    end
  end

  context 'delete #destroy' do #FIXME
    it "deletes the prototype" do
      prototype = create(:prototype)
      expect{
        delete :destroy, id: prototype
      }.to change(Prototype,:count).by(-1)
    end
  end
end
