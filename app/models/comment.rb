class Comment < ApplicationRecord
  self.per_page = 5
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }
  self.per_page = 10
end
