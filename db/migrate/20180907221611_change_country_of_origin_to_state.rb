class ChangeCountryOfOriginToState < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :country_of_origin, :state_of_origin
  end
end
