class Admin::PagesController < Admin::BaseController
  
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create    
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page has been created."
      redirect_to admin_pages_path
    else
      flash[:alert] = "Page has not been created."
      render :new
    end
  end

  def show    
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page has been updated."
      redirect_to admin_pages_path
    else
      flash[:alert] = "Page has not been updated."
      render :edit
    end
  end

  def destroy
     @page.destroy
     flash[:notice] = "Page has been deleted."
     redirect_to admin_pages_path
  end

  private  
    def find_page
      @page = Page.find(params[:id])
    end

end
