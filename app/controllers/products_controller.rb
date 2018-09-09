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
      flash[:notice] = "Product was not added. Please enter values for each field"
      redirect_to products_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to product_path(@product)
    else
      flash[:notice] = "Product was not updated. Please enter values for each field"
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Product successfully deleted!"
      redirect_to products_path
    end
  end

  def local
    @local_products = Product.from_the_pnw

  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :state_of_origin)
  end
end
