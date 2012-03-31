class ProductOptionVariation < ActiveRecord::Base
  
  belongs_to :product_option  
  validates :name,        :presence => true
  
end
