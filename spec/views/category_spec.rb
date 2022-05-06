require 'rails_helper'

RSpec.describe 'categories', type: :feature do
  describe 'category' do
    before(:each) do
      visit root_path
      click_link 'LOG IN'
      @user = User.create(id: 1, name: 'user', email: 'user@user.com', password: '123456')
      @category = Category.create(user: @user, name: 'category1', icon: 'roomi-burger.png')

      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'displays name of the category' do
      expect(page).to have_content('category1')
    end

    it 'displays total' do
      expect(page).to have_content('0')
    end

    it 'displays Add new category' do
      expect(page).to have_content 'ADD CATEGORY'
    end
  end
end
