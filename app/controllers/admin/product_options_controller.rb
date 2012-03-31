class Admin::ProductOptionsController < Admin::BaseController
  
  before_filter :find_product_option, :only => [:show, :edit,  :update, :destroy]
  
  def index
    @product_options = ProductOption.all
  end
 
  def new
    @product_option = ProductOption.new
  end
  
  def create
    @product_option = ProductOption.new(params[:product_option])
    if @product_option.save
      flash[:notice] = "Product option has been created."
      redirect_to admin_product_options_path
    else
      flash[:alert] = "Product option has not been created."
      render :action => "new"
    end
  end
  
  def show      
  end

  def edit
  end

  def update
    if @product_option.update_attributes(params[:product_option])
      flash[:notice] = "Product option has been updated."
      redirect_to [:admin, @product_option]
    else
      flash[:alert] = "Product option has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @product_option.destroy
    flash[:notice] = "Product option has been deleted."
    redirect_to admin_product_options_path
  end

  
  
  private
    def find_product_option
      @product_option = ProductOption.find(params[:id])
    end
end
