class Image < ActiveRecord::Base
  belongs_to :product 
  has_attached_file :image, :path => ":rails_root/images/:id",
                            :url => "/images/:id"
end
