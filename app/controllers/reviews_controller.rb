class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @product = Product.find(@review.product_id)
    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end

  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating, :product_id)
  end
end
