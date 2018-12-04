require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) { Product.create!(name: "Yellow Shirt", description: "This shirt is yellow", image_url: "yellowshirt.jpg", color: "Yellow", price: 1000) }

  describe 'GET #show' do
    it 'loads correct product details' do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq product
    end
  end
end
