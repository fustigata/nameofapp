require 'rails_helper'

describe Comment do
  let(:product) { Product.create!(name: "Yellow Shirt") }
  let(:user) { FactoryBot.create(:user) }
  before do
    product.comments.create!(rating: 1, user: user, body: "Awful shirt!")
    product.comments.create!(rating: 3, user: user, body: "Ok shirt!")
    product.comments.create!(rating: 5, user: user, body: "Great shirt!")
  end
  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3.0
  end
  it "returns the highest rating of all comments" do
    expect(product.highest_rating_comment.rating).to eq 5
  end
  it "is not valid without a name" do
    expect(Product.new(description: "Nice shirt")).not_to be_valid
  end
end
