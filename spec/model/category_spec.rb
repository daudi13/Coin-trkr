require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @user = User.create!(name: 'daudi')
    @categories = Category.new(author: @user, name: 'Test', icon: 'test icon')
  end

  context 'After creating a new category object' do
    it 'should be valid' do
      expect(@categories).to be_valid
    end

    it 'should have an icon' do
      @categories.icon = nil
      expect(@categories).to_not be_valid
    end

    it 'should have a name' do
      @categories.name = nil
      expect(@categories).to_not be_valid
    end
  end
end
