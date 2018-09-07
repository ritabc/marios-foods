class AddProductsIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :product
  end
end
