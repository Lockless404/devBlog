require 'rails_helper'

RSpec.describe 'user_index_path', type: :feature do
  describe 'User index page' do
    before(:each) do
      @first_user = User.create(name: 'Victor', photo: 'link', bio: 'bio', posts_counter: 3,
                                email: 'avc@gmail.com', password: 'donbaba', password_confirmation: 'donbaba')
      @second_user = User.create(name: 'Ba', photo: 'link', bio: 'bio', posts_counter: 0,
                                 email: 'ads@gmail.com', password: '123456', password_confirmation: '123456')
      @third_user = User.create(name: 'Bb', photo: 'link', bio: 'bio', posts_counter: 0,
                                email: 'sfbh@gmail.com', password: '123456', password_confirmation: '123456')

      visit('users/sign_in')
      fill_in 'Email', with: 'avc@gmail.com'
      fill_in 'Password', with: 'donbaba'
      click_button 'Log in'
    end

    it 'Check for user profile picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('link')
      end
    end

    it 'displays usernames' do
      expect(page).to have_content('Victor')
      expect(page).to have_content('Ba')
      expect(page).to have_content('Bb')
    end

    it 'displays number of posts by users' do
      expect(page).to have_content(0)
    end

    it "redirects to user's show page" do
      click_link 'Victor'
      expect(page).to have_content('Victor')
    end
  end
end
