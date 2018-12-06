require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
  end

  describe 'GET #show' do
    it 'loads correct product details' do
      get :show, params: { id: @product.id }
      expect(assigns(:product)).to eq @product
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

  #how do i make this work
  describe "EDIT #update" do
    it "updates an product with valid params" do
      post :update, params: {id: @product.id, name: "Updated name", price: 1500}
      product.reload
      expect(product.name).to eq("Updated name")
    end
  end
end
