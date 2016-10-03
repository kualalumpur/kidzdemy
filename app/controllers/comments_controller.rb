class CommentsController < ApplicationController

  before_action :authenticate_user!
  
  def create

    @comment = current_user.comments.build(comment_params.merge(event_id: params[:event_id]))

    if @comment.save
      flash[:success] = "You've created a new comment."
      redirect_to event_path(id: @comment.event_id)
    else
      flash[:danger] = @comment.errors.full_messages
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.destroy
      flash[:success] = "You've deleted the comment."
      redirect_to event_path(id: @comment.event_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
