
FactoryBot.define do
  sequence(:name) { |n| "shirt #{n}}" }
  factory :product do
    name
    description "A Blue Shirt"
    image_url "blueshirt.jpg"
    color "Blue"
    price 1000
  end
end
