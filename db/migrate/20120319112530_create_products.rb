class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :code
      t.text :description
      t.integer :category_id
      t.integer :user_id
      
      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :user_id
  end
end
