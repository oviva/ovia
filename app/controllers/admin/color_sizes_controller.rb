class Admin::ColorSizesController < Admin::BaseController
  before_filter :find_product
  before_filter :find_color_size, :only => [:show, :edit, :update, :destroy]
  
  def index
    @color_sizes = @product.color_sizes.all    
  end
  
  def new
     @color_size = @product.color_sizes.build
     @colors = Color.all
     @sizes = Size.all
  end
  
  def create
    @color_size = @product.color_sizes.build(params[:color_size])
    if @color_size.save
      flash[:notice] = "Color Size option  has been created."
      redirect_to admin_product_color_sizes_path(@product)
    else
      flash[:alert] = "Color Size has not been created."
      render :action => "new"
    end
  end
  
  def show
  end
  
  def edit
    @colors = Color.all
    @sizes = Size.all    
  end
  
  def deleate
  end
  
  def update
    if @color_size.update_attributes(params[:color_size])
      flash[:notice] = "Color Size has been updated."
      redirect_to admin_product_color_sizes_path(@product)
    else
      flash[:alert] = "Color Size has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @color_size.destroy
    flash[:notice] = "Color Size has been deleted."
    redirect_to admin_product_color_sizes_path(@product)
  end
  
  
  private  
  def find_product
    @product = Product.find(params[:product_id])  
  end
      
  def find_color_size
    @color_size = @product.color_sizes.find(params[:id])
  end
end
