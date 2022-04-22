class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :current_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
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

  def destroy
    @comment = Comment.find(params[:comment_id])
    post = Post.find_by(id: @comment.post_id)
    post.comments_counter -= 1
    @comment.destroy!
    post.save
    flash[:success] = 'Comment Deleted'
    redirect_to user_post_path(post.author_id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
