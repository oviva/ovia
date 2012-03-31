class ProductOption < ActiveRecord::Base
  
  has_many :product_option_variations, :dependent => :destroy   
    
  validates :name,        :presence => true
  
end
