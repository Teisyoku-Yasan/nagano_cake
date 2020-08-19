class ProductsController < ApplicationController

  def index
  	@product = Product.all
  	@products = Product.page(params[:page]).per(8)
  	@genres = Genre.all
  end

  def show
  	@product = Product.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
