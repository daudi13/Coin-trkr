require 'rails_helper'

RSpec.describe 'Exchanges', type: :request do
  before(:each) do
    @candy = User.create(name: 'Candy', email: 'candy@gmail.com', password: '123456')
    sign_in @candy

    @cat1 = Category.create(name: 'Category_1', icon: 'icon_1', user_id: @candy.id)
    @ex1 = Exchange.create(name: 'C&A', amount: 39.95, author_id: @candy.id)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      @cat1.exchanges << @ex1
      get category_exchanges_path @cat1
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_exchange_path @cat1
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        { name: 'C&A', amount: 39.95, author_id: @candy.id }
      end

      it 'redirects to the created exchange' do
        post category_exchanges_path @cat1, params: { exchange: valid_attributes }
        expect(response).to redirect_to(category_exchanges_path(@cat1))
      end
    end
  end
end
