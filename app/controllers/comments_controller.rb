class CommentsController < ApplicationController
  before_action :set_prototype, only: :create, :new, :update, :edit, :destroy

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{@comment.prototype.id}"
  end

  def edit

  end

  def update
    @prototype.comment.update(comment_params)
  end

  def destroy
    @prototype.comment.destroy
  end

  private
  def comment_params
    params.permit(:comment).require(:content).merge(prototype_id: params[:prototype_id] user_id:current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
