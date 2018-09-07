class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :state_of_origin, presence: true
  validates :name, uniqueness: true

  scope :most_reviews, -> {(
    ## find product where product.reviews.count is highest
    select("products.id, products.name, products.cost, products.state_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :from_the_pnw, -> { where("state_of_origin = 'Oregon'")
                          .or(where("state_of_origin = 'Washington'"))
                          .or(where("state_of_origin = 'Idaho'"))
                        }
end
