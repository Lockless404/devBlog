class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :likes
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_five_comments
    Comment.all.where("post_id = #{id}").limit(5).order(created_at: :desc)
  end

  after_save :update_posts

  private

  def update_posts
    author.increment!(:posts_counter)
  end
end
