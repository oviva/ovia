class AddMoreDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :float
    add_column :products, :quantity, :integer
    add_column :products, :visible, :boolean, :default => false
  end
end
