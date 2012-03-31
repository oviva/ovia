class ProductsController < ApplicationController
  def show
    @product = Product.visible.find(params[:id])
  end
end
