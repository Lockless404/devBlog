require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Jon Doe', photo: 'https://jondoe.com/photos/sexyboi', bio: 'Being Lost')
  post = Post.new(title: 'Being Lost', text: 'Hi there, im lost', author: user)
  subject do
    Comment.new(author: user, post:, text: 'noice')
  end

  it 'Varify comment text' do
    subject.text = 'noice'
    expect(subject).to be_valid
  end
end
