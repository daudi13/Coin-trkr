require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @david = User.create(name: 'david', email: 'david@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@david).to be_valid
  end

  it 'is invalid without an email' do
    @david.email = nil
    expect(@david).to_not be_valid
  end

  it 'is invalid without a password' do
    @david.password = ''
    expect(@david).to_not be_valid
  end

  it 'is invalid without a name' do
    @david.name = nil
    expect(@david).to_not be_valid
  end

  it 'is invalid if name length is more than 50 characters' do
    @david.name = 'a' * 52
    expect(@david).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:categories) }
    it { should have_many(:exchanges).with_foreign_key('author_id') }
  end
end
