class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.post
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment
  end
end
