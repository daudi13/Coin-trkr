require 'rails_helper'

RSpec.describe Exchange, type: :model do
  before(:each) do
    @david = User.create(name: 'david', email: 'david@gmail.com', password: '123456')
    expect(@david).to be_valid
    @exchange = Exchange.create(name: 'Shoes', amount: 'S', author_id: @david.id)
  end

  after(:each) do
    User.destroy_all
    Exchange.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@exchange).to be_valid
  end

  it 'is invalid without a name' do
    @exchange.name = nil
    expect(@exchange).to_not be_valid
  end

  it 'is invalid without an amount' do
    @exchange.amount = nil
    expect(@exchange).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:categories).through(:slots) }
  end
end
