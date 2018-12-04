require 'rails_helper'

describe Product do
  let(:product) { Product.create!(name: "Yellow Shirt") }
  let(:user) { FactoryBot.create(:user) }

  it "should require a body" do
    expect(product.comments.build(rating: 1, user: user, body: "")).not_to be_valid
  end
  it "should require a user" do
    expect(product.comments.build(rating: 1, body: "nice shirt")).not_to be_valid
  end
  it "should require a product" do
    expect(Comment.new(rating: 1, user: user, body: "nice shirt")).not_to be_valid
  end
  it "should require a rating" do
    expect(product.comments.build(user: user, body: "nice shirt")).not_to be_valid
  end
  it "should require a rating that is an int" do
    expect(product.comments.build(rating: 1.1, user: user, body: "nice shirt")).not_to be_valid
  end

end
