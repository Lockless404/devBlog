class User < ApplicationRecord
  has_many :post, foreign_key: 'author_id'
  has_many  :comment, foreign_key: 'author_id'
  has_many  :likes, foreign_key: 'author_id'

  def last_three_posts
    Post.all.where("author_id = #{self.id}").limit(3).order(created_at: :desc)
  end
end