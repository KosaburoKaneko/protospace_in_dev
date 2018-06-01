 class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]

  def index
    @prototypes = Prototype.includes(:likes).order("created_at DESC").page(params[:page]).per(5)
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
      redirect_to action: "new", alert: 'New prototype was unsuccessfully created'
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
    if @prototype.update(prototype_params)
      redirect_to action: "show"
    else
      redirect_to action: "edit"
    end
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
      captured_images_attributes: [:content, :status, :id],
      tags_attributes: [:id, :name]
    )
  end
end
