class CartItemsController < ApplicationController
	before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update, :destroy]

  def create
  	@cart_item = current_customer.cart_items.build(cart_item_params)
  	@current_item = CartItem.find_by(product_id: @cart_item.product_id, customer_id: current_customer.id)
  	#カート内に同じ商品がなければ追加、あれば商品数合算
    if @current_item.nil?
  		@cart_item.save
  		redirect_to cart_items_path
  	else
  		sum = @current_item.quantity.to_i + cart_item_params[:quantity].to_i
  		@current_item.update(quantity: sum)
  		redirect_to cart_items_path
  	end

  end

  def index
  	@cart_items = current_customer.cart_items.all
  end

  def update
  	@cart_item.update(cart_item_params)
  	redirect_to request.referer, notice: "カート内の商品の数量が変更されました"
  end

  def destroy
  	@cart_item.destroy
  	redirect_to request.referer, notice: "カート内の商品が削除されました"
  end

  def destroy_all
  	current_customer.cart_items.destroy_all
  	redirect_to request.referer, notice: "カート内の全ての商品が削除されました"
  end

  private

    def cart_item_params
  	 params.require(:cart_item).permit(:product_id, :quantity)
    end

    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end


  end