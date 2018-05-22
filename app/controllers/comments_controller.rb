class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create, :new, :update, :edit, :destroy]
  before_action :set_comment, only: [:edit, :update,:destroy]
  before_action :move_to_index, except: :new

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to "/prototypes/#{@comment.prototype.id}"
      else
        redirect_to action: "new", alert: 'YNew comment was unsuccessfully created'
      end
  end

  def edit

  end

  def update
    if comment.user_id == current_user.id
      @prototype.comment.update(comment_params)
    else
      redirect_to action: "edit", alert: 'Delete failed'
    end
  end

  def destroy
    if comment.user_id == current_user.id
      comment.destroy
    else
      redirect_to action: "edit", alert: 'Delete failed'
    end
  end

  private
  def move_to_index
    redirect_to prototype_path(@prototype) unless user_signed_in?
  end

  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id:current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def set_comment
    comment = Comment.find(params[:comment_id])
  end
end
