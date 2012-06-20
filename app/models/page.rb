class Page < ActiveRecord::Base
  
  validates :name,        :presence => true
  validates :content,     :presence => true
  
  extend FriendlyId
  friendly_id :name, use: :slugged                       
end
