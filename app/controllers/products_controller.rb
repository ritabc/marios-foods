class ProductsController < ApplicationController

  def index
    @product = Product.new
    @all_products = Product.all
    render 'index'
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to 'index'
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :state_of_origin)
  end
end
