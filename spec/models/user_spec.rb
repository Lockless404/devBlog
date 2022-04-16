require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Jon Doe', photo: 'https://jondoe.com/photos/sexyboi', bio: 'Being Lost')
  end

  before { subject.save }

  it 'Name Should be Present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name length should be greater than 1 character' do
    subject.name = ""
    expect(subject).to_not be_valid
  end

  it 'Photo should be Present' do
    subject.photo = nil
    expect(subject).to be_valid
  end

  it 'Posts counter should not be less than zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'last_three_posts method should return last three posts' do
    first_post = Post.create(author: subject, title: 'first post', text: '1')
    second_post = Post.create(author: subject, title: 'second post', text: '1')
    third_post = Post.create(author: subject, title: 'third post', text: '1')
    fourth_post = Post.create(author: subject, title: 'fourth post', text: '1')
    expect(subject.last_three_posts.length).to eq 3
    expect(subject.posts_counter).to eq 4
    expect(subject.last_three_posts).to include fourth_post, third_post, second_post
  end
end