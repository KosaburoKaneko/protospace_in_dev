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
  end

  private
    def tag_params
      params.require(:tag).permit(:name, {prototype_ids: []})

    end
end
