require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    user = User.create(name: 'Jon Doe', photo: 'https://jondoe.com/photos/sexyboi', bio: 'Being Lost')
    subject do
      Post.new(title: 'Being Lost', text: 'Hi there, im lost', author: user)
    end
    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title is not exceeding 250 characters' do
      subject.title = 'Nam quis nulla. Integer malesuada. In in enim a arcu imperdiet malesuada.
      Sed vel lectus. Donec odio urna, tempus molestie, porttitor ut, iaculis quis, sem. Phasellus
      rhoncus. Aenean id metus id velit ullamcorper pulvinar. Vestibulum fermentum tortor'
      expect(subject).to_not be_valid
    end

    it 'likes counter is greater than or equal to 0' do
      subject.like_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Gets last 5 comments' do
      expect(subject.last_five_comments).to eq(subject.comment.last(5))
    end
  end
end
