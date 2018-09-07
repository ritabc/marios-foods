class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :created_at, :datetime
    add_column :products, :updated_at, :datetime
    add_column :reviews, :created_at, :datetime
    add_column :reviews, :updated_at, :datetime
  end
end
