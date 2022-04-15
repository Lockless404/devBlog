class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.post
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
