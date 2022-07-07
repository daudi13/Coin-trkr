require 'rails_helper'

RSpec.describe 'categories/index', type: :feature do
  before(:each) do
    @david = User.create(name: 'david', email: 'david@gmail.com',
                         password: '123456', created_at: Time.now, updated_at: Time.now)

    @cat1 = Category.create(name: 'Category_1', icon: 'https://static.thenounproject.com/png/407799-200.png',
                            user: @david)
    Category.create(name: 'Category_2', icon: 'https://static.thenounproject.com/png/407799-200.png', user: @david)

    @ex1 = Exchange.create(name: 'transaction 1', amount: '20', author: @david)
    @ex1.categories << @cat1
    @ex2 = Exchange.create(name: 'transaction 2', amount: '19', author: @david)
    @ex2.categories << @cat1

    visit new_user_session_path
    fill_in 'Email', with: 'david@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  after(:each) do
    User.destroy_all
  end

  it 'I can access this page if user is connected' do
    visit categories_path

    expect(page).to_not have_content 'TransferMoney'
    expect(page).to have_content 'CATEGORIES'
  end

  it 'I can logout form the catagories page' do
    visit categories_path

    expect(page).to_not have_content 'TransferMoney'
    expect(page).to have_content 'CATEGORIES'

    click_button 'Sign out'

    expect(page).to have_content 'TransferMoney'
    expect(page).to_not have_content 'CATEGORIES'
  end
end
