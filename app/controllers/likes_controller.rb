class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @prototype.good(current_user)
  end

  def destroy
    @prototype = Like.find(params[:id]).prototype
    @prototype.bad(current_user)
  end
end


