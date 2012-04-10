class Size < ActiveRecord::Base
    
  has_and_belongs_to_many :colours
  
  validates :name,        :presence => true
  
end
