class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
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
