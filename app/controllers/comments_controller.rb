class CommentsController < ApplicationController
  def new; end

  def create; end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
