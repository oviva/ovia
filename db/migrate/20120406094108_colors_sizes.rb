class ColorsSizes < ActiveRecord::Migration
  def change
    create_table :colors_sizes do |t|
      t.integer :color_id
      t.integer :size_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps      
    end
    add_index :colors_sizes, [:color_id, :size_id, :product_id]
  end
end
