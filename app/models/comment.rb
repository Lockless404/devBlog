class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments

  def update_post_comments
    post.increment!(:comments_counter)
  end
end
