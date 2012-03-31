class Admin::ProductOptionVariationsController < Admin::BaseController
  
  before_filter :find_product_option
  before_filter :find_product_option_variation, :only => [:show, :edit,  :update, :destroy]
  
  def new
    @product_option_variation = @product_option.product_option_variations.build
    
  end
  
  def create
    @product_option_variation = @product_option.product_option_variations.build(params[:product_option_variation])
    if @product_option_variation.save      
      flash[:notice] = "Product option variation has been created."
      redirect_to [:admin, @product_option]
    else
      flash[:alert] = "Product option variation has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @product_option_variation.update_attributes(params[:product_option_variation])
      flash[:notice] = "Product option variation has been updated."
      redirect_to [:admin, @product_option]
    else
      flash[:alert] = "Product option variation has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
     @product_option_variation.destroy
      flash[:notice] = "Product option variation has been deleted."
      redirect_to [:admin, @product_option]
  end
  
  private  
    def find_product_option
      @product_option = ProductOption.find(params[:product_option_id])      
    end
        
    def find_product_option_variation
      @product_option_variation = @product_option.product_option_variations.find(params[:id])
    end

end
