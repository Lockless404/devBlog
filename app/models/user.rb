class User < ApplicationRecord
  has_many :post, foreign_key: 'author_id'
  has_many :comment, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_three_posts
    Post.all.where("author_id = #{id}").limit(3).order(created_at: :desc)
  end
end
