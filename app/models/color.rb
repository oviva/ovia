class Color < ActiveRecord::Base 
  has_many :color_sizes
  has_many :products, :through => :color_sizes
  validates :name,        :presence => true
  
  def to_s
    name
  end
end
