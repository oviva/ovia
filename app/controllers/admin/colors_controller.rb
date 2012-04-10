class Admin::ColorsController < Admin::BaseController
  before_filter :find_color, :only => [:show, :edit,  :update, :destroy]
    
  def index
    @colors = Color.all
  end
 
  def new
    @color = Color.new
  end
  
  def create
    @color = Color.new(params[:color])
    if @color.save
      flash[:notice] = "Color has been created."
      redirect_to admin_colors_path
    else
      flash[:alert] = "Color has not been created."
      render :action => "new"
    end
  end
  
  def show      
  end

  def edit
  end

  def update
    if @color.update_attributes(params[:color])
      flash[:notice] = "Color has been updated."
      redirect_to [:admin, @color]
    else
      flash[:alert] = "Color has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @color.destroy
    flash[:notice] = "Color has been deleted."
    redirect_to admin_colors_path
  end

  
  
  private
    def find_color
      @color = Color.find(params[:id])
    end
end
