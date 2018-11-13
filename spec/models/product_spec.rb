require 'rails_helper'

describe Product do
  let(:product) { Product.create!(name: "Yellow Shirt") }
  let(:user) { User.create!(email: "test@example.com", password: "1234") }
  before do
    product.comments.create!(rating: 1, user: user, body: "Awful shirt!")
    product.comments.create!(rating: 3, user: user, body: "Ok shirt!")
    product.comments.create!(rating: 5, user: user, body: "Great shirt!")
  end
  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq "3"
  end
end
