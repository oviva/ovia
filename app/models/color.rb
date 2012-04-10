class Color < ActiveRecord::Base
 
  has_and_belongs_to_many :sizes

  validates :name,        :presence => true
end
