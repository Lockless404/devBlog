class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_likes

  def update_post_likes
    post.increment!(:like_counter)
  end
end
