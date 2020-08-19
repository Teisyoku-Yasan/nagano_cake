class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    # current_customerでいいのか。
    @customer = current_customer
    @order = Order.new
  end
  
  def confirm

  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to order_thanks_path
  end

  def index
    @orders = Order.page(params[:page])
  end
  
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private
    def order_params
      params.require(:order).permit.(:postal_code, :street_address, :name, :payment_method)
    end

end
