 class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new
    @prototype.tags.build
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to action: "new", alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:id])
    @tags = @prototype.tags
    @tag = Tag.new
  end

  def edit
  end

  def update
    @prototype.update(prototype_params)
    redirect_to action: "show" , notice: "編集が完了しました。"
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
      tags_attributes: [:name]
    )
  end

  # def tag_params
  #   params.require(:tag).permit(:name)
  # end
end
