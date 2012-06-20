class ColorSize < ActiveRecord::Base
  belongs_to :product
  belongs_to :size
  belongs_to :color  
  validates :size_id, :color_id, :product_id, :quantity, :presence => true
end
