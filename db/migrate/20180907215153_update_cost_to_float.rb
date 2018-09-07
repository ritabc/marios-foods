class UpdateCostToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :cost, :float
  end
end
