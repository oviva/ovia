class Product < ActiveRecord::Base
  attr_accessible :name, :code, :description
  
  belongs_to :category
  belongs_to :user
  
  validates :name,        :presence => true  
  validates :description, :presence => true, :length => { :maximum => 140 }  
  validates :category_id, :presence => true
  
  default_scope :order => 'products.created_at DESC'
end
