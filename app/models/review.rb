class Review < ActiveRecord::Base
  belongs_to :product
  validates :author, :content_body, :rating, :product_id, presence: true
  validates :points, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  validates :content_body, length: { in: 50..250 }
end
