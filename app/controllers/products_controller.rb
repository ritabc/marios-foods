class ProductsController < ApplicationController
  def index
    @most_recent_products = Product.three_most_recent
    @most_reviewed_product = Product.most_reviews[0]
  end
end
