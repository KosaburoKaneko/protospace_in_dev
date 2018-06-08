class LikesController < ApplicationController
  before_action :set_likes, :set_prototypes

  def create
   @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def destroy
   like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
   like.destroy
  end

  private

  def set_likes
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def set_prototypes
    @prototypes = Prototype.all
  end
end


