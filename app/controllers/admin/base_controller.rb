class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  
  layout "admin"
  
  def index    
  end
  
end