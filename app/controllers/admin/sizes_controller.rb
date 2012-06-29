class Admin::SizesController < Admin::BaseController
  
  before_filter :find_size, :only => [:show, :edit,  :update, :destroy]
  
  def index
    @sizes = Size.all
  end
 
  def new
    @size = Size.new
  end
  
  def create
    @size = Size.new(params[:size])
    if @size.save
      flash[:notice] = "Size has been created."
      redirect_to admin_sizes_path
    else
      flash[:alert] = "Size has not been created."
      render :new
    end
  end
  
  def show      
  end

  def edit
  end

  def update
    if @size.update_attributes(params[:size])
      flash[:notice] = "Size has been updated."
      redirect_to [:admin, @size]
    else
      flash[:alert] = "Size has not been updated."
      render :edit
    end
  end

  def destroy
    @size.destroy
    flash[:notice] = "Size has been deleted."
    redirect_to admin_sizes_path
  end

  
  
  private
    def find_size
      @size = Size.find(params[:id])
    end
end
