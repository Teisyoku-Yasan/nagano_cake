class ShippingsController < ApplicationController
  before_action :authenticate_customer!


  def index
  	@shipping = Shipping.new
  	@shippings = current_customer.shippings.all
  end

  def create
  	@shipping = Shipping.new(shipping_params)
  	@shipping.customer_id = current_customer.id
  	@shipping.save
  	redirect_to request.referer
  end

  def edit
  	@shipping = Shipping.find(params[:id])
  end

  def update
  	@shipping = Shipping.find(params[:id])
  	@shipping.update(shipping_params)
  	redirect_to shippings_path
  end

  def destroy
  	@shipping = Shipping.find(params[:id])
  	@shipping.destroy
  	redirect_to request.referer
  end

  private

  def shipping_params
  	params.require(:shipping).permit(:postal_code, :street_address, :name)
  end
end
