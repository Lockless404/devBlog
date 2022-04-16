require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Jon Doe', photo: 'https://jondoe.com/photos/sexyboi', bio: 'Being Lost')
  post = Post.create(title: 'Being Lost', text: 'Hi there, im lost', author: user)

  it 'adds likes to post' do
    Like.create(author: user, post:)
    Like.create(author: user, post:)
    Like.create(author: user, post:)
    expect(post.likes_Counter).to eq 3
  end
end
