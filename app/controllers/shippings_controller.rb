class ShippingsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_shipping, only: [:edit, :update, :destroy]


  def index
  	@shipping = Shipping.new
  	@shippings = current_customer.shippings.all
  end
  
  def create
  	@shipping = Shipping.new(shipping_params)
  	@shipping.customer_id = current_customer.id
  	if @shipping.save
      redirect_to request.referer, notice: "新しい住所の追加が完了しました"
    else
      @shippings = current_customer.shippings.all
      render :index
    end
  end

  def edit
  end

  def update
  	if @shipping.update(shipping_params)
      redirect_to shippings_path, notice: "住所の変更が完了しました"
    else
      render :edit
    end
  end

  def destroy
  	@shipping.destroy
  	redirect_to request.referer, notice: "住所の削除が完了しました"
  end

  private

  def shipping_params
  	params.require(:shipping).permit(:postal_code, :street_address, :name)
  end

  def set_shipping
    @shipping = Shipping.find(params[:id])
  end

end
