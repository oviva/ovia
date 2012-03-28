class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.datetime :image_updated_at
      t.integer :product_id
      
      t.timestamps
    end
    [:image_file_name,
    :image_file_size,
    :image_content_type,
    :image_updated_at].each do |column|
    remove_column :products, column
    end
  end
end
