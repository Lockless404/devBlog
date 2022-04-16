class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.post
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_path(current_user.id)
    else
      flash.now[:error] = 'Post not saved'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
