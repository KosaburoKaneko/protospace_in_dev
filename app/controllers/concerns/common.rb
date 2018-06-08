module Common
  extend ActiveSupport::Concern

  def likes_selected
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def prototypes_all
    @prototypes = Prototype.all
  end
end
