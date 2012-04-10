class Category < ActiveRecord::Base
    
  has_many :products, :dependent => :destroy
  
  validates :name,        :presence => true,
                          :length => { :maximum => 50 },
                          :uniqueness => true
                          
  validates :description, :presence => true,
                          :length => { :maximum => 160 }                
  
  default_scope :order => 'categories.created_at DESC'
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
