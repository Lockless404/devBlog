require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Jon Doe', photo: 'https://jondoe.com/photos/sexyboi', bio: 'Being Lost')
  end

  it 'Name Should be Present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name length should be greater than 1 character' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'Photo should be Present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter should not be less than zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
