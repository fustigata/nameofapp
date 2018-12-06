require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
  end

  describe 'GET #index' do
    it 'shows all products' do
      get :index
      expect(response).to render_template('index')
      expect(response).to be_ok
    end
  end

  describe 'GET #show' do
    it 'loads correct product details' do
      get :show, params: { id: @product.id }
      expect(assigns(:product)).to eq @product
      expect(response).to be_ok
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new, params: { id: @product.id }
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      delete :destroy, params: { id: @product.id }
    end

    it 'destroys product' do
      expect(assigns(:product).destroyed?).to be true
    end
  end

  describe "EDIT #update" do
    it 'updates product' do
      article_params = FactoryBot.attributes_for(:product)
      expect{ patch :update, params: {id: @product.id, product: article_params }
      }.to change(Product,:count).by(0)
      expect(flash[:notice]).to eq 'Product was successfully updated.'
    end
  end
end
