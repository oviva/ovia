class Category < ActiveRecord::Base
  
  validates :name,        :presence => true,
                          :length => { :maximum => 50 },
                          :uniqueness => "true"
                          
  validates :description, :presence => true,
                          :length => { :maximum => 160 }
end
