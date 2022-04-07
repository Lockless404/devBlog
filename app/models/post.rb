class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :likes

  def last_five_comments
    Comment.all.where("post_id = #{id}").limit(5).order(created_at: :desc)
  end

  def update_posts
    author.increment!(:posts_counter)
  end
end
