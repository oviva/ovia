class Admin::OrdersController < Admin::BaseController
  
  before_filter :find_order, :only => [:show, :edit,  :update, :destroy]
  
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Order has been created."
      redirect_to admin_orders_path
    else
      flash[:alert] = "Order has not been created."
      render :new
    end
  end
  
  def show    
  end
  
  def edit    
  end
  
  def update    
    if @order.update_attributes(params[:order])
      flash[:notice] = "Order has been updated."
      redirect_to admin_order_path(@order)
    else
      flash[:alert] = "Order has not been updated."
      render :edit
    end
  end
  
  def destroy
    @order.destroy
    flash[:notice] = "Order has been deleted."
    redirect_to admin_orders_path
  end
  
  private
    def find_order
      @order = Order.find(params[:id])
    end    
end
