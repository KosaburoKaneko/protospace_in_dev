class LikesController < ApplicationController

  def create
   @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
   # likes_selectedとprototypes_allを/concern/common.rbにて定義
   likes_selected
   prototypes_all
  end

  def destroy
   like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
   like.destroy
   likes_selected  
   prototypes_all
  end
end


