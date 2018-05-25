class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new
    @tag = Tag.new
    # @prototype.build_tag
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    binding.pry
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to action: "new", alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id == current_user.id
      @prototype.destroy
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:id])
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status],
      prototypes_tag_attributes: [:id]
    )
  end

  # def tag_params
  #   params.require(:tag).permit(:name)
  # end
end
