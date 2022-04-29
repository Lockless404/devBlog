require 'rails_helper'

RSpec.describe 'post_index_route', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.create(name: 'Victor', photo: 'link', bio: 'Programmer from Nigeria', posts_counter: 0,
                                email: 'blanac@gmail.com', password: '123456', password_confirmation: '123456')
      @second_user = User.create(name: 'Jik', photo: 'link', bio: 'Software developer', posts_counter: 0,
                                 email: 'blancaa@gmail.com', password: '123456', password_confirmation: '123456')
      @third_user = User.create(name: 'Downey', photo: 'link', bio: 'downey is not junior', posts_counter: 0,
                                email: 'downeyy@gmail.com', password: '123456', password_confirmation: '123456')

      visit new_user_session_path
      fill_in 'Email', with: 'blanac@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @post = Post.create(title: 'First Post', text: 'This is the first post', comments_counter: 0, like_counter: 0,
                          author: @first_user)
      @posta = Post.create(title: 'Second Post', text: 'This is the second post', comments_counter: 0,
                           like_counter: 0, author: @second_user)
      @postb = Post.create(title: 'Third Post', text: 'This is the third post', comments_counter: 0, like_counter: 0,
                           author: @third_user)

      @commenta = Comment.create(text: 'Thy shall not find', author: User.first, post: Post.first)
      @commentb = Comment.create(text: 'Her majesty Lady Whistledown', author: User.first, post: Post.first)
      @commentc = Comment.create(text: 'It was astounding', author: User.first, post: Post.first)
      visit user_posts_path(@first_user)
    end

    it 'Check for user profile picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('link')
      end
    end

    it 'Display username' do
      expect(page).to have_content('Victor')
    end

    it 'Display Title' do
      expect(page).to have_content('First Post')
    end

    it 'Display number of posts' do
      post = Post.all
      expect(post.size).to eql(3)
    end

    it 'Display post number in counter' do
      first_user = User.first
      expect(page).to have_content(first_user.posts_counter)
    end

    it 'Displays content of the post' do
      expect(page).to have_content 'Thy shall not find'
    end

    it 'displays first comment' do
      expect(page).to have_content 'Thy shall not find'
    end

    it 'displays number of comments.' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'displays number of likes' do
      post = Post.first
      expect(page).to have_content(post.like_counter)
    end

    it 'redirects after click' do
      click_link 'This is the first post'
      expect(page).to have_current_path user_post_path(@post.author_id, @post)
    end
  end
end
