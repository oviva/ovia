class ProductsController < ApplicationController
  def show    
    @product = Product.visible.find(params[:id])                        
    @title =  "#{@product.category.name} #{@product.code}"
  end
end
