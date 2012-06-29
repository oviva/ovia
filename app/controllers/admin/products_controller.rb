class Admin::ProductsController < Admin::BaseController
  before_filter :find_category
  before_filter :new_product, :only => [:index, :new]
  before_filter :find_product, :only => [:show, :edit,  :update, :destroy]
  
  def index
    if params[:scope]
       @products = Product.invisible.page(params[:page])
    else 
      @products = Product.visible
    end         
  end
  
  def new
  end
 
  def create
    @product = Product.new(params[:product].merge!(:user => current_user))    
    if @product.save
      flash[:notice] = "Product has been created."
      redirect_to [:admin, @product]
    else
      flash[:alert] = "Product has not been created."
      render :new
    end
  end
  
  def show
    @color_sizes = @product.color_sizes.all    
  end
  
  def edit    
  end
  
  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product has been updated."
      redirect_to [:admin, @product]
    else
      flash[:alert] = "Product has not been updated."
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = "Product has been deleted."
    redirect_to admin_products_path
  end
 
 private 
  def new_product
    @product = Product.new
    @product.images.build
  end
  
  def find_category
    @categories = Category.all
  end
  def find_product
    @product = Product.find(params[:id])
  end 
end
