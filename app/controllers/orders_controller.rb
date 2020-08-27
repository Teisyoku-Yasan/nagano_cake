class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer
  
  def index
    # 自分自身のユーザIDの注文履歴しか表示されないようにする
    @orders = Order.where(customer_id: current_customer.id).page(params[:page]).reverse_order
  end
  
  def create
    # カートに商品があれば「@order」を保存、カートが空であれば「cart_items」ページに戻る
    if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      # 住所のラジオボタン選択に応じて引数を調整
      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.postal_code = @customer.postal_code
          @order.street_address = @customer.shipping
          @order.name = full_name(@customer)
        when 2
          @order.postal_code = params[:order][:postal_code]
          @order.street_address = params[:order][:street_address]
          @order.name = params[:order][:name]
        when 3
          @order.postal_code = params[:order][:postal_code]
          @order.street_address = params[:order][:street_address]
          @order.name = params[:order][:name]
      end
      
      # @orderをセーブ
      @order.save

      # shippingで住所モデル検索、該当データなければ新規作成
      if Shipping.find_by(street_address: @order.street_address).nil?
        @shipping = Shipping.new
        @shipping.postal_code = @order.postal_code
        @shipping.street_address = @order.street_address
        @shipping.name = @order.name
        @shipping.customer_id = current_customer.id
        @shipping.save
      end

      # cart_itemsの内容をorder_detailsに新規登録
      current_customer.cart_items.each do |cart_item|
        order_detail = @order.order_details.build
        order_detail.order_id = @order.id
        order_detail.product_id = cart_item.product_id
        order_detail.quantity = cart_item.quantity
        order_detail.price = cart_item.product.price
        order_detail.save
        cart_item.destroy #order_detailに情報を移したらcart_itemは消去
      end

    render :thanks

    else
      redirect_to cart_items_path, notice: "カートが空です"
    end

  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id != current_customer.id
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postal_code = @customer.postal_code
        @order.street_address = @customer.street_address
        @order.name = @customer.last_name + @customer.first_name
      when 2
        @sta = params[:order][:street_address].to_i
        @shipping_address = Shipping.find(@sta)
        @order.postal_code = @shipping_address.postal_code
        @order.street_address = @shipping_address.street_address
        @order.name = @shipping_address.name
      when 3
        @order.postal_code = params[:order][:new_add][:postal_code]
        @order.street_address = params[:order][:new_add][:street_address]
        @order.name = params[:order][:new_add][:name]
    end
  end

  def thanks
  end

  
  private
    def set_customer
      @customer = current_customer
    end

    def order_params
      params.require(:order).permit(
        :customer_id,
        :postal_code,
        :street_address,
        :name,
        :total_price,
        :payment_method,
        order_details_attributes:[:product_id, :order_id, :quantity, :price]
      )
    end

end
