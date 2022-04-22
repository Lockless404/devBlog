class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post, foreign_key: 'author_id'
  has_many :comment, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  ROLES = %w[admin User].freeze

  def last_three_posts
    Post.all.where("author_id = #{id}").limit(3).order(created_at: :desc)
  end
end
