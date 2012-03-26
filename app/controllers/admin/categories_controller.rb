class Admin::CategoriesController < Admin::BaseController
  
   before_filter :find_category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create    
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to admin_categories_path
    else
      flash[:alert] = "Category has not been created."
      render :action => "new"
    end
  end

  def show
    @products = @category.products.page params[:page]
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category has been updated."
      redirect_to admin_categories_path
    else
      flash[:alert] = "Category has not been updated."
      render :action => "edit"
    end
  end

  def destroy
     @category.destroy
     flash[:notice] = "Category has been deleted."
     redirect_to admin_categories_path
  end

  private  
    def find_category
      @category = Category.find(params[:id])
    end

end
  

