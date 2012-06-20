class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
       t.references :product
       t.references :order
       t.integer :quantity
      t.timestamps
    end
    add_index :order_items, :product_id
    add_index :order_items, :order_id
  end
end
