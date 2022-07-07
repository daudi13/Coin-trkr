require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @david = User.create(name: 'david', email: 'david@gmail.com', password: '123456')
    sign_in @david
    get categories_url
  end

  describe 'GET /index' do
    it 'gets the index page' do
      expect(response).to have_http_status :ok
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

    it 'should have some html' do
      expect(response.body).to include '<section class="categories-section">'
    end
  end

  describe ' GET /categories/new' do
    before(:example) { get new_category_path }
    it 'should redirect to add category page' do
      expect(response).to have_http_status :ok
    end

    it 'should render category page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include '<h2 class="category_form_heading text_white text-center">Create New Category</h2>'
    end
  end

  describe 'should create category' do
    before(:each) do
      @category = Category.create(name: 'Shoes', icon: 'S', user_id: @david.id)
    end
    it 'should create new category' do
      expect(@category).to be_valid
    end

    it 'should be of the person of id' do
      expect(@david.categories.count).to be 1
      @category.destroy
      expect(@david.categories.count).to be 0
    end
  end

  describe 'should not beacuse invali entry' do
    before(:each) do
      @category = Category.create(name: 'Shoes', user_id: @david.id)
    end
    it 'should be invalid' do
      expect(@category).not_to be_valid
    end
  end
end
