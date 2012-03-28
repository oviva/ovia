class Image < ActiveRecord::Base
  belongs_to :product
 
  has_attached_file :image, :path => (Rails.root + "images/:id").to_s,
                            :url => "/images/:id"
end
