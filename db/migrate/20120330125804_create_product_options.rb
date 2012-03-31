class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.string :name
      t.integer :product_id
      t.timestamps
    end
    add_index :product_options, :product_id
  end
end
