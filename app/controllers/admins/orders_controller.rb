class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 変移元のページによって商品の一覧表示を切り替える
    # 0 = 該当顧客の注文履歴を表示 / 1 =当日注文があった注文履歴を表示 / 指定なし = 注文履歴が全て表示（all）
    case params[:order_sort]
    when "0"
      @customer = Customer.find(params[:customer_id])
      @orders = Order.where(customer_id: @customer.id).page(params[:page])
    when "1"
      @orders = Order.where(created_at: Time.zone.now.all_day).page(params[:page])
    else
      @orders = Order.page(params[:page])
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer_id
    @order_details = OrderDetail.where(order_id: @order.id)
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      # 注文ステータスが1（入金確認）になったら、製作ステータスを1（制作待ち）にする
      if @order.order_status == 1
        @order.order_details.update(making_status: 1)
        redirect_to request.referer
      else
        redirect_to request.referer
      end
    else
      @order = Order.find(params[:id])
      @customer = @order.customer_id
      @order_details = OrderDetail.where(order_id: @order.id)
      render :show
    end
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end

end
