class ProductsController < ApplicationController

  def index
    @product = Product.new
    @all_products = Product.all
    render 'index'
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Product was not added. Please enter values for each field"
      redirect_to products_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :state_of_origin)
  end
end
