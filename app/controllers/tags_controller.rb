class TagsController < ApplicationController

  def index
    @tags = Tag.order("created_at DESC")
  end

  def new
    @tag = Tag.new
  end

  def create
    @prototype = Prototype.find(params[:id])
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to controller: "prototypes", action: "show"
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
      params.require(:tag).permit(:name)
    end
end
