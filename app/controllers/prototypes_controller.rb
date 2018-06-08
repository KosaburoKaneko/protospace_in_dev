 class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]

  def index
    @prototypes = Prototype.includes(:likes).order("created_at DESC").page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @prototype = Prototype.new
    @prototype.tags.build
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'プロトタイプが作成されました'
    else
      redirect_to action: "new", notice: 'プロトタイプ作成に失敗しました'
    end
  end

  def destroy
    if user_signed_in? && @prototype.user_id == current_user.id
      @prototype.destroy
    else
      redirect_to :root, notice: 'プロトタイプ削除に失敗しました'
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:id])
    @tags = @prototype.tags
    @tag = Tag.new
    @likes = @prototype.likes
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'プロトタイプが編集されました'
    else
      redirect_to @prototype, notice: 'プロトタイプ編集に失敗しました'
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
