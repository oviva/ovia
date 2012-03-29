class Product < ActiveRecord::Base
  #attr_accessible :name, :code, :price, :quantity, :description, :category_id
  
  belongs_to :category
  belongs_to :user
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images  
  
  validates :name,        :presence => true  
  validates :code,        :presence => true,
                          :numericality => { :only_integer => true }                          
  validates :price,       :presence => true,
                          :numericality => true
  validates :description, :presence => true, 
                          :length => { :maximum => 140 }
  validates :category_id, :presence => true
    
  default_scope :order => 'products.created_at DESC'
end
