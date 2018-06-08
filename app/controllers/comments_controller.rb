class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create, :update, :edit, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :move_to_index

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        respond_to do |format|
          format.html { redirect_to "/prototypes/#{@comment.prototype.id}" }
          format.json
        end
      else
        redirect_to "/prototypes/#{@prototype.id}"
      end
  end

  def edit

  end

  def update
    if @comment.user_id == current_user.id
      @comment.update(comment_params)
      redirect_to "/prototypes/#{@comment.prototype.id}"
    else
      redirect_to action: "edit", alert: 'Delete failed'
    end
  end

  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to "/prototypes/#{@comment.prototype.id}", alert: 'successfully deleted'
    end
  end

  private
    def move_to_index
      redirect_to new_user_session_path unless user_signed_in?
    end

    def comment_params
      params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id:current_user.id)
    end

    def set_prototype
      @prototype = Prototype.find(params[:prototype_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
  end
end
