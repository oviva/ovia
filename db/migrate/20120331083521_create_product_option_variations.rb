class CreateProductOptionVariations < ActiveRecord::Migration
  def change
    create_table :product_option_variations do |t|
      t.string :name
      t.integer :product_option_id
      t.timestamps
    end
    add_index :product_option_variations, :product_option_id
  end
end
