class TagsController < ApplicationController

  def index
    @tags = Tag.order("created_at DESC")
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    @prototype = Prototype.find(params[:prototype_id])
    redirect_to prototype_path(@prototype)
  end

  def edit
  end

  def show
    @tag = Tag.find(params[:id])
    @prototypes = @tag.prototypes
  end

  def update
  end

  def destroy
    @prototypes_tag = PrototypesTag.find_by(tag_id: params[:id], prototype_id: params[:prototype_id])
    @tag = Tag.find_by(id: params[:id])
    @prototypes_tag.destroy
    @tag.destroy
    redirect_to prototype_path(params[:prototype_id])
  end

  private
    def tag_params
      params.require(:tag).permit(:name, {prototype_ids: []})

    end
end
