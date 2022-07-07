require 'rails_helper'

RSpec.describe Slot, type: :model do
  before(:each) do
    @david = User.create(name: 'david', email: 'david@gmail.com', password: '123456')
    expect(@david).to be_valid
    @shoes_category = Category.create(name: 'Shoes', icon: 'S', user_id: @david.id)
    @exchange = Exchange.create(name: 'Shoes', amount: 'S', author_id: @david.id)
    @slot = Slot.create(category_id: @shoes_category.id, exchange_id: @exchange.id)
  end

  after(:each) do
    User.destroy_all
    Slot.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@slot).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:exchange) }
  end
end
