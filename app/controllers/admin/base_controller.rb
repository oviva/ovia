class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  
  layout "admin"
  
  def index
    @orders= Order.limit(8)
    @invisble_products = Product.invisible.count
    # @products = Product.where(:images => {:count => 0}).all.count    #need to find product with missing images
  end
  
end