class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :thumb
      t.integer :user_id
      
      t.timestamps
    end
    add_index :categories, :user_id
  end
end
