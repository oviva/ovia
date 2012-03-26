class Admin::ProductsController < Admin::BaseController
  before_filter :find_category
  before_filter :find_product, :only => [:show, :edit,  :update, :destroy]
  
  def index
    @products = Product.page(params[:page])
  end
  
  def new
    @product = Product.new
  end
 
  def create
    @product = Product.new(params[:product].merge!(:user => current_user))    
    if @product.save
      flash[:notice] = "Product has been created."
      redirect_to admin_products_path
    else
      flash[:alert] = "Product has not been created."
      render :action => "new"
    end
  end
  
  def show
  end
  
  def edit    
  end
  
  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product has been updated."
      redirect_to admin_products_path
    else
      flash[:alert] = "Product has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = "Product has been deleted."
    redirect_to admin_products_path
  end
 
 private 
  def find_category
    @categories = Category.all
  end
  def find_product
    @product = Product.find(params[:id])
  end 
end
