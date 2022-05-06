require 'rails_helper'

RSpec.describe 'Entity index page', type: :feature do
  before do
    visit root_path
    click_link 'LOG IN'
    @user = User.create(id: 1,name: 'user', email: 'user@user.com', password: '123456')
    @category = Category.create(id: 1, user: @user, name: 'category1', icon: 'roomi-burger.png')
    @purchase = Purchase.create(name: 'cheese burger', amount: 60, author_id: @user.id, category_id: @category.id)

    fill_in 'Email', with:'user@user.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'category1'
  end

  describe 'displays all purchases' do
    it 'shows entities names' do
      expect(page).to have_content('cheese burger')
    end

    it 'entities amount' do
      expect(page).to have_content(@purchase.amount)
    end
    it 'displays Add new purchase' do
        expect(page).to have_content 'ADD PURCHASE'
    end
  
  end
end