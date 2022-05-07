class Api::V1::PostController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
    render json: @posts
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.author_id = @user.id
    respond_to do |format|
      format.json do
        if @post.save
          render json: { success: true, message: 'Post was successfully created.' }, status: :ok
        else
          render json: { success: false, message: 'Post was not created.' }, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
