class Admin::ProductsController < Admin::BaseController
  before_filter :find_category
   before_filter :find_product, :only => [:show, :edit,  :update, :destroy]
  
  def new
    @product = @category.products.build
  end
 
  def create
    @product = @category.products.build(params[:product].merge!(:user => current_user))
    
    if @product.save
      flash[:notice] = "Product has been created."
      redirect_to [:admin, @category]
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
      redirect_to [:admin, @category]
    else
      flash[:alert] = "Product has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = "Product has been deleted."
    redirect_to [:admin, @category]
  end
 
 private 
  def find_category
    @category = Category.find(params[:category_id])
  end
  def find_product
    @product = @category.products.find(params[:id])
  end 
end
