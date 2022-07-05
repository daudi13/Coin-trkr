require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'daudi')
  end

  context 'After user creation ' do
    it 'should have name not empty' do
      @user.name = ''
      expect(@user).to_not be_valid
    end

    it 'should have name not longer than 50 characters' do
      @user.name = 'a' * 50
      expect(@user).to be_valid
    end

    it 'should be valid' do
      expect(@user).to be_valid
    end
  end

  context 'user is saved in database' do
    it 'should have name daudi' do
      @user.name = 'daudi'
      expect(@user).to be_valid
    end
  end
end
