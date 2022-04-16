class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @comment = current_user.comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
    else
      flash.now[:error] = 'Comment not saved'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
