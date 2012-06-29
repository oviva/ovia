class ProductsController < ApplicationController
  def show    
    @product = Product.visible.find(params[:id])                        
    @title =  "#{@product.category.name} #{@product.code}"
    @color_sizes = @product.color_sizes.all
  end
end
