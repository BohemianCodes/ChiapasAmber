require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:product) {FactoryBot.create(:product)}
  let(:user) {FactoryBot.create(:user)}
  let(:admin) {FactoryBot.create(:admin)}


  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do

    it 'renders the show template' do
      get :show, params: { id: product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new as admin' do

    before do
      sign_in admin
    end

    it 'renders new product form' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #new as logged_in user' do

    before do
      sign_in user
    end

    it 'shows flash: not authorized' do
      get :new
      expect(controller).to set_flash[:alert]
    end
  end

end
