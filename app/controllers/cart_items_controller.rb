class CartItemsController < ApplicationController
	before_action :authenticate_customer!

  def create
  	@product = Product.find(params[:cart_item][:product_id])
  	@cart_item = CartItem.new(product_id = @product.id, customer_id = current_customer.id)
  	@cart_item.save
  	redirect_to cart_items_path

  end

  def index
  	@cart_items = CartItem.find(customer_id = current_customer.id)
  end


end
