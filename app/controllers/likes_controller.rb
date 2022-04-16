class LikesController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new(author_id: current_user.id, post_id: @post.id)

    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Like created' if new_like.save
  end
end
