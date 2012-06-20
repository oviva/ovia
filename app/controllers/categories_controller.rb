class CategoriesController < ApplicationController    
  
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @title = @category.name
    @products = @category.products.visible
  end
end

