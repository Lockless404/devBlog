class Comment < ApplicationRecord
  belongs_to  :author, classname: 'user', foreign_key: 'author_id'
  belongs_to  :post
end