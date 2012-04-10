class SlugAdd < ActiveRecord::Migration
  def self.up
    add_column :products, :slug, :string
    add_column :categories, :slug, :string
    add_column :pages, :slug, :string    
  end
end
