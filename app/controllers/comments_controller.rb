class CommentsController < ApplicationController

  def create
    @comment = current_user.made_comments.new(comment_params)
    set_commentable 
    if @comment.save
      check_commentable_type
    else
      flash[:errors] = @comment.errors.full_messages
      check_commentable_type
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_commentable
    if params[:user_id]
      @comment.commentable_id = params[:user_id]
      @comment.commentable_type = "User"
    else
      @comment.commentable_id = params[:goal_id]
      @comment.commentable_type = "Goal"
    end
  end

  def check_commentable_type
    if @comment.commentable_type == "User"
      redirect_to user_url(@comment.commentable_id)
    else
      redirect_to goal_url(@comment.commentable_id)
    end
  end
end
